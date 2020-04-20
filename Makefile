BASH_COMPLETION_PATH=/usr/share/bash-completion/completions
path := $(dir $(abspath $(lastword $(MAKEFILE_LIST))))

PATH_TO_FILE=/bin/just-colors

all:
	@echo run \'make install\' to install just-colors

install: uninstall
	@chmod +x $(path)/just-colors
	@ln -s $(path)/just-colors /bin/just-colors

	@echo "[OK] Just-Colors is installed"

ifneq ("$(wildcard $(BASH_COMPLETION_PATH))","")
	@ln -s $(path)/completion/bash/just-colors $(BASH_COMPLETION_PATH)/just-colors
	@echo "[OK] Bash completion for just-colors is installed"
endif

test:
	@./tests

uninstall:
	@rm -f /bin/just-colors
	@rm -f $(BASH_COMPLETION_PATH)/just-colors
