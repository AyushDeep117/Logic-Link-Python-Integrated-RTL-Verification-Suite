@echo off
:: Step 1: Analyze/Parse Verilog Files
call xvlog multiplier_4bit.v tb_multiplier.v

:: Step 2: Elaborate and Create a Snapshot
call xelab tb_multiplier -s top_sim

:: Step 3: Run Simulation and Export Log
call xsim top_sim -R > sim_output.log

:: Step 4: Run your Python Triage Tool
python tri_tool.py sim_output.log

pause