#!/usr/bin/env sh

SCRIPT_PATH=$(realpath "$0")
SRC_DIR_PATH=$(dirname "$SCRIPT_PATH")
LIB_DIR_PATH="${SRC_DIR_PATH}/lib"

. "${LIB_DIR_PATH}/logging.sh"

main() {
  yq_installed=$(if command -v yq >/dev/null 2>&1; then echo true; else echo false; fi)
  echo "yq-installed=${yq_installed}" >> "$GITHUB_OUTPUT"

  yq_temp_file_path=".data-format-converter-action"
  echo "yq-temp-file-path=${yq_temp_file_path}" >> "$GITHUB_OUTPUT"

  bin_dir="yq_$(date +%s)"
  echo "bin-dir=${bin_dir}" >> "$GITHUB_OUTPUT"

  bin_path="$GITHUB_WORKSPACE/${bin_dir}"
  echo "bin-path=${bin_path}" >> "$GITHUB_OUTPUT"
}

main "$@"
