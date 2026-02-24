module alu #(parameter WIDTH = 8) (
    input [WIDTH-1:0] a,
    input [WIDTH-1:0] b,
    input [3:0] opcode,
    output reg [WIDTH*2-1:0] result
);

    always @(*) begin
        case(opcode)
            4'b0000: result = a + b;           // ADD
            4'b0001: result = a - b;           // SUB
            4'b0010: result = a * b;           // MUL
            4'b0011: result = a & b;           // AND
            4'b0100: result = a | b;           // OR
            4'b0101: result = a ^ b;           // XOR
            4'b0110: result = ~(a | b);        // NOR
            4'b0111: result = ~(a & b);        // NAND
            4'b1000: result = a << 1;          // LSL
            4'b1001: result = a >> 1;          // LSR
            4'b1010: result = (a > b) ? 1 : 0; // CMP (Greater)
            4'b1011: result = (a == b) ? 1 : 0;// CMP (Equal)
            4'b1100: result = a + 1;           // INC
            4'b1101: result = a - 1;           // DEC
            4'b1110: result = ~a;              // NOT
            4'b1111: result = {a[WIDTH-1:0], b[WIDTH-1:0]}; // CONCAT
            default: result = 0;
        endcase
    end
endmodule