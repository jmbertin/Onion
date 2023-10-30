FROM debian:bullseye-slim

RUN apt-get update && apt-get install -y nginx openssh-server tor sudo fail2ban

ARG USERNAME
ARG PASSWORD

RUN useradd -m $USERNAME && echo "$USERNAME:$PASSWORD" | chpasswd
RUN echo "$USERNAME ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/$USERNAME

COPY ./id_rsa.pub /home/$USERNAME/.ssh/authorized_keys
RUN mkdir -p /home/$USERNAME/.ssh && \
    chown $USERNAME:$USERNAME /home/$USERNAME/.ssh && \
    chmod 700 /home/$USERNAME/.ssh && \
    chmod 600 /home/$USERNAME/.ssh/authorized_keys && \
	chown $USERNAME:$USERNAME /home/$USERNAME/.ssh/authorized_keys
COPY nginx.conf /etc/nginx/
COPY sshd_config /etc/ssh/
COPY torrc /etc/tor/
COPY index.html /var/www/html/

EXPOSE 4242

COPY start_services.sh /start_services.sh
RUN chmod +x /start_services.sh

CMD ["/start_services.sh"]
