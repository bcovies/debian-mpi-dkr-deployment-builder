FROM debian

RUN apt-get update -y
RUN apt-get install -y mpich libopenmpi-dev openmpi-bin openmpi-doc openssh-server  net-tools ssh
RUN adduser mpiuser
RUN echo mpiuser:mpiuser | chpasswd
RUN service ssh start
EXPOSE 22

COPY ./install.sh /
RUN chmod 777 install.sh
#CMD ["/usr/sbin/sshd","-D"]
ENTRYPOINT [ "/install.sh" ]