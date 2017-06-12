
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
- [TL;DR](#tldr)
- [Components](#components)
  - [docker-compose-build.yml](./docs/docker-compose.md)
    - [Compilers](./docs/compilers.md)
    - [Builders](./docs/builders.md)
    - [.env](./docs/env.md)
  - [Makefile](./docs/makefile.md)
    - [.Makefile.settings.mk](./docs/makefile.settings.mk)
  - [Dockerfile](./docs/dockerfile.md)

- [Installation](#installation)
- [Usage](#usage)
- [ToDo](#todo)
- [Results](#results)

# Description

While reading Victor Farcic's *"[The DevOps 2.0 Toolkit](https://www.amazon.com/dp/B01BJ4V66M) & [The DevOps 2.1 Toolkit](https://www.amazon.com/dp/B01N25BVHX)"* I found myself thinking that docker-compose might be the right tool to have a language agnostic build server, What I mean is: "imagine a build server which only needs Docker installed ", yes! one of Docker purposes is to reduce dependency hell, but hey that kinda hell also happens in build servers not only in running environments.

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

And to run it:
```bash
docker-compose \
 -f docker-compose-test-local.yml \
 run --rm unit
```

> ^^^ see all you have to memorize or copy-paste


_________________
Instead, for running unit tests we can simply:

```bash
make unit
```

Or to build a Docker image with [label-schema](http://label-schema.org/rc1/) included:

```bash
make docker
```
Or even better to: download dependencies, run unit tests, build binary and create Docker image

```bash
make
```

pretty cool huh?

If I've your attention keep reading.

# TL;DR

simple wrapper over what Victor Farcic uses as docker-compose "building service binaries, run unit tests & building services images".

that will let you:

- run unit tests inside temporarily Docker container
- build your source code inside temporarily Docker container
- generate a Docker image with label-schema included.



# Components:

- [`docker-compose-build.yml`](docs/docker-compose.md) : defines your services, compiler (temp) and image generators.
- [`Makefile`](docs/makefile.md): wrapper around docker-compose commands.
- `.Makefile.settings.mk`: intended for managing cosmetics and some build metadata
- `.env`: this is were you place all your default values for Build enviroment (docker-compose)

- [`Dockerfile`](./docs/dockerfile.md): obviously if you are building Docker images you'll need a Dockerfile, you probably have one and just need to add a few lines to it.


# Installation

```bash
curl  https://raw.githubusercontent.com/jmarcos-cano/Doke/master/installation/install.sh |bash
```

# Usage

- `make help`


## TODO

- [x] installation via `curl | bash`
- [ ] `make init`, to setup all the fill in the blanks (read -p)
- [ ] more examples
- [ ] update to start using Docker multi-stage images, the project was "created" even before multi-stage images



## Results
see Doke in action integrated into https://github.com/vfarcic/go-demo here:

#### Victor Farcic's go-demo
- [Video](https://youtu.be/0QPSralpSIs)
- [Giphy](https://giphy.com/gifs/HCG0ajCFb6xS8/html5)
- [Git commit ](https://github.com/jmarcos-cano/go-demo/commit/85cab3a5626eb38f7f713715ed3132204e274e2d)
- [Docker Image](https://hub.docker.com/r/mcano/go-demo/)

#### Marcos Cano's giphy
