module circuit(
    input logic d, rst, clk,
    output logic q
);
    always_ff @(posedge clk, posedge rst) begin
        if (rst == 1'b1)
            q <= 1'b0;
        else
            q <= d;
    end
endmodule

module fa(
    input logic a, b, c,
    output logic s, cout
);
    assign s = a^b^c;
    assign cout = (a&b)|(a&c)|(b&c);
endmodule

module serialadder(
    input logic a, b, rst, clk,
    output logic s, cout
);
    logic w1, w2;
    fa FullAdder(a, b, w2, s, w1);
    circuit flipflop(w1, rst, clk, w2);
    assign cout = w2;
endmodule