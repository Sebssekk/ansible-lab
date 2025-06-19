FROM debian:bookworm

RUN apt update
RUN apt -y install openssl

RUN useradd -ms /bin/bash -p "$(openssl passwd -6 ansible123)" user

RUN apt -y install openssh-server
RUN apt -y install sudo

RUN apt -y install python3

RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
RUN usermod -aG sudo user
RUN echo "user  ALL=(ALL) NOPASSWD:ALL" | tee /etc/sudoers.d/ansible

EXPOSE 22

CMD bash
