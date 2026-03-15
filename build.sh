#!/bin/bash
set -e

PROJECT_DIR="${1:-$(pwd)}"
PROJECT_NAME="$(basename "$PROJECT_DIR")"

docker run --rm \
  -v "$PROJECT_DIR":/src/"$PROJECT_NAME" \
  -w /src/"$PROJECT_NAME" \
  gba-dev make
