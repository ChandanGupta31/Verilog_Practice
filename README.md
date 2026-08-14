# Verilog RTL Design & Verification Practice

This repository contains my personal workspace for learning and mastering Verilog/SystemVerilog for Digital VLSI Design. It serves as a continuously growing archive of combinational and sequential logic circuits, testbenches, and problem-solving exercises.

## 📂 Workspace Structure

The repository is organized by core digital design concepts to keep the logic files and their respective testbenches cleanly separated:

*   **`01_Basic_Gates/`**: Foundational combinational logic circuits (Adders, Subtractors, basic gates).
*   **`02_Multiplexers/`**: Data routing, selection logic, and MUX-based designs.
*   **`03_Flip_Flops/`**: Sequential logic fundamentals, memory elements, and clock-driven circuits.
*   **`HDLBits/`**: A dedicated vault for my documented solutions to the [HDLBits](https://hdlbits.01xz.net/) problem sets. 

*(Note: As my M.Tech coursework progresses, new concept folders will be added alongside these core topics.)*

## 🛠️ Simulation & Toolchain Workflow

All RTL code and testbenches in this repository are written and verified locally using the following toolchain:
*   **Environment:** macOS (Apple Silicon / M4)
*   **Compiler/Simulator:** Icarus Verilog (`iverilog`)
*   **Execution:** `vvp` for simulation output

**Standard Execution Command:**
```bash
iverilog -o sim.out design_file.v tb_file.v && vvp sim.out