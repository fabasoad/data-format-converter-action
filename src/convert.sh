#!/usr/bin/env bash

SCRIPT_PATH=$(realpath "$0")
SRC_DIR_PATH=$(dirname "$SCRIPT_PATH")
LIB_DIR_PATH="${SRC_DIR_PATH}/lib"

. "${LIB_DIR_PATH}/logging.sh"

main() {
  yq_path="${1}"
  shift
  input_from="${1}"
  shift
  input_to="${1}"
  shift
  input_source_path="$@"
  source_files=($input_source_path)

  result_path="${RUNNER_TEMP}/data-format-converter-action-$(date +%s)"
  mkdir -p "${result_path}"
  echo "result-path=${result_path}" >> "$GITHUB_OUTPUT"
  log_info "Converting files into target directory: ${result_path}"

  for source_file in "${source_files[@]}"; do
    source_file_ext="${source_file##*.}"
    process="false"
    # If "from" is empty then we check if current file is one of the supported
    # data types.
    if [ "${input_from}" = "all" ]; then
      case ",json,xml,yaml,props,lua," in
        *",${source_file_ext},"*)
          process="true"
          ;;
      esac
    # If "from" is not empty then we check if current file equals to it.
    elif [ "${input_from}" = "${source_file_ext}" ]; then
      process="true"
    fi

    if [ "${process}" = "true" ]; then
      target_file=$(basename "${source_file}")
      target_file="${target_file%.*}.${input_to}"

      if [ -f "${result_path}/${target_file}" ]; then
        msg="Cannot convert ${source_file} into ${target_file} as ${target_file} already"
        msg="${msg} exists in ${result_path} directory. Please be sure that all"
        msg="${msg} source files have different names. ${source_file} is skipped."
        log_warning "${msg}"
      elif [ "${source_file_ext}" = "${input_to}" ]; then
        cp "${source_file}" "${result_path}/${target_file}"
      else
        ${yq_path} \
          -P "${source_file}" \
          -p "${source_file_ext}" \
          -o "${input_to}" \
          > "${result_path}/${target_file}"
        log_info "Converted ${source_file} into ${target_file}"
      fi
    fi
  done
}

main "$@"
