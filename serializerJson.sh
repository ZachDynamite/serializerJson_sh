#!/usr/bin/env bash
set -euo pipefail
#Json dmp directory#
read -rp "Enter the full or relative path to the directory: " dirMasterJson
#Validate the input path#
if [[ ! -d "$dirMasterJson" ]]; then
  echo "[ERROR] The directory '$dirMasterJson' does not exist or is not accessible."
  exit 1
fi
#Output file#
outfile="T.ndjson"
> "$outfile"
#Command#
find "$dirMasterJson" -type f -name "*.json" -exec jq -c '.Records[]' {} \; > "$outfile"
echo "[*]: Operation complete: $outfile saved"
