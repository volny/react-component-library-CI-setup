# CI setup for use with `react-component-library`

Uses Docker, Buildkite, [danger](https://github.com/danger/danger-js), [codecov](https://codecov.io)


### Development

You need an auth token to access private npm packages. Set it as a local variable:

```sh
NPM_AUTH_TOKEN="xxxx-xxxx-xxxx-xxxx"
BUILDKITE_ORGANIZATION_SLUG="organisation"
```

You can then build the Docker container. You only need to run this once to build the image.

```sh
docker build --file Dockerfile.dev -t ui-library .
```

Start and expose `localhost:3000`

```sh
docker run -p 3000:3000 ui-library
```
