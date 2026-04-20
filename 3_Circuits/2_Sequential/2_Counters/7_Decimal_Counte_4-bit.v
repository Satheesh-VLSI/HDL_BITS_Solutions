module top_module (
    input clk,
    input reset,   // Synchronous active-high reset
    output [3:1] ena,
    output [15:0] q);

    assign ena[1]=(q[3:0]==9);
    assign ena[2]=(q[3:0]==9 && q[7:4]==9);
    assign ena[3]=(q[3:0]==9 && q[7:4]==9 && q[11:8]==9);
    
    bcd(clk,reset,1'b1,q[3:0]);
    bcd(clk,reset,ena[1],q[7:4]);
    bcd(clk,reset,ena[2],q[11:8]);
    bcd(clk,reset,ena[3],q[15:12]);
endmodule

module bcd(
	input clk,
	input reset,
	input enable,
	output reg [3:0] Q);
    
     always @(posedge clk) begin
        if (reset)
            Q <= 4'd0;              // synchronous reset to 0
        else if (enable) begin
            if (Q == 4'd9)
                Q <= 4'd0;          // wrap around (mod-10)
            else
                Q <= Q + 1;         // increment
        end
    end

endmodule
