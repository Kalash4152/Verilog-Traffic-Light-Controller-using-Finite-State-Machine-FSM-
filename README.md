# Verilog-Traffic-Light-Controller-using-Finite-State-Machine-FSM-
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

## Traffic Light Sequence

| State | Road A | Road B |
|------|------|------|
S0 | Red | Green |
S1 | Red | Yellow |
S2 | Green | Red |
S3 | Yellow | Red |

State transition cycle:
