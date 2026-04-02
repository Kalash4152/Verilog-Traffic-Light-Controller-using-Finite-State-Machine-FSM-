module top_traffic (
    input clk,
    input rst,
    output [5:0] led
);

// Clock divider → enable pulse
reg [26:0] counter = 0;
wire en;

always @(posedge clk or posedge rst) begin
    if (rst)
        counter <= 0;
    else
        counter <= counter + 1;
end

assign en = (counter == 0);  // 1 pulse ~1 sec


// Traffic light instance
wire AG, AY, AR, BG, BY, BR;

traffic_lights uut (
    .clk(clk),
    .rst(rst),
    .en(en),
    .AG(AG), .AY(AY), .AR(AR),
    .BG(BG), .BY(BY), .BR(BR)
);


// Map to LEDs
assign led = {AG, AY, AR, BG, BY, BR};

endmodule
