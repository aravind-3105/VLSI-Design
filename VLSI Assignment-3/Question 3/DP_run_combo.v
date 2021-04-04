`timescale 1ns/1ps
module DataPath (
        input clk,
        input rst,
        input [15:0] X,
        input [15:0] Y,
        output reg [15:0] Z,
        output ZEQ_Flag,
        output LEQ_Flag,
        output reg [15:0] XR,
        output reg [15:0] YR,
        output SelectXY,
        output subFlag,
        output swapFlag,
        output loadXR,
        output loadYR,
        output D0,
        output D1
        );
        initial begin
                Z <=0;
        end
        always @(X or Y or rst) begin
                if(!rst) begin
                        XR=X;
                        YR=Y;
                end
                else begin
                        XR=0;
                        YR=0;
                        Z=0;
                end
        end
        assign ZEQ_Flag = (XR>0);
        assign LEQ_Flag = (XR>=YR);
        always @(negedge clk or X or Y) begin
                if(swapFlag )
                begin
                        XR <=YR;
                        YR <=XR;
                end
                if(subFlag)
                begin
                        XR <= XR - YR;
                end
                if(SelectXY & loadXR)
                begin
                        XR <=X;
                end
                if(SelectXY & loadYR)
                begin
                        YR <=Y;
                end
        end

        always @(XR) begin
                if(!ZEQ_Flag) 
                begin
                    Z <= YR;
                end
        end
        CP CP(.clk(clk),
                    // .rst(rst),
                    .I0(ZEQ_Flag),
                    .I1(LEQ_Flag),
                    .D0(D0),
                    .D1(D1),
                    .Subtract(subFlag),
                    .Swap(swapFlag),
                    .LoadXR(loadXR),
                    .LoadYR(loadYR),
                    .SelectXY(SelectXY));
    
endmodule