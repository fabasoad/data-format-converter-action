# Data format converter action

[![Stand With Ukraine](https://raw.githubusercontent.com/vshymanskyy/StandWithUkraine/main/badges/StandWithUkraine.svg)](https://stand-with-ukraine.pp.ua)
![GitHub release (latest SemVer including pre-releases)](https://img.shields.io/github/v/release/fabasoad/data-format-converter-action?include_prereleases)
![Functional Tests](https://github.com/fabasoad/data-format-converter-action/workflows/Functional%20tests/badge.svg)
[![pre-commit.ci status](https://results.pre-commit.ci/badge/github/fabasoad/data-format-converter-action/main.svg)](https://results.pre-commit.ci/latest/github/fabasoad/data-format-converter-action/main)

Converts data formats interchangeably. The following formats are supported: [XML](https://www.w3schools.com/xml/),
[YAML](https://yaml.org/), [JSON](https://www.json.org/json-en.html), [PROPS](https://www.ibm.com/docs/en/was/8.5.5?topic=SSEQTP_8.5.5/com.ibm.websphere.nd.multiplatform.doc/ae/rxml_prop_file_syntax.html).

## Inputs

| Name        | Required | Description                      | Possible values                |
|-------------|----------|----------------------------------|--------------------------------|
| input       | Yes      | Path to the file to be converted | _&lt;Path&gt;_                 |
| from        | Yes      | Format of a data in `input` file | `json`, `xml`, `yaml`, `props` |
| to          | Yes      | Format of a data as a result     | `json`, `xml`, `yaml`, `props` |

## Outputs

| Name   | Required | Description                                            |
|--------|----------|--------------------------------------------------------|
| output | Yes      | Converted data is in a format defined in `to` argument |

## Examples

### 1. YAML to JSON

#### 1.1. Initial data

`docker-compose.yml` is a file to be converted into `JSON` with the following
content:

```yaml
version: '3.7'
services:
  mongo:
    image: mongo:4.2.3-bionic
    networks:
      - test-network

networks:
  test-network:
    name: test-network
    driver: bridge
```

#### 1.2. Workflow configuration

```yaml
name: Convert

on: push

jobs:
  converter:
    name: Run converter
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@main
      - uses: fabasoad/data-format-converter-action@main
        id: yaml2json
        with:
          input: 'docker-compose.yml'
          from: 'yaml'
          to: 'json'
      - name: Print result
        run: echo "${{ steps.yaml2json.outputs.output }}"
```

#### 1.3. Result

```json
{
  "version": 3.7,
  "services": {
    "mongo": {
      "image": "mongo:4.2.3-bionic",
      "networks": [
        "test-network"
      ]
    }
  },
  "networks": {
    "test-network": {
      "name": "test-network",
      "driver": "bridge"
    }
  }
}
```

### 2. XML to YAML

#### 2.1. Initial data

`person.xml` is a file to be converted into `YAML` with the following
content:

```xml
<person>
    <name>John Doe</name>
    <age>32</age>
    <hobbies>Music</hobbies>
    <hobbies>PC Games</hobbies>
</person>
```

#### 2.2. Workflow configuration

```yaml
name: Convert

on: push

jobs:
  converter:
    name: Run converter
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@main
      - uses: fabasoad/data-format-converter-action@main
        id: xml2yaml
        with:
          input: 'person.xml'
          from: 'xml'
          to: 'yaml'
      - name: Print result
        run: echo "${{ steps.xml2yaml.outputs.output }}"
```

#### 2.3. Result

```yaml
person:
  name: John Doe
  age: 32
  hobbies:
    - Music
    - PC Games
```

## FAQ

> What if `from` and `to` are the same?

There will not be error or any exception in this case. Result will be read from
`input` and returned as `output`.

> What OS and architectures are supported? I need to understand what type of
> runners I can use.

The following environments are supported:

- OS: `macOS`, `Windows`, `Ubuntu`, `Alpine`, `CentOS`.
- Arch: `ARM`, `ARM64`, `x86`, `x64`.

If you find that some of these OS don't work please open an [issue](https://github.com/fabasoad/data-format-converter-action/issues/new?assignees=fabasoad&labels=bug&template=bug_report.md&title=)
or [PR](https://github.com/fabasoad/data-format-converter-action/compare) with
the fix. Thanks!
