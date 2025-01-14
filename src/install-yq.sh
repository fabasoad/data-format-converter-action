#!/usr/bin/env sh

SCRIPT_PATH=$(realpath "$0")
SRC_DIR_PATH=$(dirname "$SCRIPT_PATH")
LIB_DIR_PATH="${SRC_DIR_PATH}/lib"

. "${LIB_DIR_PATH}/logging.sh"

main() {
  binary_name="${1}"
  bin_path="${2}"
  tag_name="${3}"
  mv "${bin_path}/${binary_name}" "${bin_path}/yq"
  if [ "${RUNNER_OS}" != "Windows" ]; then
    chmod +x "${bin_path}/yq"
  fi
  echo "${bin_path}" >> "$GITHUB_PATH"
  log_info "${binary_name}@${tag_name} has been installed"
}

main "$@"
