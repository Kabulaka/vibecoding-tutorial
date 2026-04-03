.DEFAULT_GOAL := build

PROJECT_NAME := vibecoding-tutorial-book
DIST_DIR := dist/vibecoding-tutorial-book
INDEX_HTML := $(DIST_DIR)/index.html
VERSION := $(shell git describe --tags --always --dirty 2>/dev/null || echo "v0.0.0-dev")
BUILD_TIME := $(shell date -u '+%Y-%m-%d_%H:%M:%S')
COMMIT_HASH := $(shell git rev-parse --short HEAD 2>/dev/null || echo "unknown")
PACKAGE_FILE := dist/$(PROJECT_NAME)-$(VERSION).tar.gz

.PHONY: build package serve clean check open version

build:
	mdbook build
	@$(MAKE) package

package:
	@if [ ! -d "$(DIST_DIR)" ]; then \
		printf '%s\n' "Error: build output not found at $(DIST_DIR). Run 'make build' first."; \
		exit 1; \
	fi
	@tar -czf "$(PACKAGE_FILE)" -C dist "$(PROJECT_NAME)"

version:
	@echo "项目: $(PROJECT_NAME)"
	@echo "版本: $(VERSION)"
	@echo "构建时间: $(BUILD_TIME)"
	@echo "提交哈希: $(COMMIT_HASH)"

check:
	mdbook build
	@DIST_DIR="$(DIST_DIR)" python3 -c 'from pathlib import Path; import os, sys; root = Path(os.environ["DIST_DIR"]); required = [root / "index.html", root / "quick-start/index.html", root / "core-concepts/index.html", root / "practical-skills/index.html", root / "case-study/index.html", root / "best-practices/index.html"]; missing = [str(path) for path in required if not path.exists()]; sys.exit("Missing files: " + ", ".join(missing)) if missing else print("OK: all required html files exist")'

serve:
	mdbook serve

clean:
	rm -rf $(DIST_DIR) $(PACKAGE_FILE)

open:
	@printf '%s\n' "$(INDEX_HTML)"
	@if command -v xdg-open >/dev/null 2>&1; then \
		xdg-open "$(INDEX_HTML)"; \
	elif command -v open >/dev/null 2>&1; then \
		open "$(INDEX_HTML)"; \
	else \
		printf '%s\n' 'No supported open command found; printed path only.'; \
	fi
