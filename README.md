# OpenSSH Server container

Openssh server inside a docker container based on ubuntu:noble.

### Requirements
1. Docker
2. Linux (this image has been tested with linux server and client)

### Usage
1. Pull the image
   ```sh
   docker pull shobanchiddarth/openssh-server:1.0.0
   ```
2. Copy the file `sample.env` to `.env`
3. Edit the variable values in `.env`
4. Run the container
   ```
   docker run -d --name vibi-openssh-server -p 0.0.0.0:2222:22 --env-file .env -v /tmp/vibi-share:/home/vibi shobanchiddarth/openssh-server:1.0.0
   ```
5. Make sure to edit the `-v /tmp/vibi-share:/home/vibi` part to point the left part to a folder that exists and is the location where you want to store the files shared over ssh, and the right part is the home directory of the ssh user you set in the `.env` file
6. Use ssh normally

