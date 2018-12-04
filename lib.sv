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


function logic [5:0] rc
    (input logic [2:0] x, y);

    unique case (x)
    'd0: begin
        unique case (y)
        'd0: rc = 'd0;
        'd1: rc = 'd36;
        'd2: rc = 'd3;
        'd3: rc = 'd41;
        'd4: rc = 'd18;
        endcase
    end
    'd1: begin
        unique case (y)
        'd0: rc = 'd1;
        'd1: rc = 'd44;
        'd2: rc = 'd10;
        'd3: rc = 'd45;
        'd4: rc = 'd2;
        endcase
    end
    'd2: begin
        unique case (y)
        'd0: rc = 'd62;
        'd1: rc = 'd6;
        'd2: rc = 'd43;
        'd3: rc = 'd15;
        'd4: rc = 'd61;
        endcase
    end
    'd3: begin
        unique case (y)
        'd0: rc = 'd28;
        'd1: rc = 'd55;
        'd2: rc = 'd25;
        'd3: rc = 'd21;
        'd4: rc = 'd56;
        endcase
    end
    'd4: begin
        unique case (y)
        'd0: rc = 'd27;
        'd1: rc = 'd20;
        'd2: rc = 'd39;
        'd3: rc = 'd8;
        'd4: rc = 'd14;
        endcase
    end

    endcase
endfunction: rc

function logic [2:0] rho_pi_x
    (input logic [2:0] x, y);

    unique case (x)
    'd0: begin
        unique case (y)
        'd0: rho_pi_x = 'd0;
        'd1: rho_pi_x = 'd3;
        'd2: rho_pi_x = 'd1;
        'd3: rho_pi_x = 'd4;
        'd4: rho_pi_x = 'd2;
        endcase
    end
    'd1: begin
        unique case (y)
        'd0: rho_pi_x = 'd2;
        'd1: rho_pi_x = 'd0;
        'd2: rho_pi_x = 'd3;
        'd3: rho_pi_x = 'd1;
        'd4: rho_pi_x = 'd4;
        endcase
    end
    'd2: begin
        unique case (y)
        'd0: rho_pi_x = 'd4;
        'd1: rho_pi_x = 'd2;
        'd2: rho_pi_x = 'd0;
        'd3: rho_pi_x = 'd3;
        'd4: rho_pi_x = 'd1;
        endcase
    end
    'd3: begin
        unique case (y)
        'd0: rho_pi_x = 'd1;
        'd1: rho_pi_x = 'd4;
        'd2: rho_pi_x = 'd2;
        'd3: rho_pi_x = 'd0;
        'd4: rho_pi_x = 'd3;
        endcase
    end
    'd4: begin
        unique case (y)
        'd0: rho_pi_x = 'd3;
        'd1: rho_pi_x = 'd1;
        'd2: rho_pi_x = 'd4;
        'd3: rho_pi_x = 'd2;
        'd4: rho_pi_x = 'd0;
        endcase
    end

    endcase
endfunction: rho_pi_x

function logic [63:0] roundc(input logic [4:0] round);

    unique case (round)
        'd0: roundc = 64'h0000000000000001;
        'd1: roundc = 64'h0000000000008082;
        'd2: roundc = 64'h800000000000808A;
        'd3: roundc = 64'h8000000080008000;
        'd4: roundc = 64'h000000000000808B;
        'd5: roundc = 64'h0000000080000001;
        'd6: roundc = 64'h8000000080008081;
        'd7: roundc = 64'h8000000000008009;
        'd8: roundc = 64'h000000000000008A;
        'd9: roundc = 64'h0000000000000088;
        'd10: roundc = 64'h0000000080008009;
        'd11: roundc = 64'h000000008000000A;
        'd12: roundc = 64'h000000008000808B;
        'd13: roundc = 64'h800000000000008B;
        'd14: roundc = 64'h8000000000008089;
        'd15: roundc = 64'h8000000000008003;
        'd16: roundc = 64'h8000000000008002;
        'd17: roundc = 64'h8000000000000080;
        'd18: roundc = 64'h000000000000800A;
        'd19: roundc = 64'h800000008000000A;
        'd20: roundc = 64'h8000000080008081;
        'd21: roundc = 64'h8000000000008080;
        'd22: roundc = 64'h0000000080000001;
        'd23: roundc = 64'h8000000080008008;
    endcase

endfunction: roundc
