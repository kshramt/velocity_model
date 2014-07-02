# Constants
MY_PYTHON ?= python3

MODELS := iasp91 jb prem ak135 1066a 1066b pwdk sp6 herrin qdt
MODEL_PTIMES := $(MODELS:%=output/%.ptime)
MODEL_STIMES := $(MODELS:%=output/%.stime)

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
all: $(MODEL_PTIMES) $(MODEL_STIMES)

# Files

work/jb_header.locsat: bin/gen_header.py data/params.json
	mkdir -p $(@D)
	$(MY_PYTHON) $< < data/params.json >| $@

# Rules

output/%.ptime: bin/gen_time_table.py work/%.p.locsat
	mkdir -p $(@D)
	$(MY_PYTHON) $< < work/$*.p.locsat >| $@

output/%.stime: bin/gen_time_table.py work/%.s.locsat
	mkdir -p $(@D)
	$(MY_PYTHON) $< < work/$*.s.locsat >| $@

work/%.p.locsat: work/jb_header.locsat
	set +o nounset
	taup_table -header $< -ph ttp -locsat -model $* >| $@

work/%.s.locsat: work/jb_header.locsat
	set +o nounset
	taup_table -header $< -ph tts -locsat -model $* >| $@
