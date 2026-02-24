@echo off
setlocal enabledelayedexpansion

:: ======================================================================
:: LOGIC-LINK: Automated RTL Regression & Triage Suite
:: ======================================================================
echo ========================================
echo   LOGIC-LINK: REGRESSION START
echo ========================================

:: STEP 1: Pre-clean old simulation artifacts
echo [1/5] Cleaning previous build artifacts...
if exist xsim.dir rmdir /s /q xsim.dir
if exist xvhdl.pb del /q xvhdl.pb
if exist xvlog.pb del /q xvlog.pb
if exist xsim.jou del /q xsim.jou
if exist xsim.log del /q xsim.log

:: STEP 2: RTL Compilation
echo [2/5] Compiling RTL and Testbench...
call xvlog alu.v tb_alu.v
if %errorlevel% neq 0 (echo [ERROR] Compilation Failed! && pause && exit /b)

:: STEP 3: Elaboration
echo [3/5] Elaborating Design (alu_sim_snapshot)...
call xelab tb_alu -s alu_sim_snapshot
if %errorlevel% neq 0 (echo [ERROR] Elaboration Failed! && pause && exit /b)

:: STEP 4: Simulation
echo [4/5] Running Simulation and generating log...
call xsim alu_sim_snapshot -R > sim_output.log
echo [DONE] Log saved to sim_output.log

:: STEP 5: Python Triage
echo [5/5] Executing Python Triage Tool...
if exist triage_tool.py (
    python triage_tool.py
) else (
    echo [WARNING] triage_tool.py not found in root directory.
)

echo ========================================
echo   REGRESSION COMPLETE
echo ========================================
pause