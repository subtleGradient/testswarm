#!/usr/bin/env bash
for i in "$HOME/httpdocs/projects/"*; do
	cd "$i"
	git pull 2>&1
	git submodule init 2>&1
	git submodule update 2>&1
done
