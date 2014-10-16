

interface arb_if(input bit clk);
    logic reset;
    logic [1:0]  grant;
    logic [1:0] request;
endinterface

module top();

logic clk = 0;

always
    #5 clk <= ~clk;

arb_if arbif(clk);

test_arbiter DUT1 (
    arbif
    );

arbiter DUT2 (
    .clk(arbif.clk),
    .reset(arbif.reset),
    .grant(arbif.grant),
    .request(arbif.request)
    );



endmodule
