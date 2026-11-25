#!/bin/bash
set -euo pipefail

LINEAGE_ROOT="${1:-$(pwd)}"
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PATCH_ROOT="${SCRIPT_DIR}/patches"

REPOS=(
  "build/make"
  "frameworks/av"
  "frameworks/base"
  "hardware/interfaces"
  "hardware/samsung"
  "packages/modules/NetworkStack"
)

for repo in "${REPOS[@]}"; do
  pdir="${PATCH_ROOT}/${repo}"
  tdir="${LINEAGE_ROOT}/${repo}"
  [ -d "$pdir" ] || continue
  [ -d "$tdir/.git" ] || { echo "ERROR: Missing git repository: $tdir"; exit 1; }
  echo "==> Applying patches to ${repo}..."
  git -C "$tdir" am --3way "${pdir}"/*.patch
done

echo "All SM-A600G (a6ltedx) platform/HAL patches applied successfully."
