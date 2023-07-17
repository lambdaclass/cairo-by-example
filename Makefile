.PHONY: build serve test

EN_DIR := content/en/examples
#EN_CONTENT := $(wildcard $(EN_DIR)/*.md) # Uncomment when all tests are implemented
EN_CONTENT := $(EN_DIR)/hello_world.md

ES_DIR := content/es/examples
ES_CONTENT := $(wildcard $(ES_DIR)/*.md)

build:
	hugo

serve:
	hugo serve

test:
	$(foreach file, $(EN_CONTENT), txm --jobs 1 $(file);)
	#$(foreach file, $(ES_CONTENT), txm --jobs 1 $(file);) # Uncomment when all tests are impl
