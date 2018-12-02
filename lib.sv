`default_nettype none



module mod5 (input logic [3:0] in, output logic [2:0] out);

    always_comb begin
        unique case (in)
            'd0: out = 'd0;
            'd1: out = 'd1;
            'd2: out = 'd2;
            'd3: out = 'd3;
            'd4: out = 'd4;
            'd5: out = 'd0;
            'd6: out = 'd1;
            'd7: out = 'd2;
            'd8: out = 'd3;
            'd9: out = 'd4;
        endcase
    end

endmodule: mod5

module rotl64
    (input logic [63:0] in,
     input logic [5:0] shift,
     output logic [63:0] out);

    logic [63:0] temp;

    always_comb begin
       out = (in << shift) | (in >> (64 - shift));
    end


endmodule: rotl64

