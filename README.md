Doke
====

# short description
Doke sounds dope, so why not?
simple Make + docker-compose to build Docker images ala Victor Farcic.


Description
-----------
While reading Victor Farcic's "The DevOps 2.0 Toolkit & The DevOps 2.1 Toolkit: docker swarm" I found myself that maybe docker-compose might be the right tool to have an agnostic build server, What I mean for that is "imagine a build server which only needs Docker installed ...", yes! one of Docker purposes is to reduce dependency hell, but hey that kinda hell also happens in build servers not only in running environments. 

So I came up with an idea to wrap up what Victor uses in his books. see the following:

docker-compose fragment
``` bash
1 unit:
2 image: golang:1.6
3 volumes:
4 - .:/usr/src/myapp
5 - /tmp/go:/go
6 working_dir: /usr/src/myapp
7 command: bash -c "go get -d -v -t && go test --cover -v ./... && go build -v\
8 -o go-demo"
```

to run it:
```bash
1 docker-compose \
2 -f docker-compose-test-local.yml \
3 run --rm unit
```

^^ see all you have to memorize or ctl+c ctl+v?

so why not just running :

```bash
make unit 
```

with all batteries included, pretty cool huh? 

If I've catch you keep reading.

# TLDR;



# components:

- Makefile: wrapper around docker-compose commands.
- docker-compose-build.yml: defines your services, compiler (eph) and image generators.
- .Makefile.settings.mk: intended for managing cosmetics and inplace build metadata
- .env: this is were you place all your default values for Build enviroment (docker-compose)

# Run

- `make help` 


## TODO

- installation via curl | bash
- `make init`, to setup all the fill in the blanks (read -p)