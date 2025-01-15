#!/usr/bin/env sh

# Validates value to be a non-empty string.
# Parameters:
# 1. (Required) Param name to display it correctly in the error message for the
#    users.
# 2. (Required) Param value that will be validated.
check_is_not_empty() {
  if [ -z "${2}" ]; then
    echo "::error title=Invalid parameter::\"${1}\" parameter is empty."
    exit 1
  fi
}

# Validates string to be one of the possible values (emulating enum data type).
# Parameters:
# 1. (Required) Param name to display it correctly in the error message for the
#    users.
# 2. (Required) Param value that will be validated.
# 3. (Required) Possible values for the param value to be valid.
# 4. (Optional) Additional message if validation fails.
#
# Usage examples:
# check_enum "my-bool-param" "true" "true,false"
# check_enum "my-days-of-week-param" "wed" "mon,tue,wed,thu,fri,sat,sun"
check_enum() {
  case ",${3}," in
    *",${2},"*)
      ;;
    *)
      msg=""
      if [ -n "${4}" ]; then
        msg=". ${4}"
      fi
      msg="\"${1}\" parameter is invalid. Possible values: $(echo "${3}" | sed 's/,/, /g')${msg}."
      echo "::error title=Invalid parameter::${msg}"
      exit 1
      ;;
  esac
}

# Validates that passed value is a path to an existing file.
# Parameters:
# 1. (Required) Param name to display it correctly in the error message for the
#    users.
# 2. (Required) Param value that will be validated.
#
# Usage example:
# check_if_file_exists "my-file-param" "/usr/local/project/requirements.txt"
check_if_file_exists() {
  if [ ! -f "${2}" ]; then
    msg="\"${1}\" parameter is invalid. It is not a file or does not exist."
    echo "::error title=Invalid parameter::${msg}"
    exit 1
  fi
}

main() {
  input_source_pattern="${1}"
  input_from="${2}"
  input_to="${3}"
  input_github_token="${4}"

  check_is_not_empty "source-pattern" "${input_source_pattern}"
  if [ -n "${input_from}" ]; then
    check_enum "from" "${input_from}" "json,xml,yaml,props,lua" "Either leave it empty or select one from the possible options"
  fi
  check_enum "to" "${input_to}" "json,xml,yaml,props,lua"
  check_is_not_empty "github-token" "${input_github_token}"
}

main "$@"
