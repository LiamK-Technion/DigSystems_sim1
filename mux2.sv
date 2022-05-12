// 2->1 multiplexer template
module mux2 (
    input logic d0,          // Data input 0
    input logic d1,          // Data input 1
    input logic sel,         // Select input
    output logic z           // Output
);

logic t1, t2, t3, t4, t5;

NAND2 #(
    .Tpdhl(10), .Tpdlh(10)
) nand_g1 (
    .A(d0),
    .B(t4),
    .Z(t1)
);

NAND2 #(
    .Tpdhl(10), .Tpdlh(10)
) nand_g2 (
    .A(t1),
    .B(t1),
    .Z(t2)
);

NAND2 #(
    .Tpdhl(10), .Tpdlh(10)
) nand_g3 (
    .A(d1),
    .B(sel),
    .Z(t3)
);

NAND2 #(
    .Tpdhl(10), .Tpdlh(10)
) nand_g4 (
    .A(sel),
    .B(sel),
    .Z(t4)
);

NAND2 #(
    .Tpdhl(10), .Tpdlh(10)
) nand_g5 (
    .A(t3),
    .B(t3),
    .Z(t5)
);

OR2 #(
    .Tpdhl(2), .Tpdlh(2)
) or_g6 (
    .A(t2),
    .B(t5),
    .Z(z)
);

endmodule