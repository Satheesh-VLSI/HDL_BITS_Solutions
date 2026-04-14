/* Implement the circuit:
 A0 ──┐      A1 ──┐      A2 ──┐      A3 ──┐
      │           │           │           │
 B0 ──┼─►[ FA ]──►┼─►[ FA ]──►┼─►[ FA ]──►┼─►[ FA ]──► Cout
      │   S0      │   S1      │   S2      │   S3
Cin ──┘           │           │           │
                  │           │           │
                 C1          C2          C3*/

module top_module (
    input [3:0] x,
    input [3:0] y, 
    output [4:0] sum);
    assign sum=x+y;
endmodule
