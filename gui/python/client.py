import argparse
import json
import sys

from AI2 import PREDICT

import cv2

CMD_SYS_VERSION = 0
CMD_PREDICT = 1


def run(command):
    if command["cmd"] == CMD_SYS_VERSION:
        return {
            "sys.version": sys.version,
        }

    if command["cmd"] == CMD_PREDICT:
        result = PREDICT(command["file"])
        return result

    else:
        return {"error": "Unknown command."}


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--uuid")
    args = parser.parse_args()
    stream_start = f"`S`T`R`E`A`M`{args.uuid}`S`T`A`R`T`"
    stream_end = f"`S`T`R`E`A`M`{args.uuid}`E`N`D`"
    while True:
        cmd = input()
        print(cmd)
        cmd = json.loads(cmd)
        try:
            result = run(cmd)
        except Exception as e:
            result = {"exception": e.__str__()}
        result = json.dumps(result)
        print(stream_start + result + stream_end)
