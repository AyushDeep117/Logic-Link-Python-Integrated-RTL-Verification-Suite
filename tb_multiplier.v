module tb_multiplier;
    reg [3:0] a, b;
    wire [7:0] product;
    integer i, j;

    multiplier_4bit uut (a, b, product);

    initial begin
        $display("Starting Simulation...");
        for (i = 0; i < 16; i = i + 1) begin
            for (j = 0; j < 16; j = j + 1) begin
                a = i; b = j;
                #10;
                if (product !== (i * j))
                    $display("TIME: %0t | ERROR: Input %d * %d | Expected %d | Got %d", $time, a, b, i*j, product);
                else
                    $display("TIME: %0t | PASS: Input %d * %d", $time, a, b);
            end
        end
        $display("Simulation Finished.");
        $finish;
    end
endmodule