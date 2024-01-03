# Data format converter action

[![Stand With Ukraine](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/badges/StandWithUkraine.svg)](https://stand-with-ukraine.pp.ua)
![GitHub release (latest SemVer including pre-releases)](https://img.shields.io/github/v/release/fabasoad/data-format-converter-action?include_prereleases)
![functional-tests](https://github.com/fabasoad/data-format-converter-action/actions/workflows/functional-tests.yml/badge.svg)
![linting](https://github.com/fabasoad/data-format-converter-action/actions/workflows/linting.yml/badge.svg)

Converts data formats interchangeably. The following formats are supported: [XML](https://www.w3schools.com/xml/),
[YAML](https://yaml.org/), [JSON](https://www.json.org/json-en.html), [PROPS](https://www.ibm.com/docs/en/was/8.5.5?topic=SSEQTP_8.5.5/com.ibm.websphere.nd.multiplatform.doc/ae/rxml_prop_file_syntax.html).

## Inputs

<!-- prettier-ignore-start -->
| Name  | Required | Description                               | Possible values                |
|-------|----------|-------------------------------------------|--------------------------------|
| input | Yes      | Path to the file to be converted          | _&lt;Path&gt;_                 |
| from  | Yes      | Format of a data in `input` file          | `json`, `xml`, `yaml`, `props` |
| to    | Yes      | Format of a data as a result              | `json`, `xml`, `yaml`, `props` |
| token | No       | The GitHub token or personal access token | _&lt;token&gt;_                |
<!-- prettier-ignore-end -->

## Outputs

<!-- prettier-ignore-start -->
| Name   | Required | Description                                            |
|--------|----------|--------------------------------------------------------|
| output | Yes      | Converted data is in a format defined in `to` argument |
<!-- prettier-ignore-end -->

## Documentation

- [Examples](./docs/Examples.md)
- [FAQ](./docs/FAQ.md)
