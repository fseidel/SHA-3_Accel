`default_nettype none



module keccak_round
    (input logic [4:0][4:0][63:0] state,
     output logic [4:0][4:0][63:0] out);

    logic [4:0][63:0] theta1, theta2;
    logic [4:0][4:0][63:0] theta_out;

    logic [4:0][4:0][63:0] rho_pi_out;


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
                assign rho_pi_out[y][rho_pi_x(x, y)] = rotl64(theta_out[x][y], rc(x,y));
            end
        end

        // chi step
        for (x = 0; x < 5; x = x+1) begin
            for (y = 0; y < 5; y = y+1) begin
                assign out[x][y] = rho_pi_out[x][y] ^ ((~rho_pi_out[mod5(x+1)][y]) & rho_pi_out[mod5(x+2)][y]);
            end
        end


    endgenerate



endmodule: keccak_round


module test;
    logic [4:0][4:0][63:0] st, out;
    //logic [4:0][63:0] out;

    //keccak_f_simple kf(st, out);
    keccak_round kr(st, out);
    integer i, j;
    initial begin
        $monitor($time,,"st[0]=%h, out[0]=%h, st[9]=%h, out[1]=%h", st[0][0], out[0][0], st[1][4],out[0][1]);
        for (i = 0; i < 5; i=i+1) begin
            for (j = 0; j < 5; j=j+1) begin
                st[i][j] = 0;
            end
        end
        st[0][0] = 'h1234;
        st[1][0] = 'habcd;
        st[0][1] = 'hfeec;
        st[1][1] = 'h1ace;
        #5
        $finish;
    end



endmodule: test
