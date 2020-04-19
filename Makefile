JUST_COLOR_PATH=$(HOME)/.config/just-colors

all:
	@echo run \'make install\' to install just-colors

install:
	@chmod +x $(JUST_COLOR_PATH)/just-colors
	@ln -s $(JUST_COLOR_PATH)/just-colors /bin/just-colors

test:
	@./tests

