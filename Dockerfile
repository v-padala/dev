FROM ubuntu:latest
RUN apt update && apt install  openssh-server sudo -y
RUN groupadd sshgroup && useradd -ms /bin/bash -g sshgroup sshuser
RUN mkdir -p /home/sshuser/.ssh
COPY id_rsa.pub /home/sshuser/.ssh/authorized_keys
COPY id_rsa /home/sshuser/id_rsa
RUN chown sshuser:sshgroup /home/sshuser/.ssh/authorized_keys /home/sshuser/id_rsa && chmod 600 /home/sshuser/.ssh/authorized_keys /home/sshuser/id_rsa
RUN service ssh start
EXPOSE 22
CMD ["/usr/sbin/sshd","-D"]