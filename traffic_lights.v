`timescale 1ns / 1ps

module traffic_lights (
    input clk,
    input rst,
    input en,   // clock enable (slow tick)

    output reg AG, AY, AR,
    output reg BG, BY, BR
);

// State encoding
parameter S0 = 2'b00;
parameter S1 = 2'b01;
parameter S2 = 2'b10;
parameter S3 = 2'b11;

// Timing (in ticks)
parameter GREEN_TIME  = 5;
parameter YELLOW_TIME = 2;

reg [1:0] pr_state, nxt_state;
reg [3:0] counter;

// ---------------- STATE + TIMER ----------------
always @(posedge clk or posedge rst) begin
    if (rst) begin
        pr_state <= S0;
        counter  <= 0;
    end
    else if (en) begin
        if (pr_state != nxt_state)
            counter <= 0;   // reset timer on state change
        else
            counter <= counter + 1;

        pr_state <= nxt_state;
    end
end


// ---------------- NEXT STATE ----------------
always @(*) begin
    case(pr_state)

    S0: nxt_state = (counter == GREEN_TIME)  ? S1 : S0;
    S1: nxt_state = (counter == YELLOW_TIME) ? S2 : S1;
    S2: nxt_state = (counter == GREEN_TIME)  ? S3 : S2;
    S3: nxt_state = (counter == YELLOW_TIME) ? S0 : S3;

    default: nxt_state = S0;

    endcase
end


// ---------------- OUTPUT ----------------
always @(*) begin
    {AG,AY,AR,BG,BY,BR} = 6'b0;

    case(pr_state)
    S0: begin AR=1; BG=1; end   // Road B Green
    S1: begin AR=1; BY=1; end
    S2: begin AG=1; BR=1; end   // Road A Green
    S3: begin AY=1; BR=1; end
    endcase
end

endmodule
