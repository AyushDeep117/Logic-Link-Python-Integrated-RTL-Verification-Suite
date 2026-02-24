module tb_alu;
    parameter W = 8;
    reg [W-1:0] a, b;
    reg [3:0] opcode;
    wire [W*2-1:0] result;

    alu #(W) uut (.a(a), .b(b), .opcode(opcode), .result(result));

    integer i;
    initial begin
        $display("Starting Automated ALU Regression...");
        for (i = 0; i < 16; i = i + 1) begin
            repeat (10) begin
                a = $random % 256;
                b = $random % 256;
                opcode = i;
                #10;
                $display("TIME: %0t | OP: %d | A: %d | B: %d | RESULT: %d", $time, opcode, a, b, result);
            end
        end
        $display("Simulation Finished.");
        $finish;
    end
endmodule