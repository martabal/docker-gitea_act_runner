FROM alpine:3.17
LABEL maintainer="martabal"
WORKDIR /app/act_runner
COPY runner.sh .
RUN apk add curl && \
    curl https://dl.gitea.com/act_runner/main/act_runner-main-linux-amd64 -o act_runner &&\
    chmod +x ./act_runner && \
    mkdir -p /config


ENTRYPOINT ["sh", "/app/act_runner/runner.sh"]