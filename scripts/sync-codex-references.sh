#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
SRC_DIR="${ROOT_DIR}/shared/graphene-cli"
DST_DIR="${ROOT_DIR}/codex/graphene-cli/references"

mkdir -p "${DST_DIR}"
rm -f "${DST_DIR}"/*.md
cp "${SRC_DIR}"/*.md "${DST_DIR}/"

echo "Synced Codex references from ${SRC_DIR} -> ${DST_DIR}"
