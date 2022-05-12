// Full Adder/Subtractor template
module fas (
    input logic a,           // Input bit a
    input logic b,           // Input bit b
    input logic cin,         // Carry in
    input logic a_ns,        // A_nS (add/not subtract) control
    output logic s,          // Output S
    output logic cout        // Carry out
);

logic t1, t2, t3, t4, t6;

XNOR2 #(
    .Tpdhl(8), .Tpdlh(8)
) xnor_1 (
    .A(a),
    .B(a_ns),
    .Z(t1)
);

OR2 #(
    .Tpdhl(2), .Tpdlh(2)
) or_2 (
    .A(b),
    .B(cin),
    .Z(t2)
);

NAND2 #(
    .Tpdhl(10), .Tpdlh(10)
) nand_3 (
    .A(t1),
    .B(t2),
    .Z(t3)
);

NAND2 #(
    .Tpdhl(10), .Tphlh(10)
) nand_4 (
    .A(b),
    .B(cin),
    .Z(t4)
);

NAND2 #(
    .Tphlh(10), .Tpdhl(10)
) nand_5(
    .A(t3),
    .B(t4),
    .Z(cout)
);

XNOR2 #(
    .Tphlh(8), .Tpdhl(8)
) xnor_6(
    .A(a),
    .B(b),
    .Z(t6)
);

XNOR2 #(
    .Tphlh(8), .Tpdhl(8)
) xnor_7(
    .A(t6),
    .B(cin),
    .Z(s)
);


endmodule
