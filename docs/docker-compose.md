[home](../README.md)

docker-compose-build.yml
====

two types of services are defined:

- Compilers
- Builders


### [Compilers](./compilers.md)

Mainly used for compiling code & running unit tests. Compilers are ephemeral containers used to run commands inside of them. 

##### process:
`Source_code => Compiler service => Output_Binaries`


### [Builders](./builders.md)

Used to pack the binaries into a Docker image with label-schema included.

##### process:
`Output_Binaries => Builders => Docker Images`