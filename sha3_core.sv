`default_nettype none



module keccak_round
    (input logic [4:0][4:0][63:0] state,
     input logic [4:0] round,
     output logic [4:0][4:0][63:0] out);

    logic [4:0][63:0] theta1, theta2;
    logic [4:0][4:0][63:0] theta_out, rho_pi_out, chi_out;



    generate
    genvar x, y;
        // theta step
        for (x = 0; x < 5; x = x+1) begin
            assign theta1[x] = state[x][0] ^ state[x][1] ^ state[x][2] ^ state[x][3] ^ state[x][4];
            assign theta2[x] = theta1[mod5(x+4)] ^ rotl64(theta1[mod5(x+1)],1);
        end

        for (x = 0; x < 5; x = x+1) begin
            for (y = 0; y < 5; y = y+1) begin
                assign theta_out[x][y] = state[x][y] ^ theta2[x];
            end
        end

        // rho pi step
        for (x = 0; x < 5; x = x+1) begin
          for (y = 0; y < 5; y = y+1) begin
            localparam rpx = rho_pi_x(x, y);
            assign rho_pi_out[y][rpx] = rotl64(theta_out[x][y], rc(x,y));
          end
        end

        // chi step
        for (x = 0; x < 5; x = x+1) begin
            for (y = 0; y < 5; y = y+1) begin
                assign chi_out[x][y] = rho_pi_out[x][y] ^ ((~rho_pi_out[mod5(x+1)][y]) & rho_pi_out[mod5(x+2)][y]);
            end
        end

        //iota step
        assign out[0][0] = chi_out[0][0] ^ roundc(round);

        //assign rest of output
        for (x = 1; x < 5; x = x + 1) begin
            assign out[x][0] = chi_out[x][0];
        end
        for (y = 1; y < 5; y = y + 1) begin
            assign out[0][y] = chi_out[0][y];
        end
        for (x = 1; x < 5; x = x + 1) begin
            for (y = 1; y < 5; y = y + 1) begin
                assign out[x][y] = chi_out[x][y];
            end
        end

    endgenerate



endmodule: keccak_round

module keccak_f
    (input logic clk, rdy,
     input logic [4:0][4:0][63:0] state_in,
     output logic out_rdy,
     output logic [4:0][4:0][63:0] state_out);

    logic [4:0][4:0][63:0] state_d, state_q;
    logic [4:0] round;
    logic reg_en;

    always_ff @(posedge clk) begin
        if (rdy)
            round <= 'd0;
        else if (round == 'd23)
            round <= 'd23;
        else
            round <= round + 1;
    end
    assign out_rdy = round == 'd23;
    assign state_d = (rdy) ? state_in : state_out;

    state_register sr(.clk, .en(1'b1), .clear(1'b0), .rst_l(1'b1),
                      .state_in(state_d), .state_out(state_q));

    keccak_round kr (state_q, round, state_out);


endmodule: keccak_f


