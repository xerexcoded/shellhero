SHELL := /bin/bash

help:
	# shellcheck disable=SC2046
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$|(^#--)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m %-43s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m #-- /[33m/'

.PHONY: help
.DEFAULT_GOAL := help

#-- Install commands
phps: ## PHP version switcher that switch PHP version easily on macOS
	curl -L https://raw.githubusercontent.com/vikbert/shellhero/main/src/phps.sh > /usr/local/bin/phps
	chmod +x /usr/local/bin/phps
	phps
