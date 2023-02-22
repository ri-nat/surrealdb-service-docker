# surrealdb-service-docker

```text
WARNING!
WARNING! This image is not intended to be used in any production or staging environment!
WARNING! It is only meant for testing purposes.
WARNING!
```

This Docker image is a wrapper around the original SurrealDB image with the only difference being that the image automatically starts the SurrealDB server with the following configuration:

* User: `root`
* Password: `root`
* Database path: `memory`
* Log level: `trace`

This is useful when using SurrealDB as a service in GitHub Actions, where you cannot specify arguments to the container when starting it. Here's an example YAML code that shows how to use it:

```yaml
jobs:
  build:
    services:
      surrealdb:
        image: rinatshay/surrealdb-service:latest
        ports:
        - 8000:8000

  steps:
    - name: Run tests
      env:
        # Access the SurrealDB server on localhost:8000
        DATABASE_URL: surrealdb://root:root@localhost:8000/test/test
      run: ...
```
