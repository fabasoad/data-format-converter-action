# Data format converter action

[![Stand With Ukraine](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/badges/StandWithUkraine.svg)](https://stand-with-ukraine.pp.ua)
![GitHub release (latest SemVer including pre-releases)](https://img.shields.io/github/v/release/fabasoad/data-format-converter-action?include_prereleases)
![functional-tests](https://github.com/fabasoad/data-format-converter-action/actions/workflows/functional-tests.yml/badge.svg)
![linting](https://github.com/fabasoad/data-format-converter-action/actions/workflows/linting.yml/badge.svg)
![security](https://github.com/fabasoad/data-format-converter-action/actions/workflows/security.yml/badge.svg)

Converts data formats interchangeably. The following formats are supported: [XML](https://www.w3schools.com/xml/),
[YAML](https://yaml.org/), [JSON](https://www.json.org/json-en.html), [PROPS](https://www.ibm.com/docs/en/was/8.5.5?topic=SSEQTP_8.5.5/com.ibm.websphere.nd.multiplatform.doc/ae/rxml_prop_file_syntax.html),
[Lua](https://github.com/lua/lua).

## Inputs

```yaml
- uses: fabasoad/data-format-converter-action@v0
  with:
    # (Required) Path to the file with the data to be converted.
    input: "report.xml"
    # (Required) Format of a file. Possible values: json, xml, yaml, props.
    from: "xml"
    # (Required) Format of a file as a result. Possible values: json, xml, yaml,
    # props.
    to: "json"
    # (Optional) The GitHub token or personal access token.
    token: "${{ github.token }}"
```

## Outputs

<!-- prettier-ignore-start -->
| Name   | Required | Description                                            |
|--------|----------|--------------------------------------------------------|
| output | Yes      | Converted data is in a format defined in `to` argument |
<!-- prettier-ignore-end -->

## Documentation

- [Examples](./docs/Examples.md)
- [FAQ](./docs/FAQ.md)

## Contributions

![Alt](https://repobeats.axiom.co/api/embed/6cfd2a64753a4c025099fea0e006aa7ec9d7c67a.svg "Repobeats analytics image")
