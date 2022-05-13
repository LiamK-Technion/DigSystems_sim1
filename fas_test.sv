// Full Adder/Subtractor test bench template
module fas_test;

logic test_a, test_b, test_cin, test_a_ns, test_s, test_cout;

fas uut(
    .a(test_a),
    .b(test_b),
    .cin(test_cin),
    .a_ns(test_a_ns),
    .s(test_s),
    .cout(test_cout)
);

initial begin
    test_a=1'b1;
    test_b=1'b1;
    test_cin=1'b0;
    test_a_ns=1'b0;

    #50;

    test_a_ns=1'b1;

    #50;

    test_a_ns=1'b0;

    #50;
end

endmodule
