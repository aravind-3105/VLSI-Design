`timescale 1ns/1ps
module tb;
    reg clk;
    reg rst;
    reg I0;
    reg I1;
    wire Subtract;
    wire Swap;
    wire LoadXR;
    wire LoadYR;
    wire SelectXY;
    wire D0;
    wire D1;

    ControlPath CP(.clk(clk),
                    .rst(rst),
                    .I0(I0),
                    .I1(I1),
                    .D0(D0),
                    .D1(D1),
                    .Subtract(Subtract),
                    .Swap(Swap),
                    .LoadXR(LoadXR),
                    .LoadYR(LoadYR),
                    .SelectXY(SelectXY));
    initial clk = 0;

    initial begin
        $dumpfile("DUMB_ControlPath.vcd");
     	$dumpvars(0,tb);
        // <# of bits>'b<binary value>
        rst = 1'b0; I0 = 1'b0; I1 = 1'b0; #10;
                    I0 = 1'b1; I1 = 1'b0; #20;
                    I0 = 1'b0; I1 = 1'b0; #20;
                    I0 = 1'b1; I1 = 1'b0; #20;
                    I0 = 1'b1; I1 = 1'b1; #20;

                    I0 = 1'b1; I1 = 1'b1; #20;
                    I0 = 1'b0; I1 = 1'b0; #20;

                    I0 = 1'b1; I1 = 1'b0; #20;
        $finish;
    end
    always #10 clk = ~clk;
endmodule