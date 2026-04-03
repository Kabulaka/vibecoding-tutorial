.DEFAULT_GOAL := build

DIST_DIR := dist/vibecoding-tutorial-book
INDEX_HTML := $(DIST_DIR)/index.html

.PHONY: build serve clean check open

build:
	mdbook build

check:
	mdbook build
	@DIST_DIR="$(DIST_DIR)" python3 -c 'from pathlib import Path; import os, sys; root = Path(os.environ["DIST_DIR"]); required = [root / "index.html", root / "quick-start/index.html", root / "core-concepts/index.html", root / "practical-skills/index.html", root / "case-study/index.html", root / "best-practices/index.html"]; missing = [str(path) for path in required if not path.exists()]; sys.exit("Missing files: " + ", ".join(missing)) if missing else print("OK: all required html files exist")'

serve:
	mdbook serve

clean:
	rm -rf $(DIST_DIR)

open:
	@printf '%s\n' "$(INDEX_HTML)"
	@if command -v xdg-open >/dev/null 2>&1; then \
		xdg-open "$(INDEX_HTML)"; \
	elif command -v open >/dev/null 2>&1; then \
		open "$(INDEX_HTML)"; \
	else \
		printf '%s\n' 'No supported open command found; printed path only.'; \
	fi
