FROM alpine:3.23.3

RUN apk add --no-cache openssh shadow && \
    mkdir -p /run/sshd

COPY ssh-setup.sh /ssh-setup.sh
RUN chmod +x /ssh-setup.sh

EXPOSE 22
ENTRYPOINT ["/ssh-setup.sh"]
