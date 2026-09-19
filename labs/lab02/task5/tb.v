module tb;

reg [3:0] t_a, t_b;
reg t_op;
wire [3:0] t_result;

reg [3:0] expected;
integer errors;
integer a_i, b_i;

alu DUT (
    .a(t_a),
    .b(t_b),
    .op(t_op),
    .result(t_result)
);

initial begin
    errors = 0;

    for (a_i = 0; a_i < 16; a_i = a_i + 1) begin
        for (b_i = 0; b_i < 16; b_i = b_i + 1) begin

            t_a = a_i;
            t_b = b_i;

            // Addition
            t_op = 0;
            #1;
            expected = t_a + t_b;

            if (t_result !== expected) begin
                $display("FAIL ADD: A=%0d B=%0d got=%0d expected=%0d",
                         t_a, t_b, t_result, expected);
                errors = errors + 1;
            end

            // Subtraction
            t_op = 1;
            #1;
            expected = t_a - t_b;

            if (t_result !== expected) begin
                $display("FAIL SUB: A=%0d B=%0d got=%0d expected=%0d",
                         t_a, t_b, t_result, expected);
                errors = errors + 1;
            end

        end
    end

    $display("SUMMARY: errors=%0d", errors);
    $finish;
end

endmodule