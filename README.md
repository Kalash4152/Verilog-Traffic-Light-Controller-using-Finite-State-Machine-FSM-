
# Traffic Light Controller (Verilog FSM)

## Overview
This project implements a **Traffic Light Controller using Verilog** based on a **Finite State Machine (FSM)** architecture.  
The controller manages traffic flow at a two-road intersection using four states representing green, yellow, and red signals.

The design demonstrates key RTL design concepts such as:

- Finite State Machine design
- Synchronous sequential logic
- Parameterized timing
- Internal timer using a counter
- Clean synthesizable Verilog

---
<img width="1549" height="691" alt="image" src="https://github.com/user-attachments/assets/77ead34e-552e-4f3b-9bfd-ddcfe008c406" />

## Simulation Waveform Explanation

The waveform above shows the simulation results of the traffic light controller FSM. The clk signal is the system clock driving the synchronous state transitions, while the rst initializes the controller to the starting state. The outputs AG, AY, AR, BG, BY, and BR represent the green, yellow, and red lights for Road A and Road B, respectively.

At the beginning of the simulation, the system starts in State S0, where Road A is Red (AR=1) and Road B is Green (BG=1), allowing traffic to flow on Road B. After the configured green duration expires, the FSM transitions to State S1, where Road B switches to Yellow (BY=1) while Road A remains red. Next, the controller moves to State S2, enabling Green for Road A (AG=1) while Road B becomes red. Finally, the system enters State S3, where Road A transitions to Yellow (AY=1) before returning back to the initial state.

This repeating sequence S0 → S1 → S2 → S3 → S0 demonstrates correct FSM behavior and ensures that only one road receives a green signal at a time, preventing conflicting traffic flows at the intersection.
## Traffic Light Sequence

| State | Road A | Road B |
|------|------|------|
S0 | Red | Green |
S1 | Red | Yellow |
S2 | Green | Red |
S3 | Yellow | Red |

State transition cycle:
