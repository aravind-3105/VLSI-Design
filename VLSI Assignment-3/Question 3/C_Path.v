`timescale 1ns/1ps
module CP (
    input clk,
    // input rst,
    input I0,   //I0 = (XR>0)
    input I1,    //I1 = (XR>=YR)
    output reg D0,
    output reg D1,
    output Subtract,
    output Swap,
    output LoadXR,
    output LoadYR,
    output SelectXY
    );  
    // reg DX;
    // reg DY;

    initial begin
        D0 = 1'h0;
        D1 = 1'h0;
    end

    // always @(*) begin
        assign Subtract = (D0 && ~D1);
        assign Swap     = (~D0 && D1);
        assign LoadYR   = ~D0;
        assign LoadXR   = (~D1 || ~D0);
        assign SelectXY = (~D1 && ~D0);
    // end
    always @(posedge clk) begin
        D0  <= ~I0 || I1 || D1;
        D1  <= (D0 && D1) || (~I0 && ~D1) || (~I1 && ~D1);
    end

endmodule