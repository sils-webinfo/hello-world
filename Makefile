SHELL := /usr/bin/env bash
RIOT := tools/jena/bin/riot

.PHONY: superclean validate setup

superclean:
	$(MAKE) -s -C tools/jena clean

$(RIOT):
	which java || \
	(sudo apt update && sudo apt -y install default-jre)
	$(MAKE) -s -C tools/jena

setup: $(RIOT)

validate: $(RIOT)
	./$(RIOT) --validate --count books.ttl
