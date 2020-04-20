BASH_COMPLETION_PATH=/usr/share/bash-completion/completions
path := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

all:
	@echo run \'make install\' to install just-colors

install: uninstall
	@chmod +x $(path)/just-colors
	@ln -s $(path)/just-colors /bin/just-colors
	@ln -s $(path)/completion/bash/just-colors $(BASH_COMPLETION_PATH)/just-colors
	@echo "Just-Colors is installed"

test:
	@./tests

uninstall:
	@rm -f /bin/just-colors
	@rm -f $(BASH_COMPLETION_PATH)/just-colors
