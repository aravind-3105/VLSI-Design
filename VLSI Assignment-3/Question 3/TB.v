`timescale 1ns/1ps
module tb;
    reg clk;
    reg rst;
    reg [15:0] X;
    reg [15:0] Y;
    wire [15:0] Z;
    wire ZEQ_Flag;
    wire LEQ_Flag;
    wire [15:0] XR;
    wire [15:0] YR;
    wire SelectXY;
    wire subFlag;
    wire swapFlag;
    wire loadXR;
    wire loadYR;

    DataPath CP1(.clk(clk),
                    .rst(rst),
                    .X(X),
                    .Y(Y),
                    .Z(Z),
                    .ZEQ_Flag(ZEQ_Flag),
                    .LEQ_Flag(LEQ_Flag),
                    .XR(XR),
                    .YR(YR),
                    .subFlag(subFlag),
                    .swapFlag(swapFlag),
                    .loadXR(loadXR),
                    .loadYR(loadYR),
                    .SelectXY(SelectXY),
                    .D0(D0),
                    .D1(D1));
    initial clk = 0;
    
    initial begin
        $dumpfile("DUMB_OOOLALA.vcd");
     	$dumpvars(0,tb);
        rst = 1'b1; X = 16'd25; Y = 16'd15; #10; 
        rst = 1'b0;
        #300;
        // rst = 1'b1; X = 16'd24; Y = 16'd3; #10; 
        // rst = 1'b0;
        // #400;
        $finish;
    end
    always #10 clk = ~clk;
endmodule