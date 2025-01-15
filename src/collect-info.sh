#!/usr/bin/env sh

SCRIPT_PATH=$(realpath "$0")
SRC_DIR_PATH=$(dirname "$SCRIPT_PATH")
LIB_DIR_PATH="${SRC_DIR_PATH}/lib"

. "${LIB_DIR_PATH}/logging.sh"

main() {
  input_from="${1}"
  input_to="${2}"

  bin_dir="yq_$(date +%s)"
  echo "bin-dir=${bin_dir}" >> "$GITHUB_OUTPUT"

  bin_path="$GITHUB_WORKSPACE/${bin_dir}"
  echo "bin-path=${bin_path}" >> "$GITHUB_OUTPUT"

  if command -v yq >/dev/null 2>&1; then
    yq_installed="true"
    yq_path="$(which yq)"
    log_info "yq is found at ${yq_path}. Installation skipped."
  else
    yq_installed="false"
    yq_path="${bin_path}/yq"
    log_info "yq is not found. Executing installation."
  fi
  echo "yq-installed=${yq_installed}" >> "$GITHUB_OUTPUT"
  echo "yq-path=${yq_path}" >> "$GITHUB_OUTPUT"
}

main "$@"
