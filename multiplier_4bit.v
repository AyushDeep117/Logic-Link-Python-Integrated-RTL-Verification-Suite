// 4-bit Multiplier RTL
module multiplier_4bit (
    input [3:0] a,
    input [3:0] b,
    output [7:0] product
);
    assign product = a * b; // In a real interview, be ready to discuss 
                            // the logic gates behind this '*' operator.
endmodule