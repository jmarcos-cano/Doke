[home](../README.md)

# Makefile 
This is where all your docker-compose commands are wrapped.

## Purpose
Instead of memorizing and typing or looking into your bash history (ctrl+R or `history|grep -- 'docker-compose'` or even writing bash scripts ) why don't only run:

`make ` 

or 

`make compile` 



## Current Targets:

- `clean: ` cleans bin/ and any docker-compose asset (containers & networks), by default it will `rm -rf bin/` obviously you can add, remove `node_modules` as well for example.
- `compile: `  
- `docker: ` 
- `label: `


> all .PHONY targets, unless you need to generate an output file.



## [.Makefile.settings.mk](./makefile.settings.md)

this is where some cosmetics happens and where some of the environment variables used as build-args are calculated.

