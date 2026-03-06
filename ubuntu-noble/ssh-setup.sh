#!/bin/bash
set -e

# Validate required vars
: "${SSH_USER:?SSH_USER is required}"
: "${SSH_PASSWORD:?SSH_PASSWORD is required}"
: "${SSH_PUBLIC_KEY:?SSH_PUBLIC_KEY is required}"

# Create user if doesn't exist
if ! id "$SSH_USER" &>/dev/null; then
    useradd -m -s /bin/bash "$SSH_USER"
fi

# Set password
echo "$SSH_USER:$SSH_PASSWORD" | chpasswd

# Set up authorized_keys
USER_HOME=$(getent passwd "$SSH_USER" | cut -d: -f6)
mkdir -p "$USER_HOME/.ssh"
echo "$SSH_PUBLIC_KEY" > "$USER_HOME/.ssh/authorized_keys"
chmod 700 "$USER_HOME/.ssh"
chmod 600 "$USER_HOME/.ssh/authorized_keys"
chown -R "$SSH_USER:$SSH_USER" "$USER_HOME"

exec /usr/sbin/sshd -D
