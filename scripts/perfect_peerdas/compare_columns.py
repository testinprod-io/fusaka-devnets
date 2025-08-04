import requests
import time

# --- Configuration ---

START_SLOT = 61
END_SLOT = 1000

NODES = {
    #"grandine-geth-1": [17, 51, 52, 76, 103, 113, 117, 118],
    #"grandine-geth-2": [24, 35, 78, 80, 101, 107, 114, 122],
    #"grandine-geth-3": [16, 25, 57, 66, 69, 70, 77, 115],
    #"grandine-geth-4": [9, 30, 82, 99, 105, 116, 123, 125],
    "lighthouse-geth-1": [10, 14, 61, 85, 86, 90, 111, 126],
    "lighthouse-geth-2": [2, 5, 18, 32, 33, 49, 83, 94],
    "lighthouse-geth-3": [3, 13, 48, 50, 74, 97, 119, 121],
    "lighthouse-geth-4": [40, 42, 53, 58, 62, 87, 89, 120],
    "lighthouse-geth-5": [41, 43, 47, 54, 56, 63, 92, 98],
    "lighthouse-geth-6": [8, 22, 38, 60, 79, 91, 93, 112],
    "lighthouse-geth-7": [6, 29, 44, 68, 75, 81, 109, 110],
    "lighthouse-geth-8": [0, 11, 26, 27, 34, 36, 39, 95],
    #"prysm-geth-1": [4, 15, 28, 55, 72, 73, 88, 108],
    #"prysm-geth-2": [7, 12, 31, 37, 45, 65, 71, 84],
    #"prysm-geth-3": [1, 19, 20, 21, 46, 64, 67, 124],
    #"prysm-geth-4": [23, 59, 96, 100, 102, 104, 106, 127],
}

USER = "sunnyside"
PASS = "sleepyyolkie"
BASE_URL = "fusaka-devnet-ssl-7.yolkie.xyz"

# --- Script ---

for slot in range(START_SLOT, END_SLOT + 1):
    for node, expected_cols in NODES.items():
        url = f"https://{USER}:{PASS}@bn.{node}.{BASE_URL}/eth/v1/debug/beacon/data_column_sidecars/{slot}"
        try:
            resp = requests.get(url, timeout=8)
            resp.raise_for_status()
            data = resp.json()
            actual_cols = {int(d["index"]) for d in data.get("data", [])}
            missing = set(expected_cols) - actual_cols
            for col in sorted(missing):
                print(f"MISSING: node={node} slot={slot} column={col}")
        except Exception as e:
            print(f"ERROR: node={node} slot={slot} {e}")
        time.sleep(1/16)