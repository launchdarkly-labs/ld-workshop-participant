#!/usr/bin/env python3
"""Terraform external data source: signs a workshop login invitation.

Reads a JSON object {"id", "expires", "secret"} from stdin and writes
{"id", "expires", "token"} to stdout, where token is the hex HMAC-SHA256 of
"<id>.<expires>" keyed by the secret. "expires" is an epoch timestamp in
seconds and is passed through verbatim so the signed string matches exactly
what the login handler reconstructs during verification.
"""
import hashlib
import hmac
import json
import sys


def sign(data: str, secret: str) -> str:
    return hmac.new(secret.encode(), data.encode(), hashlib.sha256).hexdigest()


def main() -> None:
    query = json.load(sys.stdin)
    project_id = query["id"]
    expires = query["expires"]
    secret = query["secret"]

    token = sign(f"{project_id}.{expires}", secret)
    json.dump({"id": project_id, "expires": expires, "token": token}, sys.stdout)


if __name__ == "__main__":
    try:
        main()
    except Exception as error:  # Terraform surfaces stderr on non-zero exit
        print(f"sign.py: {error}", file=sys.stderr)
        sys.exit(1)
