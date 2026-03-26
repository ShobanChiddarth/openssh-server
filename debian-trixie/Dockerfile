FROM debian:trixie

RUN apt-get update && \
    apt-get upgrade -y && \
    DEBIAN_FRONTEND=noninteractive TZ=Asia/Kolkata apt-get install openssh-server -y

COPY ssh-setup.sh /ssh-setup.sh
RUN chmod +x /ssh-setup.sh

EXPOSE 22
ENTRYPOINT ["/ssh-setup.sh"]
