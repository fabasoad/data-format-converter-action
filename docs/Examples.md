# Examples

## Various Formats

### From JSON

#### To XML

```yaml
- uses: fabasoad/data-format-converter-action@v1
  id: converter
  with:
    source-pattern: "config.json"
    to: "xml"
- name: List resulting files
  run: ls ${{ steps.converter.outputs.result-path }}
  # You should see a single file: config.xml
```

#### To YAML

```yaml
- uses: fabasoad/data-format-converter-action@v1
  id: converter
  with:
    source-pattern: "config.json"
    to: "yaml"
- name: List resulting files
  run: ls ${{ steps.converter.outputs.result-path }}
  # You should see a single file: config.yaml
```

#### To PROPS

```yaml
- uses: fabasoad/data-format-converter-action@v1
  id: converter
  with:
    source-pattern: "config.json"
    to: "props"
- name: List resulting files
  run: ls ${{ steps.converter.outputs.result-path }}
  # You should see a single file: config.props
```

#### To Lua

```yaml
- uses: fabasoad/data-format-converter-action@v1
  id: converter
  with:
    source-pattern: "config.json"
    to: "lua"
- name: List resulting files
  run: ls ${{ steps.converter.outputs.result-path }}
  # You should see a single file: config.lua
```

### From XML

#### To JSON

```yaml
- uses: fabasoad/data-format-converter-action@v1
  id: converter
  with:
    source-pattern: "config.xml"
    to: "json"
- name: List resulting files
  run: ls ${{ steps.converter.outputs.result-path }}
  # You should see a single file: config.json
```

#### To YAML

```yaml
- uses: fabasoad/data-format-converter-action@v1
  id: converter
  with:
    source-pattern: "config.xml"
    to: "yaml"
- name: List resulting files
  run: ls ${{ steps.converter.outputs.result-path }}
  # You should see a single file: config.yaml
```

#### To PROPS

```yaml
- uses: fabasoad/data-format-converter-action@v1
  id: converter
  with:
    source-pattern: "config.xml"
    to: "props"
- name: List resulting files
  run: ls ${{ steps.converter.outputs.result-path }}
  # You should see a single file: config.props
```

#### To Lua

```yaml
- uses: fabasoad/data-format-converter-action@v1
  id: converter
  with:
    source-pattern: "config.xml"
    to: "lua"
- name: List resulting files
  run: ls ${{ steps.converter.outputs.result-path }}
  # You should see a single file: config.lua
```

### From YAML

#### To JSON

```yaml
- uses: fabasoad/data-format-converter-action@v1
  id: converter
  with:
    source-pattern: "config.yaml"
    to: "json"
- name: List resulting files
  run: ls ${{ steps.converter.outputs.result-path }}
  # You should see a single file: config.json
```

#### To XML

```yaml
- uses: fabasoad/data-format-converter-action@v1
  id: converter
  with:
    source-pattern: "config.yaml"
    to: "xml"
- name: List resulting files
  run: ls ${{ steps.converter.outputs.result-path }}
  # You should see a single file: config.xml
```

#### To PROPS

```yaml
- uses: fabasoad/data-format-converter-action@v1
  id: converter
  with:
    source-pattern: "config.yaml"
    to: "props"
- name: List resulting files
  run: ls ${{ steps.converter.outputs.result-path }}
  # You should see a single file: config.props
```

#### To Lua

```yaml
- uses: fabasoad/data-format-converter-action@v1
  id: converter
  with:
    source-pattern: "config.yaml"
    to: "lua"
- name: List resulting files
  run: ls ${{ steps.converter.outputs.result-path }}
  # You should see a single file: config.lua
```

### From PROPS

#### To JSON

```yaml
- uses: fabasoad/data-format-converter-action@v1
  id: converter
  with:
    source-pattern: "config.props"
    to: "json"
- name: List resulting files
  run: ls ${{ steps.converter.outputs.result-path }}
  # You should see a single file: config.json
```

#### To XML

```yaml
- uses: fabasoad/data-format-converter-action@v1
  id: converter
  with:
    source-pattern: "config.props"
    to: "xml"
- name: List resulting files
  run: ls ${{ steps.converter.outputs.result-path }}
  # You should see a single file: config.xml
```

#### To YAML

```yaml
- uses: fabasoad/data-format-converter-action@v1
  id: converter
  with:
    source-pattern: "config.props"
    to: "yaml"
- name: List resulting files
  run: ls ${{ steps.converter.outputs.result-path }}
  # You should see a single file: config.yaml
```

#### To Lua

```yaml
- uses: fabasoad/data-format-converter-action@v1
  id: converter
  with:
    source-pattern: "config.props"
    to: "lua"
- name: List resulting files
  run: ls ${{ steps.converter.outputs.result-path }}
  # You should see a single file: config.lua
```

### From Lua

#### To JSON

```yaml
- uses: fabasoad/data-format-converter-action@v1
  id: converter
  with:
    source-pattern: "config.lua"
    to: "json"
- name: List resulting files
  run: ls ${{ steps.converter.outputs.result-path }}
  # You should see a single file: config.json
```

#### To XML

```yaml
- uses: fabasoad/data-format-converter-action@v1
  id: converter
  with:
    source-pattern: "config.lua"
    to: "xml"
- name: List resulting files
  run: ls ${{ steps.converter.outputs.result-path }}
  # You should see a single file: config.xml
```

#### To YAML

```yaml
- uses: fabasoad/data-format-converter-action@v1
  id: converter
  with:
    source-pattern: "config.lua"
    to: "yaml"
- name: List resulting files
  run: ls ${{ steps.converter.outputs.result-path }}
  # You should see a single file: config.yaml
```

#### To PROPS

```yaml
- uses: fabasoad/data-format-converter-action@v1
  id: converter
  with:
    source-pattern: "config.lua"
    to: "props"
- name: List resulting files
  run: ls ${{ steps.converter.outputs.result-path }}
  # You should see a single file: config.props
```

## Glob patterns

### Single file

Assuming that there is only one `config.lua` file.

```yaml
- uses: fabasoad/data-format-converter-action@v1
  id: converter
  with:
    source-pattern: "**/config.lua"
    to: "props"
- name: List resulting files
  run: ls ${{ steps.converter.outputs.result-path }}
  # You should see a single file: config.props
```

### All supported files from directory

Assuming that you have:

```text
- tests/
  - sanity/
    - config.xml
    - advanced.props
  - nightly/
    - examples.json
```

Then the following step will convert all of them into YAML files:

```yaml
- uses: fabasoad/data-format-converter-action@v1
  id: converter
  with:
    source-pattern: "tests/**/*"
    to: "yaml"
- name: List resulting files
  run: ls ${{ steps.converter.outputs.result-path }}
  # You should see: config.yaml, advanced.yaml, examples.yaml
```

### Certain files from directory

Assuming that you want to convert only XML files into YAML with this structure:

```text
- tests/
  - sanity/
    - config.xml
    - advanced.props
  - nightly/
    - examples.json
```

Then the following step will convert only `config.xml`:

```yaml
- uses: fabasoad/data-format-converter-action@v1
  id: converter
  with:
    source-pattern: "tests/**/*"
    from: "xml"
    to: "yaml"
- name: List resulting files
  run: ls ${{ steps.converter.outputs.result-path }}
  # You should see a single file: config.yaml
```
