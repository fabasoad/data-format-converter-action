#!/usr/bin/env sh

SCRIPT_PATH=$(realpath "$0")
SRC_DIR_PATH=$(dirname "$SCRIPT_PATH")
LIB_DIR_PATH="${SRC_DIR_PATH}/lib"

. "${LIB_DIR_PATH}/logging.sh"

main() {
  binary_name="${1}"
  bin_path="${2}"
  tag_name="${3}"

  yq_path="${bin_path}/yq"
  mv "${bin_path}/${binary_name}" "${yq_path}"
  if [ "${RUNNER_OS}" != "Windows" ]; then
    chmod +x "${yq_path}"
  fi
  log_info "${binary_name}@${tag_name} has been installed"
}

main "$@"
