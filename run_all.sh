#!/usr/bin/env bash

for directory in solutions/*
do printf "\t$directory\n"
	src=$(pwd)
	cd "$directory"
	ruby *.rb
	cd "$src"
done

