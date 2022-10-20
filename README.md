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

```bash

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

```bash

```

> _Hint:_ If you define the same format for `from` and `to` parameters you can use this action to read the file :wink:
