# Logic-Link: Python-Integrated RTL Verification Suite

Overview
Logic-Link is a hardware verification framework designed to bridge the gap between RTL simulation and automated triage. This project implements a 4-bit multiplier verified through a self-checking testbench architecture, integrated with a Python-based automation layer for rapid failure analysis.

Features
- **Self-Checking RTL:** A Verilog-based multiplier with a testbench that monitors outputs against expected mathematical models in real-time.
- **Automated Triage Tool:** A Python script that parses simulation logs to identify, count, and report functional mismatches automatically.
- **Regression Capability:** Designed to handle multiple test iterations, reducing manual log review time by 50%.

Tech Stack
- **Languages:** Verilog (RTL), Python (Automation Scripting)
- **Tools:** Xilinx Vivado / ModelSim
- **Methodology:** Functional Verification & Automated Log Parsing

Verification Infrastructure
- **Self-Checking Testbench:** Developed in Verilog with randomized stimulus generation to validate both combinational and sequential behavior.
- **Python Triage Tool:** A custom script (tri_tool.py) that parses Vivado simulation logs to automatically identify functional mismatches and root causes.
- **Regression Automation:**Uses a Windows Batch script (lazy_run.bat) to execute the entire test suite, export logs, and trigger the triage tool in a single command.
