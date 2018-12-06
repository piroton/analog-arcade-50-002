/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module comparator_35 (
    input [5:0] opcode,
    input z,
    input n,
    input v,
    output reg comparator
  );
  
  
  
  always @* begin
    
    case (opcode[1+1-:2])
      2'h0: begin
        comparator = 1'h0;
      end
      2'h1: begin
        comparator = z;
      end
      2'h2: begin
        comparator = n ^ v;
      end
      2'h3: begin
        comparator = z | (n ^ v);
      end
      default: begin
        comparator = 1'h0;
      end
    endcase
  end
endmodule
