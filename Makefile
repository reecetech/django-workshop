all: build

build:
	mdbook build

serve:
	mdbook serve

.PHONY: build serve
