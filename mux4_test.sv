// 4->1 multiplexer test bench template
module mux4_test;

    logic test_d0, test_d1, test_d2, test_d3, test_z;
    logic [1:0] test_sel;

    mux4 uut(
        .d0(test_d0),
        .d1(test_d1),
        .d2(test_d2),
        .d3(test_d3),
        .z(test_z),
        .sel(test_sel)
    );

    initial begin
        test_d0=1'b0;
        test_d1=1'b0;
        test_d2=1'b0;
        test_d3=1'b0;
        test_sel=2'b0;

        #50;

        test_d0=1'b1;

        #50;

        test_d0=1'b0;

        #50;

    end

endmodule
