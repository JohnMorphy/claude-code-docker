FROM ubuntu:latest

#instalacja
RUN apt-get update && apt-get install -y \
openssh-server \
nodejs \
npm \ 
git \ 
docker.io \
curl

RUN mkdir /run/sshd


# SSH — exchange key
# Before running - generate key (windows): 
# ssh-keygen -t ed25519  
# creazed paste to base folder to 'authrorized_key' file

RUN mkdir -p /root/.ssh && chmod 700 /root/.ssh
COPY authorized_keys /root/.ssh/authorized_keys
RUN chmod 600 /root/.ssh/authorized_keys
RUN curl -fsSL https://claude.ai/install.sh | bash

# port SSH
EXPOSE 22

# running sshd directly
CMD ["/usr/sbin/sshd", "-D"]

