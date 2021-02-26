FROM debian

RUN apt-get update -y
RUN apt-get install -y mpich libopenmpi-dev openmpi-bin openmpi-doc openssh-server  net-tools ssh
RUN echo 'root:root' | chpasswd

COPY --chown=root:root  shared/install-script.sh /

RUN chmod 500 /install-script.sh
RUN  bash /install-script.sh