# Data format converter action

[![Stand With Ukraine](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/badges/StandWithUkraine.svg)](https://stand-with-ukraine.pp.ua)
![GitHub release (latest SemVer including pre-releases)](https://img.shields.io/github/v/release/fabasoad/data-format-converter-action?include_prereleases)
![functional-tests](https://github.com/fabasoad/data-format-converter-action/actions/workflows/functional-tests.yml/badge.svg)
![test-source-pattern](https://github.com/fabasoad/data-format-converter-action/actions/workflows/test-source-pattern.yml/badge.svg)
![linting](https://github.com/fabasoad/data-format-converter-action/actions/workflows/linting.yml/badge.svg)
![security](https://github.com/fabasoad/data-format-converter-action/actions/workflows/security.yml/badge.svg)

Converts data formats interchangeably. The following formats are supported: [XML](https://www.w3schools.com/xml/),
[YAML](https://yaml.org/), [JSON](https://www.json.org/json-en.html), [PROPS](https://www.ibm.com/docs/en/was/8.5.5?topic=SSEQTP_8.5.5/com.ibm.websphere.nd.multiplatform.doc/ae/rxml_prop_file_syntax.html),
[Lua](https://github.com/lua/lua).

## Supported OS

<!-- prettier-ignore-start -->
| OS      |                    |
|---------|--------------------|
| Windows | :white_check_mark: |
| Linux   | :white_check_mark: |
| macOS   | :white_check_mark: |
<!-- prettier-ignore-end -->

## Prerequisites

The following tools have to be installed for successful work of this GitHub Action:
[bash](https://www.gnu.org/software/bash/).

## Inputs

```yaml
- uses: fabasoad/data-format-converter-action@v1
  with:
    # (Required) Pattern in glob format that would be used to list the files.
    source-pattern: "report.xml"
    # (Optional) Data type of the source files. Possible values: json, xml, yaml,
    # props, lua. Defaults to the type defined by file extension.
    from: "xml"
    # (Required) Data type to be converted to. Possible values: json, xml, yaml,
    # props, lua.
    to: "json"
    # (Optional) GitHub token that is used to send requests to GitHub API such
    # as downloading asset. Defaults to the token provided by GitHub Actions environment.
    github-token: "${{ github.token }}"
```

## Outputs

<!-- prettier-ignore-start -->
| Name        | Required | Description                                                                                                                         |
|-------------|----------|-------------------------------------------------------------------------------------------------------------------------------------|
| result-path | Yes      | The absolute path to the directory with the converted files inside. The name of each converted file is the same as the source file. |
<!-- prettier-ignore-end -->

## Documentation

- [Examples](./docs/Examples.md)
- [FAQ](./docs/FAQ.md)

## Contributions

![Alt](https://repobeats.axiom.co/api/embed/6cfd2a64753a4c025099fea0e006aa7ec9d7c67a.svg "Repobeats analytics image")
