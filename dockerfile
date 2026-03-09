# We use the generic Pterodactyl base for both Python and Node
FROM ghcr.io/pterodactyl/yolks:debian

# Set the environment
USER root
WORKDIR /home/container

# This is the magic line that changes your console name
RUN echo 'export PS1="container@dcistudios~ "' >> /etc/bash.bashrc

# Copy the Pterodactyl entrypoint
COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]
