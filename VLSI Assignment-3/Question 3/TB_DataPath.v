`timescale 1ns/1ps
module tb;
    reg clk;
    reg rst;
    reg [15:0] X;
    reg [15:0] Y;
    wire [15:0] Z;
    reg subFlag;
    reg swapFlag;
    reg SelectXY;
    reg loadXR;
    reg loadYR;
    wire ZEQ_Flag;
    wire LEQ_Flag;
    wire [15:0] XR;
    wire [15:0] YR;

    DataPath CP(.clk(clk),
                    .rst(rst),
                    .X(X),
                    .Y(Y),
                    .Z(Z),
                    .SelectXY(SelectXY),
                    .subFlag(subFlag),
                    .swapFlag(swapFlag),
                    .loadXR(loadXR),
                    .loadYR(loadYR),
                    .ZEQ_Flag(ZEQ_Flag),
                    .LEQ_Flag(LEQ_Flag),
                    .XR(XR),
                    .YR(YR));
    initial clk = 1;
    
    initial begin
        $dumpfile("DUMB_DataPath.vcd");
     	$dumpvars(0,tb);
        // <# of bits>'b<binary value>
        rst = 1'b1; X = 16'd0; Y = 16'd0;    subFlag = 1'd0; swapFlag = 1'd0; SelectXY=1'd0; loadXR = 1'd0; loadYR = 1'd0;  #20;
        rst = 1'b0; X = 16'd25; Y = 16'd15;  subFlag = 1'd0; swapFlag = 1'd0; SelectXY=1'd1; loadXR = 1'd1; loadYR = 1'd1;  #20;
        rst = 1'b0; X = 16'd25; Y = 16'd15;  subFlag = 1'd1; swapFlag = 1'd0; SelectXY=1'd0; loadXR = 1'd1; loadYR = 1'd0;  #20;
        rst = 1'b0; X = 16'd25; Y = 16'd15;  subFlag = 1'd0; swapFlag = 1'd1; SelectXY=1'd0; loadXR = 1'd1; loadYR = 1'd1;  #20;
        rst = 1'b0; X = 16'd25; Y = 16'd15;  subFlag = 1'd1; swapFlag = 1'd0; SelectXY=1'd0; loadXR = 1'd1; loadYR = 1'd0;  #20;
        rst = 1'b0; X = 16'd25; Y = 16'd15;  subFlag = 1'd0; swapFlag = 1'd1; SelectXY=1'd0; loadXR = 1'd1; loadYR = 1'd1;  #20;
        rst = 1'b0; X = 16'd25; Y = 16'd15;  subFlag = 1'd1; swapFlag = 1'd0; SelectXY=1'd0; loadXR = 1'd1; loadYR = 1'd0;  #20;
        rst = 1'b0; X = 16'd25; Y = 16'd15;  subFlag = 1'd0; swapFlag = 1'd1; SelectXY=1'd0; loadXR = 1'd1; loadYR = 1'd1;  #20;
        rst = 1'b0; X = 16'd25; Y = 16'd15;  subFlag = 1'd1; swapFlag = 1'd0; SelectXY=1'd0; loadXR = 1'd1; loadYR = 1'd0;  #40;
        // rst = 1'b0; X = 16'd25; Y = 16'd15; SelectXY=1'd1; subFlag = 1'd0; swapFlag = 1'd0; loadXR = 1'd1; loadYR = 1'd1;  #40;
        // rst = 1'b0; X = 16'd25; Y = 16'd15; SelectXY=1'd1; subFlag = 1'd0; swapFlag = 1'd0; loadXR = 1'd1; loadYR = 1'd1;  #40;
        $finish;
    end
    always #10 clk = ~clk;
endmodule