WEB_DIR=web
WASM_DIR=wasm

all: wasm web

wasm:
	cd $(WASM_DIR) && wasm-pack build --target web --out-dir ../$(WEB_DIR)/src/lib/wasm

web:
	cd $(WEB_DIR) && npm run dev

build: wasm
	cd $(WEB_DIR) && npm run build

clean:
	cd $(WASM_DIR) && cargo clean
	rm -rf $(WEB_DIR)/src/wasm
	rm -rf $(WEB_DIR)/dist

.PHONY: all wasm web build clean
