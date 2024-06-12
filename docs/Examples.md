# Examples

## 1. YAML to JSON

### 1.1. Initial data

`docker-compose.yml` is a file to be converted into `JSON` with the following
content:

```yaml
version: "3.7"
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

### 1.2. Workflow configuration

```yaml
- uses: fabasoad/data-format-converter-action@v0
  id: yaml2json
  with:
    input: "docker-compose.yml"
    from: "yaml"
    to: "json"
- name: Print result
  run: echo "${{ steps.yaml2json.outputs.output }}"
```

### 1.3. Result

```json
{
  "version": 3.7,
  "services": {
    "mongo": {
      "image": "mongo:4.2.3-bionic",
      "networks": ["test-network"]
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

## 2. XML to YAML

### 2.1. Initial data

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

### 2.2. Workflow configuration

```yaml
- uses: fabasoad/data-format-converter-action@v0
  id: xml2yaml
  with:
    input: "person.xml"
    from: "xml"
    to: "yaml"
- name: Print result
  run: echo "${{ steps.xml2yaml.outputs.output }}"
```

### 2.3. Result

```yaml
person:
  name: John Doe
  age: 32
  hobbies:
    - Music
    - PC Games
```

## 3. Use GitHub token

There are 2 options on how you can use GitHub token - PAT and GitHub app token.
You can select any of these options based on your needs.

### Option 1: Personal access token (PAT)

1. [Create PAT](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/managing-your-personal-access-tokens#creating-a-personal-access-token-classic)
   with `repo` permission.
2. [Create repository secret](https://docs.github.com/en/actions/security-guides/using-secrets-in-github-actions)
   (e.g. `MY_GITHUB_TOKEN`) with the PAT value.
3. Use the following configuration:

```yaml
- uses: fabasoad/data-format-converter-action@v0
  with:
    input: "person.xml"
    from: "xml"
    to: "yaml"
    token: ${{ secrets.MY_GITHUB_TOKEN }}
```

### Option 2: GitHub App token

1. [Register a GitHub App](https://docs.github.com/en/apps/creating-github-apps/registering-a-github-app/registering-a-github-app)
   with `contents: read` permission.
2. Create private key and save it somewhere on your local disk.
3. [Install GitHub App](https://docs.github.com/en/apps/using-github-apps/installing-your-own-github-app)
   to your repository.
4. [Create repository secret](https://docs.github.com/en/actions/security-guides/using-secrets-in-github-actions)
   (e.g. `APP_PRIVATE_KEY`) with the private key created on step 2.
5. Create repository variable (e.g. `APP_ID`) with the GitHub App ID.
6. Use the following configuration:

```yaml
- uses: actions/create-github-app-token@v1
  id: generate-app-token
  with:
    app-id: ${{ vars.APP_ID }}
    private-key: ${{ secrets.APP_PRIVATE_KEY }}
- uses: fabasoad/data-format-converter-action@v0
  with:
    input: "person.xml"
    from: "xml"
    to: "yaml"
    token: ${{ steps.generate-app-token.outputs.token }}
```
