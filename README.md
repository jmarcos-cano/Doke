
```bash
██████╗  ██████╗ ██╗  ██╗███████╗
██╔══██╗██╔═══██╗██║ ██╔╝██╔════╝
██║  ██║██║   ██║█████╔╝ █████╗  
██║  ██║██║   ██║██╔═██╗ ██╔══╝  
██████╔╝╚██████╔╝██║  ██╗███████╗
╚═════╝  ╚═════╝ ╚═╝  ╚═╝╚══════╝
```
[.](https://github.com/jmarcos-cano)

Doke sounds dope (okey-doke), so why not?

Simple [Make](https://www.gnu.org/gnu/gnu.html) + [docker-compose](https://docs.docker.com/compose/) to build [Docker](https://docs.docker.com/) images alla Victor Farcic.


Table of Contents:
-----

- [Description](#description) 
- [TL;DR](#tl-dr)
- [Components](#components)
  - [docker-compose-build.yml](./docs/docker-compose.md)
    - [Compilers](./docs/compilers.md)
    - [Builders](./docs/builders.md)
  - [Makefile](./docs/makefile.md)
    - [.Makefile.settings.mk](./docs/makefile.settings.mk)
- [Installation](#installation)
- [Usage](#usage)
- [ToDo](#todo)

# Description 

While reading Victor Farcic's *"[The DevOps 2.0 Toolkit](https://www.amazon.com/dp/B01BJ4V66M/ref=cm_sw_r_cp_dp_T1_cdOnzbDXQ78GZ) & [The DevOps 2.1 Toolkit](https://www.amazon.com/dp/B01N25BVHX/ref=cm_sw_r_cp_dp_T1_PdOnzbNJJX6YW)"* I found myself thinking that docker-compose might be the right tool to have an language agnostic build server, What I mean is: "imagine a build server which only needs Docker installed ", yes! one of Docker purposes is to reduce dependency hell, but hey that kinda hell also happens in build servers not only in running environments. 

So I came up with an idea to wrap up what Victor uses in his books. see the following:

docker-compose fragment (from the book)
``` bash
version: '2'
services:
	unit:
	  image: golang:1.6
	  volumes:
	  - .:/usr/src/myapp
	  - /tmp/go:/go
	  working_dir: /usr/src/myapp
	  command: bash -c "go get -d -v -t && go test --cover -v ./... && go build -v\
	  -o go-demo"
```

and to run it:
```bash 
docker-compose \
 -f docker-compose-test-local.yml \
 run --rm unit
```

> ^^^ see all you have to memorize or copy-paste

so why not just run (to run unit tests) ?:

```bash
make unit 
```

or to build a Docker image with [label-schema](http://label-schema.org/rc1/) included ?
 
```bash
make build
```

  

with all batteries included, pretty cool huh? 

If I've catch your attention keep reading.

# TL;DR

simple wrapper over what Victor Farcic uses as docker-compose "building service binaries, run unit tests & building services images".

that will let you:

- run unit tests inside temporarily docker container  
- build your source code inside temporarily docker container and generate a Docker images with label-schema included.



# Components:

- [`docker-compose-build.yml`](docs/docker-compose.md) : defines your services, compiler (temp) and image generators.
- [`Makefile`](docs/makefile.md): wrapper around docker-compose commands.
- `.Makefile.settings.mk`: intended for managing cosmetics and some build metadata
- `.env`: this is were you place all your default values for Build enviroment (docker-compose)


# Installation


# Usage

- `make help` 


## ToDo

[] installation via curl | bash
[] `make init`, to setup all the fill in the blanks (read -p)