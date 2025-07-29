FROM alpine:3.22.1

RUN apk add --update --no-cache \
    curl \
    jq \
    ca-certificates \
    bash \
    python3 \
    aws-cli

RUN curl https://raw.githubusercontent.com/silinternational/ecs-deploy/master/ecs-deploy -o /bin/ecs-deploy \
    && chmod +x /bin/ecs-deploy

COPY update.sh /bin/

ENTRYPOINT ["/bin/bash"]

CMD ["/bin/update.sh"]