FROM ubuntu:latest

#installation
RUN apt-get update && apt-get install -y \
    openssh-server \
    nodejs \
    npm \
    git \
    docker.io \
    curl \
    sudo \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /run/sshd

# Setting PATH for claude installation
ENV PATH="/root/.local/bin:$PATH"


# Adding dev user
RUN useradd -m -s /bin/bash dev && \
    echo "dev ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers

# Installing claude as dev
USER dev
RUN curl -fsSL https://claude.ai/install.sh | bash
USER root
RUN mv /home/dev/.local/bin/claude /usr/local/bin/claude

# SSH — exchange key
# Before running - generate key (windows): 
# ssh-keygen -t ed25519  
# creazed paste to base folder to 'authrorized_key' file

RUN mkdir -p /home/dev/.ssh && chmod 700 /home/dev/.ssh
COPY authorized_keys /home/dev/.ssh/authorized_keys
RUN chmod 600 /home/dev/.ssh/authorized_keys && \
    chown -R dev:dev /home/dev/.ssh

RUN usermod -aG docker dev

# port SSH
EXPOSE 22

# running sshd directly
CMD ["/usr/sbin/sshd", "-D"]

