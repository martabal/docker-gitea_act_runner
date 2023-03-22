# Docker for Gitea Act runner

[![Publish Release](https://github.com/martabal/docker-act_runner/actions/workflows/release.yml/badge.svg)](https://github.com/martabal/docker-act_runner/actions/workflows/release.yml)

Act runner is a runner for Gitea based on Gitea fork of act .

## Run it

### Docker-cli ([click here for more info](https://docs.docker.com/engine/reference/commandline/cli/))

```sh
docker run --name=act_runner \
    -e INSTANCE=GITEA_URL \
    -e TOKEN=RUNNER_TOKEN \
    -e NAME=RUNNER_NAME `#optional` \
    -e LABELS=RUNNER_TAGS `#optional` \
    -v path_to_data:/config \
    -v /var/run/docker.sock:/var/run/docker.sock \
    martabal/act_runner
```

### Docker-compose

```yaml
version: "2.1"
services:
  immich:
    image: martabal/act_runner:latest
    container_name: act_runner
    environment:
      - INSTANCE=GITEA_URL
      - TOKEN=RUNNER_TOKEN
      - NAME=RUNNER_NAME #optional
      - LABELS=RUNNER_TAGS #optional
    volumes:
        - path_to_data:/config
        - /var/run/docker.sock:/var/run/docker.sock
    restart: unless-stopped
```


## Parameters

### Environment variables

| Parameters | Function | Default Value |
| :-----: | ----- | ----- |
| `-e INSTANCE` | gitea instance ROOT_URL |  |
| `-e TOKEN` | Runner token from gitea |  |
| `-e NAME` | Runner name |  |
| `-e LABELS` | Runner tags, comma separated |  |
| `-e INSECURE` | Check server's certificate if using https protocol | false  |
| `-v path_to_data:/config` | Where .runner config file is stored |  |