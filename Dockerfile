FROM ubuntu:noble

RUN apt-get update

RUN DEBIAN_FRONTEND=noninteractive apt-get install -qy libxtst6 \
libxt-dev libglib2.0-0 libfreetype6 libxrender1 fontconfig sudo libqt5core5t64 libqt5gui5t64 openssh-client

#RUN useradd -m  -s /bin/bash ubuntu
RUN usermod -aG sudo ubuntu && echo "ubuntu ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/ubuntu
RUN chmod 044 /etc/sudoers.d/ubuntu
USER ubuntu:ubuntu
WORKDIR /home/ubuntu
CMD ["/bin/bash"]

# initial unpack, not needed now
#WORKDIR /tmp
#COPY se_28000200_linux-arm64qt5.tar.gz /tmp/
#COPY slowyes.sh /tmp/
#RUN tar -xvzf /tmp/se_28000200_linux-arm64qt5.tar.gz
#COPY SE_WL10339_2800_Holder.lic /tmp/se_28000200_linux-arm64qt5/
#RUN /tmp/se_28000200_linux-arm64qt5/vsinst -accept-eula -post-install

