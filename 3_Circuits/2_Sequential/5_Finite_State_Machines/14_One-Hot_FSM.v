module top_module(
    input in,
    input [9:0] state,
    output reg [9:0] next_state,
    output out1,
    output out2);

    localparam s0=1, s1=2, s2=4, s3=8, s4=16, s5=32, s6=64, s7=128, s8=256, s9=512;
    
    always @(*) begin
        if (state == 0) begin
            next_state = 0;
        end else begin
            next_state = 0;
            if (state[0]) next_state |= (in ? s1 : s0);
            if (state[1]) next_state |= (in ? s2 : s0);
            if (state[2]) next_state |= (in ? s3 : s0);
            if (state[3]) next_state |= (in ? s4 : s0);
            if (state[4]) next_state |= (in ? s5 : s0);
            if (state[5]) next_state |= (in ? s6 : s8);
            if (state[6]) next_state |= (in ? s7 : s9);
            if (state[7]) next_state |= (in ? s7 : s0);
            if (state[8]) next_state |= (in ? s1 : s0);
            if (state[9]) next_state |= (in ? s1 : s0);
        end
    end

    assign out1 = state[8] | state[9];
    assign out2 = state[7] | state[9];

endmodule
