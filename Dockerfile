FROM debian

RUN apt-get update -y
RUN apt-get install -y mpich libopenmpi-dev openmpi-bin openmpi-doc openssh-server  net-tools ssh
RUN adduser mpiuser
RUN echo mpiuser:mpiuser | chpasswd
RUN service ssh start
EXPOSE 22
RUN apt-get install expect -y
COPY ./mpi_folder/install.sh /
COPY ./mpi_folder/keygen.sh /
COPY ./mpi_folder/fingerprint.sh /
RUN chmod 777 fingerprint.sh
RUN chmod 777 install.sh
RUN chmod 777 keygen.sh
ENTRYPOINT [ "/install.sh" ]
CMD [ "/bin/bash", "-db" ]