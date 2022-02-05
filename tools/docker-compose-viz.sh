#!/bin/zsh
# description: convert docker-compose.yml to graph picture
#
#        author: Thus0
# last modified: 2022-02-05 17:32

winpty docker run --rm -it --name dcv \
	-v $(pwd):/input \
	pmsipilot/docker-compose-viz render \
       	--no-volumes --no-ports --no-networks
	-m image --force ../docker-compose.yml 

# vim: set sw=4 ts=4 et:
