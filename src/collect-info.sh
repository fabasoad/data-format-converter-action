#!/usr/bin/env sh

SCRIPT_PATH=$(realpath "$0")
SRC_DIR_PATH=$(dirname "$SCRIPT_PATH")
LIB_DIR_PATH="${SRC_DIR_PATH}/lib"

. "${LIB_DIR_PATH}/logging.sh"

main() {
  input_from="${1}"
  input_to="${2}"

  if command -v yq >/dev/null 2>&1; then
    yq_installed="true"
    log_info "yq is found at ${yq_path}. Installation skipped."
  else
    yq_installed="false"
    log_info "yq is not found. Executing installation."
  fi
  echo "yq-installed=${yq_installed}" >> "$GITHUB_OUTPUT"

  bin_dir="yq_$(date +%s)"
  echo "bin-dir=${bin_dir}" >> "$GITHUB_OUTPUT"

  workspace="${GITHUB_WORKSPACE}"
  if [ "${RUNNER_OS}" = "Windows" ]; then
    workspace="$(cygpath -u "${workspace}")"
  fi

  bin_path="${workspace}/${bin_dir}"
  echo "bin-path=${bin_path}" >> "$GITHUB_OUTPUT"
}

main "$@"
