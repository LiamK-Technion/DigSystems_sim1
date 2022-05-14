// 64-bit ALU test bench template
module alu64bit_test;

logic [63:0] test_a;
logic [63:0] test_b;
logic [63:0] test_s;
logic test_cin,test_cout;
logic [1:0] test_op;

alu64bit uut(
    .a(test_a),
    .b(test_b),
    .cin(test_cin),
    .cout(test_cout),
    .op(test_op),
    .s(test_s)
);

initial begin
    test_op = 2'b11;
    test_cin = 1;
    test_a = 64'b1111111111111111111111111111111111111111111111111111111111111111;
    test_b = 64'b0000000000000000000000000000000000000000000000000000000000000000;

    #2000;
    test_op[0] = 1'b0;
    #2000;

end
// End of your code

endmodule

