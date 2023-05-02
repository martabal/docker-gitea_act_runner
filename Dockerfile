FROM alpine:3.17

ARG TARGETPLATFORM

LABEL maintainer="martabal"

WORKDIR /app/act_runner

RUN apk add curl && \
    if [ "$TARGETPLATFORM" = "linux/amd64" ]; \
        then \
        ARCHITECTURE=amd64; \
    elif [ "$TARGETPLATFORM" = "linux/arm/v7" ]; \
        then \
        ARCHITECTURE=arm-7; \
    elif [ "$TARGETPLATFORM" = "linux/arm64" ]; \
        then \
        ARCHITECTURE=arm64; \
    else \
        ARCHITECTURE=amd64; \
    fi && \
    curl https://dl.gitea.com/act_runner/main/act_runner-main-linux-${ARCHITECTURE} -o act_runner && \
    chmod +x ./act_runner && \
    mkdir -p /config
    
COPY runner.sh .  

CMD ["/bin/sh", "/app/act_runner/runner.sh"]
