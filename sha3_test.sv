`default_nettype none

module test;
    logic [4:0][4:0][63:0] st, out;
    logic [4:0] round;
    logic clk, rdy, out_rdy, rst_l;


    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end
    //logic [4:0][63:0] out;

    //keccak_f_simple kf(st, out);
    keccak_f(clk, rdy, st, out_rdy, out);
    //keccak_f_fsm(clk, rst_l, rdy, st, out_rdy, out);
    integer i, j;
    initial begin
        $monitor($time,,"st[0]=%h, st[1]=%h, out[0]=%h, out[1]=%h, out[2]=%h, out_rdy=%b", st[0][0], st[1][0], out[0][0], out[1][0], out[2][0], out_rdy);
        for (i = 0; i < 5; i=i+1) begin
            for (j = 0; j < 5; j=j+1) begin
                st[i][j] <= 0;
            end
        end
        st[0][0] <= 'h0D09DE907CCC2F9F;
        st[1][0] <= 'hEAC118977ECD876B;
        st[2][0] <= 'hE95D2DFE1811B26C;
        st[3][0] <= 'h109C1EACB65D7EF9;
        st[4][0] <= 'h6;
        st[1][3] <= 'h8000000000000000;
        round <= 'd3;
        rdy <= 1'b1;
        @(posedge clk);
        rdy <= 1'b0;
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        @(posedge clk);
        $finish;
    end



endmodule: test
