FROM debian

RUN apt-get update -y
RUN apt-get install -y mpich libopenmpi-dev openmpi-bin openmpi-doc openssh-server  net-tools ssh
RUN adduser mpiuser