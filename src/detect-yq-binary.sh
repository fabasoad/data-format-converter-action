#!/usr/bin/env sh

main() {
  os="$(uname -s)"
  arch="$(uname -m)"
  binary="yq_"
  case "${os}" in
    Darwin)
      binary="${binary}_darwin_"
      case "${arch}" in
        arm64) binary="${binary}_arm64" ;;
        *) binary="${binary}_amd64" ;;
      esac
      ;;
    FreeBSD)
      binary="${binary}_freebsd_"
      case "${arch}" in
        amd64|x86_64) binary="${binary}_amd64" ;;
        i386|i686) binary="${binary}_386" ;;
        *) binary="${binary}_arm" ;;
      esac
      ;;
    NetBSD)
      binary="${binary}_netbsd_"
      case "${arch}" in
        amd64|x86_64) binary="${binary}_amd64" ;;
        i386|i686) binary="${binary}_386" ;;
        *) binary="${binary}_arm" ;;
      esac
      ;;
    OpenBSD)
      binary="${binary}_openbsd_"
      case "${arch}" in
        amd64|x86_64) binary="${binary}_amd64" ;;
        *) binary="${binary}_386" ;;
      esac
      ;;
    Linux)
      binary="${binary}_linux_"
      case "${arch}" in
        aarch64) binary="${binary}_arm64" ;;
        x86_64) binary="${binary}_amd64" ;;
        *) binary="${binary}_386" ;;
      esac
      ;;
    *)
      binary="${binary}_windows_"
      case "${arch}" in
        x86_64) binary="${binary}_amd64" ;;
        *) binary="${binary}_386" ;;
      esac
      binary="${binary}.exe"
      ;;
  esac
  echo "name=${binary}" >> "$GITHUB_OUTPUT"
}

main "$@"
