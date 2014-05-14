# Constants
MY_PYTHON ?= python3

# Configurations
.SUFFIXES:
.DELETE_ON_ERROR:
.ONESHELL:
.SECONDARY:
.PRECIOUS:
export SHELL := /bin/bash
export SHELLOPTS := pipefail:errexit:nounset:noclobber

# Tasks
.PHONY: all
all: iasp91.ptime

# Files

iasp91.ptime: bin/gen_time_table.py work/iasp91.locsat
	$(MY_PYTHON) $< < work/iasp91.locsat >| $@

work/iasp91.locsat: work/jb_header.locsat
	set +o nounset
	taup_table -header $< -ph p,P,Pdiff,Pn -locsat >| $@

work/jb_header.locsat: bin/gen_header.py data/params.json
	mkdir -p $(@D)
	$(MY_PYTHON) $< < data/params.json >| $@

# Rules
