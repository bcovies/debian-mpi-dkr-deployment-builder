# docker-builder-debian-mpi
Construtor docker para utilização de sistemas distribuído por meio da biblioteca do mpi.


# Para compilar o código:
``` mpicc /opt/hello_world.c```

# Para rodar entre os servidores
 ``` mpirun -np 2 --hostfile /home/mpiuser/hostfile ./a.out ```
