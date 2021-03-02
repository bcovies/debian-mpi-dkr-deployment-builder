# docker-builder-debian-mpi
Construtor docker para utilização de sistemas distribuído por meio da biblioteca do mpi.

Este construtor visa a substituição da utilização da máquina virtual.

Para sua utilização é necessário a instalação do docker-compose.

### Exemplo de uso
``` 
mpiuser@33c3f7734510:/opt$ mpirun -np 30 --hostfile /home/mpiuser/hostfile ./a.out
33c3f7734510: hello world from process 0 of 30
33c3f7734510: hello world from process 1 of 30
33c3f7734510: hello world from process 4 of 30
33c3f7734510: hello world from process 2 of 30
33c3f7734510: hello world from process 3 of 30
33c3f7734510: hello world from process 9 of 30
33c3f7734510: hello world from process 7 of 30
33c3f7734510: hello world from process 5 of 30
5f8008c1445c: hello world from process 20 of 30
5f8008c1445c: hello world from process 22 of 30
33c3f7734510: hello world from process 6 of 30
33c3f7734510: hello world from process 8 of 30
5f8008c1445c: hello world from process 29 of 30
5f8008c1445c: hello world from process 21 of 30
20ca79c582e0: hello world from process 13 of 30
20ca79c582e0: hello world from process 19 of 30
20ca79c582e0: hello world from process 11 of 30
20ca79c582e0: hello world from process 10 of 30
20ca79c582e0: hello world from process 14 of 30
20ca79c582e0: hello world from process 18 of 30
5f8008c1445c: hello world from process 23 of 30
5f8008c1445c: hello world from process 24 of 30
5f8008c1445c: hello world from process 25 of 30
5f8008c1445c: hello world from process 27 of 30
5f8008c1445c: hello world from process 28 of 30
20ca79c582e0: hello world from process 17 of 30
20ca79c582e0: hello world from process 12 of 30
5f8008c1445c: hello world from process 26 of 30
20ca79c582e0: hello world from process 15 of 30
20ca79c582e0: hello world from process 16 of 30
```

## Para compilar o código:
``` mpicc /opt/hello_world.c```

## Para rodar entre os servidores
 ``` mpirun -np 2 --hostfile /home/mpiuser/hostfile ./a.out ```

 ## Observações:
  - O hostfile está presente no  ``` /home/mpiuser/hostfile ``` e pode ser modificado a hora que desejar.
  - A instalação conta com a máquina master e mais 2 nodes workers.
     - Master 
     - Slave1
     - Slave2
     - Caso deseje adicionar mais nodes, você deve alterar a estrutura do script ``` install.sh ``` do próprio arquivo ```hostfile```.