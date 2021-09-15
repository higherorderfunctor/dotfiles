FROM alpine:3.14 AS dotfiles

# set timezone
ENV TZ America/Denver
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US.UTF-8
ENV LC_ALL en_US.UTF-8

RUN apk add tzdata && \
    cp /usr/share/zoneinfo/America/Denver /etc/localtime && \
    echo 'America/Denver' > /etc/timezone && \
    apk del tzdata

RUN apk update && \
    apk upgrade && \
    apk --no-cache add ca-certificates alpine-sdk clang-dev python3 tmux vim openrc

ENV TERM xterm-256color
ENV SHELL /bin/zsh
ENV PAGER less

ENTRYPOINT ["/sbin/init", "--"]
