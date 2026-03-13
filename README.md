
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
# Elevator Controller using Verilog FSM

## Overview
This project implements a **simple Elevator Control System using Verilog** based on a **Finite State Machine (FSM)** model. The controller manages elevator movement between four floors based on user input while controlling door operations.

The design demonstrates fundamental RTL design concepts including:

- Finite State Machine design
- Sequential logic using registers
- Conditional control logic
- Elevator movement decision logic
- Door control logic
- Verilog simulation and waveform verification

---

## System Description

The elevator operates between **four floors (0–3)**.  
Users select a floor using a **2-bit input signal**.

The controller determines:

- whether the elevator should **move up**
- **move down**
- **stay at the current floor**

It also controls the **door opening and closing** when the elevator reaches the requested floor.

---

## Inputs

| Signal | Description |
|------|-------------|
| `clk` | System clock |
| `rst` | Reset signal |
| `user_choice[1:0]` | Requested floor from user |

---

## Outputs

| Signal | Description |
|------|-------------|
| `move_up` | Elevator moves upward |
| `move_down` | Elevator moves downward |
| `stay` | Elevator remains at current floor |
| `door_open` | Elevator door opens |
| `door_close` | Elevator door closes |

---

## Elevator Logic

The controller compares the **current floor (`pr_floor`)** with the **requested floor (`user_choice`)**.

| Condition | Action |
|----------|--------|
| `pr_floor < user_choice` | Elevator moves up |
| `pr_floor > user_choice` | Elevator moves down |
| `pr_floor == user_choice` | Elevator stays and door opens |

Door behavior:

- Door opens when the elevator reaches the requested floor
- Door closes when moving between floors

---

## Floor Encoding

| Floor | Binary |
|------|-------|
| Floor 0 | `00` |
| Floor 1 | `01` |
| Floor 2 | `10` |
| Floor 3 | `11` |

---

## Simulation Waveform

The waveform below shows the behavior of the elevator controller during simulation.

The signals illustrate:

- clock operation
- user floor requests
- elevator movement decisions
- door opening and closing

<br><br>



<br><br>


### Waveform Behavior Explanation

When a user selects a floor using `user_choice`, the controller compares it with the current elevator floor.  
If the requested floor is higher, the `move_up` signal activates. If it is lower, the `move_down` signal activates. Once the elevator reaches the requested floor, the system asserts `stay` and opens the door (`door_open = 1`) while disabling movement signals.

---

## Repository Structure


State transition cycle:
