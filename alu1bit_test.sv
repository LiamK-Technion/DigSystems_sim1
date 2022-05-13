// 1 bit alu test bench template
module alu1bit_test;

logic test_a, test_b, test_cin, test_s, test_cout;
logic [1:0] test_op;

alu1bit uut(
    .a(test_a),
    .b(test_b),
    .cin(test_cin),
    .op(test_op),
    .s(test_s),
    .cout(test_cout)
);

initial begin
    test_a=1'b1;
    test_b=1'b1;
    test_cin=1'b0;
    test_op=2'b01;

    #100;

    test_a=1'b0;

    #100;

    test_a=1'b1;

    #100;
end

endmodule
