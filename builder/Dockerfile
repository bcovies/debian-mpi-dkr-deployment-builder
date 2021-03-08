FROM debian

RUN apt-get update -y && \
    apt-get install -y mpich libopenmpi-dev openmpi-bin openmpi-doc openssh-server net-tools ssh expect sudo 
RUN adduser mpiuser
RUN usermod -aG sudo mpiuser
RUN echo mpiuser:mpiuser | chpasswd
RUN echo root:mpiuser | chpasswd
COPY ./mpi_folder/install.sh /
COPY ./mpi_folder/keygen.sh /
COPY ./mpi_folder/fingerprint.sh /
COPY ./mpi_folder/hostfile /home/mpiuser/


RUN chmod 777 fingerprint.sh && \
    chmod 777 install.sh && \
    chmod 777 keygen.sh
RUN service ssh start
USER mpiuser
EXPOSE 22
ENTRYPOINT [ "/install.sh" ]
