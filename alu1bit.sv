// 1-bit ALU template
module alu1bit (
    input logic a,           // Input bit a
    input logic b,           // Input bit b
    input logic cin,         // Carry in
    input logic [1:0] op,    // Operation
    output logic s,          // Output S
    output logic cout        // Carry out
);
logic toAns,fullAdderS,midNOR,outputNOR,midXOR,outputXOR;

// handle full adder:
NAND2 #(
    .Tpdhl(10), .Tpdlh(10)
) nand_a_ns (
    .A(op[0]),
    .B(op[0]),
    .Z(toAns)
);
fas fas1 (
    .a(a),
    .b(b),
    .cin(cin),
    .a_ns(toAns),
    .s(fullAdderS),
    .cout(cout)
);
// handle NOR: 

OR2 #(
    .Tpdhl(2), .Tpdlh(2)
) or_NOR (
    .A(a),
    .B(b),
    .Z(midNOR)
);
NAND2 #(
    .Tpdhl(10), .Tpdlh(10)
) nand_NOR (
    .A(midNOR),
    .B(midNOR),
    .Z(outputNOR)
);

// handle XOR: 

XNOR2 #(
    .Tpdlh(8), .Tpdhl(8)
) xonr_XOR(
    .A(a),
    .B(b),
    .Z(midXOR)
);
NAND2 #(
    .Tpdhl(10), .Tpdlh(10)
) nand_XOR (
    .A(midXOR),
    .B(midXOR),
    .Z(outputXOR)
);

// handle mux:
mux4 selector(
    .d0(outputNOR),
    .d1(outputXOR),
    .d2(fullAdderS),
    .d3(fullAdderS),
    .sel(op),
    .z(s)
);
// End of your code

endmodule
