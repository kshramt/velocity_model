# Constants
MY_PYTHON ?= python3

MODELS := iasp91 jb
MODEL_PTIMES := $(MODELS:%=%.ptime)

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
all: $(MODEL_PTIMES)

# Files

work/jb_header.locsat: bin/gen_header.py data/params.json
	mkdir -p $(@D)
	$(MY_PYTHON) $< < data/params.json >| $@

# Rules

%.ptime: bin/gen_time_table.py work/%.locsat
	$(MY_PYTHON) $< < work/$*.locsat >| $@

work/%.locsat: work/jb_header.locsat
	set +o nounset
	taup_table -header $< -ph p,P,Pdiff,Pn -locsat -model $* >| $@
