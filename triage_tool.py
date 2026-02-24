import re

def triage_log(log_file):
    pass_count = 0
    fail_count = 0
    
    print(f"--- Logic-Link Regression Report: {log_file} ---")
    
    with open(log_file, 'r') as f:
        for line in f:
            # New Regex to match: TIME: 10000 | OP:  0 | A:  36 | B: 129 | RESULT:   165
            match = re.search(r"OP:\s+(\d+)\s+\|\s+A:\s+(\d+)\s+\|\s+B:\s+(\d+)\s+\|\s+RESULT:\s+(\d+)", line)
            
            if match:
                opcode = int(match.group(1))
                a = int(match.group(2))
                b = int(match.group(3))
                got = int(match.group(4))
                
                # Golden Reference Model (Python side)
                if opcode == 0:   expected = (a + b) & 0xFFFF
                elif opcode == 1: expected = (a - b) & 0xFFFF
                elif opcode == 2: expected = (a * b) & 0xFFFF
                elif opcode == 3: expected = (a & b) & 0xFFFF
                elif opcode == 4: expected = (a | b) & 0xFFFF
                elif opcode == 5: expected = (a ^ b) & 0xFFFF
                elif opcode == 6: expected = (~(a | b)) & 0xFFFF
                elif opcode == 7: expected = (~(a & b)) & 0xFFFF
                elif opcode == 8: expected = (a << 1) & 0xFFFF
                elif opcode == 9: expected = (a >> 1) & 0xFFFF
                else: continue
                
                if got == expected:
                    pass_count += 1
                else:
                    fail_count += 1
                    print(f"[FAIL] OP:{opcode} | A:{a} B:{b} | Exp:{expected} Got:{got}")

    print(f"\nFinal Results: {pass_count} PASSED, {fail_count} FAILED")
    if fail_count > 0 or pass_count > 0:
        status = "SUCCESS" if fail_count == 0 else "ACTION REQUIRED"
        print(f"Verification Status: {status}")
    else:
        print("Verification Status: No valid log data found.")

if __name__ == "__main__":
    triage_log("sim_output.log")