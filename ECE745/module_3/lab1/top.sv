


module top();

logic clk = 0;
logic reset;
logic [1:0]  grant;
logic [1:0] request;

always
    #5 clk <= ~clk;

test_arbiter DUT1 (
    .clk(clk),
    .reset(reset),
    .grant(grant),
    .request(request)
    );

arbiter DUT2 (
    .clk(clk),
    .reset(reset),
    .grant(grant),
    .request(request)
    );



endmodule
