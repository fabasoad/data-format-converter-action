# Data format converter action

![GitHub release (latest SemVer including pre-releases)](https://img.shields.io/github/v/release/fabasoad/data-format-converter-action?include_prereleases)

Converts YAML/JSON/XML/TOML file formats interchangeably.

## Inputs

| Name        | Required | Description                               | Possible values               | Default |
|-------------|----------|-------------------------------------------|-------------------------------|---------|
| input       | Yes      | Path to the file to be converted          | _&lt;Path&gt;_ or data itself |         |
| from        | Yes      | Format of a file                          | `json`, `xml`, `yaml`, `toml` |         |
| to          | Yes      | Format of a file as a result              | `json`, `xml`, `yaml`, `toml` |         |
| output-type | No       | Type of the result                        | `file`, `data`                | `data`  |

## Outputs

| Name   | Required | Description                                                                                                                              |
|--------|----------|------------------------------------------------------------------------------------------------------------------------------------------|
| output | Yes      | Path to the file with the data in case of `output-type` is `path`, otherwise - data itself. Data is in a format defined in `to` argument |

## Example usage

### Prerequisites

Let's imagine we need to transform _yaml_ file into _json_ data and _xml_ data into _yaml_ format.

- `docker-compose.yml` file that will be converted into _json_.

```yaml
---
version: '3.7'
services:
  mongo:
    image: mongo:4.2.3-bionic
    environment:
      MONGO_INITDB_ROOT_USERNAME: root
      MONGO_INITDB_ROOT_PASSWORD: abc123
    networks:
      - test-network

networks:
  test-network:
    name: test-network
    driver: bridge
```

- JSON data that will be converted into _yaml_ file.

```xml
<person>
    <name>John Doe</name>
    <age>32</age>
    <hobbies>Music</hobbies>
    <hobbies>PC Games</hobbies>
</person>
```

### Workflow configuration

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
        id: yaml2xml
        with:
          input: 'docker-compose.yml'
          from: 'yaml'
          to: 'json'
          output-type: 'data'
      - name: Print yaml2xml result
        run: echo "${{ steps.yaml2xml.outputs.output }}"
      - uses: fabasoad/data-format-converter-action@main
        id: xml2yaml
        with:
          input: '<person><name>John Doe</name><age>32</age><hobbies>Music</hobbies><hobbies>PC Games</hobbies></person>'
          from: 'xml'
          to: 'yaml'
          output-type: 'file'
      - name: Print json2yaml result
        run: |
          echo "${{ steps.xml2yaml.outputs.output }}"
          cat "${{ steps.xml2yaml.outputs.output }}"
```

### Result

```bash

```

> _Hint:_ If you define the same format for `from` and `to` parameters you can use this action to read the file :wink:
