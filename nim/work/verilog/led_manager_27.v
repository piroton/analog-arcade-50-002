/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

/*
   Parameters:
     ROW = ROW
     COL = COL
*/
module led_manager_27 (
    input clk,
    input rst,
    input [9:0] leftstack,
    input [9:0] middlestack,
    input [9:0] rightstack,
    output reg [119:0] led_output
  );
  
  localparam ROW = 4'ha;
  localparam COL = 3'h6;
  
  
  always @* begin
    led_output[0+0+1+0-:1] = leftstack[0+0-:1];
    led_output[12+0+1+0-:1] = leftstack[1+0-:1];
    led_output[24+0+1+0-:1] = leftstack[2+0-:1];
    led_output[36+0+1+0-:1] = leftstack[3+0-:1];
    led_output[48+0+1+0-:1] = leftstack[4+0-:1];
    led_output[60+0+1+0-:1] = leftstack[5+0-:1];
    led_output[72+0+1+0-:1] = leftstack[6+0-:1];
    led_output[84+0+1+0-:1] = leftstack[7+0-:1];
    led_output[96+0+1+0-:1] = leftstack[8+0-:1];
    led_output[108+0+1+0-:1] = leftstack[9+0-:1];
    led_output[0+2+1+0-:1] = leftstack[0+0-:1];
    led_output[12+2+1+0-:1] = leftstack[1+0-:1];
    led_output[24+2+1+0-:1] = leftstack[2+0-:1];
    led_output[36+2+1+0-:1] = leftstack[3+0-:1];
    led_output[48+2+1+0-:1] = leftstack[4+0-:1];
    led_output[60+2+1+0-:1] = leftstack[5+0-:1];
    led_output[72+2+1+0-:1] = leftstack[6+0-:1];
    led_output[84+2+1+0-:1] = leftstack[7+0-:1];
    led_output[96+2+1+0-:1] = leftstack[8+0-:1];
    led_output[108+2+1+0-:1] = leftstack[9+0-:1];
    led_output[0+4+1+0-:1] = middlestack[0+0-:1];
    led_output[12+4+1+0-:1] = middlestack[1+0-:1];
    led_output[24+4+1+0-:1] = middlestack[2+0-:1];
    led_output[36+4+1+0-:1] = middlestack[3+0-:1];
    led_output[48+4+1+0-:1] = middlestack[4+0-:1];
    led_output[60+4+1+0-:1] = middlestack[5+0-:1];
    led_output[72+4+1+0-:1] = middlestack[6+0-:1];
    led_output[84+4+1+0-:1] = middlestack[7+0-:1];
    led_output[96+4+1+0-:1] = middlestack[8+0-:1];
    led_output[108+4+1+0-:1] = middlestack[9+0-:1];
    led_output[0+6+1+0-:1] = middlestack[0+0-:1];
    led_output[12+6+1+0-:1] = middlestack[1+0-:1];
    led_output[24+6+1+0-:1] = middlestack[2+0-:1];
    led_output[36+6+1+0-:1] = middlestack[3+0-:1];
    led_output[48+6+1+0-:1] = middlestack[4+0-:1];
    led_output[60+6+1+0-:1] = middlestack[5+0-:1];
    led_output[72+6+1+0-:1] = middlestack[6+0-:1];
    led_output[84+6+1+0-:1] = middlestack[7+0-:1];
    led_output[96+6+1+0-:1] = middlestack[8+0-:1];
    led_output[108+6+1+0-:1] = middlestack[9+0-:1];
    led_output[0+8+1+0-:1] = rightstack[0+0-:1];
    led_output[12+8+1+0-:1] = rightstack[1+0-:1];
    led_output[24+8+1+0-:1] = rightstack[2+0-:1];
    led_output[36+8+1+0-:1] = rightstack[3+0-:1];
    led_output[48+8+1+0-:1] = rightstack[4+0-:1];
    led_output[60+8+1+0-:1] = rightstack[5+0-:1];
    led_output[72+8+1+0-:1] = rightstack[6+0-:1];
    led_output[84+8+1+0-:1] = rightstack[7+0-:1];
    led_output[96+8+1+0-:1] = rightstack[8+0-:1];
    led_output[108+8+1+0-:1] = rightstack[9+0-:1];
    led_output[0+10+1+0-:1] = rightstack[0+0-:1];
    led_output[12+10+1+0-:1] = rightstack[1+0-:1];
    led_output[24+10+1+0-:1] = rightstack[2+0-:1];
    led_output[36+10+1+0-:1] = rightstack[3+0-:1];
    led_output[48+10+1+0-:1] = rightstack[4+0-:1];
    led_output[60+10+1+0-:1] = rightstack[5+0-:1];
    led_output[72+10+1+0-:1] = rightstack[6+0-:1];
    led_output[84+10+1+0-:1] = rightstack[7+0-:1];
    led_output[96+10+1+0-:1] = rightstack[8+0-:1];
    led_output[108+10+1+0-:1] = rightstack[9+0-:1];
  end
endmodule