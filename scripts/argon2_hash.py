#!/usr/bin/env -S uv run --script

"""
Argon2id hash generator using the same parameters as the Flutter app:
- type: argon2id (v=19)
- memory: 7168 KiB
- iterations: 5
- parallelism: 1
- hash length: 16 bytes

Usage examples:
  Generate with random salt (16 chars):
    python python_scripts/argon2_hash.py --password "Aa@12345"

  Generate with provided salt (string interpreted as UTF-8):
    python python_scripts/argon2_hash.py --password "Aa@12345" --salt "MySalt123456789"

  Verify a PHC string with a password:
    python python_scripts/argon2_hash.py verify --password "Aa@12345" --phc "$argon2id$v=19$m=7168,t=5,p=1$...$..."
"""

from __future__ import annotations

import argparse
import sys
from dataclasses import dataclass
from secrets import choice
from typing import Optional

try:
    from argon2.low_level import (
        ARGON2_VERSION,
        Type,
        hash_secret,
        verify_secret,
    )
except Exception:  # pragma: no cover - informative message for missing dep
    print(
        "argon2-cffi is required. Install dependencies with: pip install -r python_scripts/requirements.txt",
        file=sys.stderr,
    )
    raise


ALPHANUM = "AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890"


@dataclass(frozen=True)
class Params:
    memory_kb: int = 7168
    iterations: int = 5
    parallelism: int = 1
    hash_length: int = 16
    version: int = ARGON2_VERSION  # 0x13 -> v=19


def random_salt(length: int = 16) -> str:
    if length < 8:
        raise ValueError("Salt must be at least 8 characters long.")
    return "".join(choice(ALPHANUM) for _ in range(length))


def generate_phc(
    password: str, salt: Optional[str] = None, params: Params = Params()
) -> str:
    if not password:
        raise ValueError("Password must not be empty.")

    salt_str = salt or random_salt(16)
    if len(salt_str) < 8:
        raise ValueError("Salt must be at least 8 characters long.")

    phc_bytes = hash_secret(
        secret=password.encode("utf-8"),
        salt=salt_str.encode("utf-8"),
        time_cost=params.iterations,
        memory_cost=params.memory_kb,
        parallelism=params.parallelism,
        hash_len=params.hash_length,
        type=Type.ID,
        version=params.version,
    )
    return phc_bytes.decode("utf-8")


def verify_phc(password: str, phc: str) -> bool:
    if not password:
        raise ValueError("Password must not be empty.")
    if not phc:
        raise ValueError("PHC string must not be empty.")
    return bool(
        verify_secret(
            phc.encode("utf-8"), password.encode("utf-8"), type=Type.ID
        )
    )


def build_parser() -> argparse.ArgumentParser:
    parser = argparse.ArgumentParser(
        description="Argon2id hash generator (v=19, m=7168, t=5, p=1, hashLen=16)"
    )
    sub = parser.add_subparsers(dest="cmd", required=False)

    # default command: generate
    parser.add_argument(
        "--password",
        required=False,
        help="Password to hash (will prompt if not provided)",
    )
    parser.add_argument(
        "--salt",
        required=False,
        help="Optional salt string (UTF-8). If omitted, a random 16-char salt is generated.",
    )

    # verify subcommand
    verify_p = sub.add_parser(
        "verify", help="Verify a password against a PHC string"
    )
    verify_p.add_argument(
        "--password", required=True, help="Password to verify"
    )
    verify_p.add_argument(
        "--phc", required=True, help="PHC string to verify against"
    )

    return parser


def main(argv: list[str] | None = None) -> int:
    parser = build_parser()
    args = parser.parse_args(argv)

    if args.cmd == "verify":
        ok = verify_phc(args.password, args.phc)
        print("OK" if ok else "MISMATCH")
        return 0 if ok else 1

    # generate mode
    password = args.password or input("Password: ")
    effective_salt = args.salt or random_salt(16)
    phc = generate_phc(password=password, salt=effective_salt)
    print(f"salt: {effective_salt}")
    print(phc)
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
