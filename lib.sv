`default_nettype none



function logic [2:0] mod5 (input logic [3:0] in);

    unique case (in)
        'd0: mod5 = 'd0;
        'd1: mod5 = 'd1;
        'd2: mod5 = 'd2;
        'd3: mod5 = 'd3;
        'd4: mod5 = 'd4;
        'd5: mod5 = 'd0;
        'd6: mod5 = 'd1;
        'd7: mod5 = 'd2;
        'd8: mod5 = 'd3;
        'd9: mod5 = 'd4;
    endcase

endfunction: mod5

function logic [63:0] rotl64
    (input logic [63:0] in,
     input logic [5:0] shift);


    assign rotl64 = (in << shift) | (in >> (64 - shift));


endfunction: rotl64


