import os

def run_triage(log_file):
    print(f"--- Triaging Log File: {log_file} ---")
    pass_count = 0
    fail_count = 0
    
    with open(log_file, 'r') as f:
        for line in f:
            if "PASS" in line:
                pass_count += 1
            elif "ERROR" in line:
                fail_count += 1
                print(f"Alert: Failure found -> {line.strip()}")

    print(f"\nFinal Report:")
    print(f"Total Tests Run: {pass_count + fail_count}")
    print(f"Passed: {pass_count}")
    print(f"Failed: {fail_count}")

if __name__ == "__main__":
    # In a real flow, you'd run your simulator command here first
    # For now, we assume 'sim_output.log' exists
    if os.path.exists("sim_output.log"):
        run_triage("sim_output.log")
    else:
        print("Error: sim_output.log not found. Run simulation first.")