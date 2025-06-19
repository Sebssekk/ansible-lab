FROM redhat/ubi9

RUN yum -y install openssl

RUN useradd -ms /bin/bash -p "$(openssl passwd -6 ansible123)" user

RUN yum -y install openssh-server && systemctl enable sshd
RUN ssh-keygen -A
RUN yum -y install sudo

RUN yum -y install python3

RUN sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/' /etc/ssh/sshd_config
RUN usermod -aG wheel user
RUN echo "user  ALL=(ALL) NOPASSWD:ALL" | tee /etc/sudoers.d/ansible

EXPOSE 22

CMD bash
