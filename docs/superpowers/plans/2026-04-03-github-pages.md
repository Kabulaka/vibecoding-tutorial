# GitHub Pages 发布 Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 让仓库在保留 `make build` 现有构建与版本化打包行为的前提下，通过 GitHub Actions 自动把 mdBook 站点发布到 GitHub Pages 项目页。

**Architecture:** 保持 `Makefile` 为唯一正式构建入口，继续输出 `dist/vibecoding-tutorial-book/` 和版本化压缩包。通过 `book.toml` 补齐项目页站点 URL 配置，再新增 `.github/workflows/pages.yml` 在 `master` 变更时执行 `make build`、上传 `dist/vibecoding-tutorial-book/` 并部署到 GitHub Pages。

**Tech Stack:** mdBook, Makefile, GitHub Actions, GitHub Pages

---

## File Structure

- `book.toml`
  - 继续定义 mdBook 输入与输出目录
  - 增加项目页部署所需的 `site-url`
- `Makefile`
  - 保持 `build` 为唯一正式构建入口
  - 明确 Pages 站点目录变量，供后续维护和 CI 对齐
- `.github/workflows/pages.yml`
  - 新增 GitHub Pages 自动发布 workflow
  - 只调用 `make build`，不复写构建逻辑

### Task 1: 为项目页补齐 mdBook 配置

**Files:**
- Modify: `book.toml:1-15`
- Test: `book.toml`

- [ ] **Step 1: Write the failing test**

在 `book.toml` 中先写出当前缺失的站点 URL 断言说明，作为本任务的失败标准：

```toml
[output.html]
default-theme = "light"
preferred-dark-theme = "navy"
no-section-label = false
# FAIL 条件：此处还没有 site-url，项目页部署后资源路径会缺少 /<repo>/ 前缀
```

- [ ] **Step 2: Run test to verify it fails**

Run: `python3 - <<'PY'
from pathlib import Path
text = Path('book.toml').read_text()
assert 'site-url' in text, 'missing site-url for GitHub Pages project site'
PY`

Expected: FAIL with `AssertionError: missing site-url for GitHub Pages project site`

- [ ] **Step 3: Write minimal implementation**

将 `book.toml` 改成下面的完整内容：

```toml
[book]
title = "VibeCoding 快速入门教程"
language = "zh-CN"
src = "vibecoding-tutorial"

[build]
build-dir = "dist/vibecoding-tutorial-book"
create-missing = false

[output.html]
default-theme = "light"
preferred-dark-theme = "navy"
no-section-label = false
site-url = "/vibecoding/"
```

- [ ] **Step 4: Run test to verify it passes**

Run: `python3 - <<'PY'
from pathlib import Path
text = Path('book.toml').read_text()
assert 'site-url = "/vibecoding/"' in text
print('OK: book.toml config includes GitHub Pages site-url')
PY`

Expected: PASS with `OK: book.toml config includes GitHub Pages site-url`

- [ ] **Step 5: Commit**

```bash
git add book.toml
git commit -m "feat: configure mdbook for github pages"
```

### Task 2: 对齐 Makefile 与 Pages 站点目录语义

**Files:**
- Modify: `Makefile:1-49`
- Test: `Makefile`

- [ ] **Step 1: Write the failing test**

先定义本任务的失败标准：当前 `Makefile` 有 `DIST_DIR`，但没有显式的 Pages 站点目录变量，后续 workflow 只能硬编码路径。

```make
PROJECT_NAME := vibecoding-tutorial-book
DIST_DIR := dist/vibecoding-tutorial-book
# FAIL 条件：没有单独的 PAGES_ARTIFACT_DIR := $(DIST_DIR)
INDEX_HTML := $(DIST_DIR)/index.html
```

- [ ] **Step 2: Run test to verify it fails**

Run: `python3 - <<'PY'
from pathlib import Path
text = Path('Makefile').read_text()
assert 'PAGES_ARTIFACT_DIR :=' in text, 'missing PAGES_ARTIFACT_DIR for workflow/path alignment'
PY`

Expected: FAIL with `AssertionError: missing PAGES_ARTIFACT_DIR for workflow/path alignment`

- [ ] **Step 3: Write minimal implementation**

将 `Makefile` 改成下面的完整内容：

```make
.DEFAULT_GOAL := build

PROJECT_NAME := vibecoding-tutorial-book
DIST_DIR := dist/vibecoding-tutorial-book
PAGES_ARTIFACT_DIR := $(DIST_DIR)
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
	@echo "Pages artifact: $(PAGES_ARTIFACT_DIR)"

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
```

- [ ] **Step 4: Run test to verify it passes**

Run: `python3 - <<'PY'
from pathlib import Path
text = Path('Makefile').read_text()
assert 'PAGES_ARTIFACT_DIR := $(DIST_DIR)' in text
assert 'Pages artifact: $(PAGES_ARTIFACT_DIR)' in text
print('OK: Makefile exposes Pages artifact directory')
PY`

Expected: PASS with `OK: Makefile exposes Pages artifact directory`

- [ ] **Step 5: Commit**

```bash
git add Makefile
git commit -m "chore: expose pages artifact path"
```

### Task 3: 新增 GitHub Pages 发布 workflow

**Files:**
- Create: `.github/workflows/pages.yml`
- Test: `.github/workflows/pages.yml`

- [ ] **Step 1: Write the failing test**

先确认 workflow 文件当前不存在，这正是本任务的失败条件：

```yaml
# FAIL 条件：.github/workflows/pages.yml 不存在
# 因此仓库推送到 master 后不会自动发布 GitHub Pages
```

- [ ] **Step 2: Run test to verify it fails**

Run: `python3 - <<'PY'
from pathlib import Path
path = Path('.github/workflows/pages.yml')
assert path.exists(), 'missing pages workflow'
PY`

Expected: FAIL with `AssertionError: missing pages workflow`

- [ ] **Step 3: Write minimal implementation**

先创建目录 `.github/workflows/`，再写入 `.github/workflows/pages.yml`：

```yaml
name: Deploy mdBook to GitHub Pages

on:
  push:
    branches:
      - master
  workflow_dispatch:

permissions:
  contents: read
  pages: write
  id-token: write

concurrency:
  group: pages
  cancel-in-progress: true

jobs:
  build:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout repository
        uses: actions/checkout@v4

      - name: Install mdBook
        run: |
          curl -sSL https://github.com/rust-lang/mdBook/releases/latest/download/mdbook-v0.4.52-x86_64-unknown-linux-gnu.tar.gz -o mdbook.tar.gz
          tar -xzf mdbook.tar.gz mdbook
          sudo install mdbook /usr/local/bin/mdbook

      - name: Build site and package
        run: make build

      - name: Verify site entrypoint exists
        run: test -f dist/vibecoding-tutorial-book/index.html

      - name: Setup Pages
        uses: actions/configure-pages@v5

      - name: Upload Pages artifact
        uses: actions/upload-pages-artifact@v3
        with:
          path: dist/vibecoding-tutorial-book

  deploy:
    environment:
      name: github-pages
      url: ${{ steps.deployment.outputs.page_url }}
    runs-on: ubuntu-latest
    needs: build
    steps:
      - name: Deploy to GitHub Pages
        id: deployment
        uses: actions/deploy-pages@v4
```

- [ ] **Step 4: Run test to verify it passes**

Run: `python3 - <<'PY'
from pathlib import Path
text = Path('.github/workflows/pages.yml').read_text()
required = [
    'branches:',
    '- master',
    'run: make build',
    'path: dist/vibecoding-tutorial-book',
    'uses: actions/deploy-pages@v4',
]
missing = [item for item in required if item not in text]
assert not missing, f'missing workflow entries: {missing}'
print('OK: pages workflow is wired to build and deploy the mdBook site')
PY`

Expected: PASS with `OK: pages workflow is wired to build and deploy the mdBook site`

- [ ] **Step 5: Commit**

```bash
git add .github/workflows/pages.yml
git commit -m "feat: add github pages deployment workflow"
```

### Task 4: 端到端验证本地构建与 CI 发布约束

**Files:**
- Modify: `book.toml:1-15`
- Modify: `Makefile:1-49`
- Modify: `.github/workflows/pages.yml:1-44`
- Test: `dist/vibecoding-tutorial-book/index.html`

- [ ] **Step 1: Write the failing test**

先执行一次现有校验，确保这一步的失败标准是“Pages 相关配置未全部同时满足”：

```text
FAIL 条件：
- make build 失败
- 或 dist/vibecoding-tutorial-book/index.html 未生成
- 或 workflow 未指向 dist/vibecoding-tutorial-book
- 或 book.toml 未包含 /vibecoding/ 项目页前缀
```

- [ ] **Step 2: Run test to verify it fails**

Run: `python3 - <<'PY'
from pathlib import Path
book = Path('book.toml').read_text()
makefile = Path('Makefile').read_text()
workflow = Path('.github/workflows/pages.yml').read_text() if Path('.github/workflows/pages.yml').exists() else ''
assert 'site-url = "/vibecoding/"' in book
assert 'PAGES_ARTIFACT_DIR := $(DIST_DIR)' in makefile
assert 'path: dist/vibecoding-tutorial-book' in workflow
assert Path('dist/vibecoding-tutorial-book/index.html').exists(), 'missing built site entrypoint'
print('OK')
PY`

Expected: FAIL before implementation is complete, typically with `AssertionError: missing built site entrypoint`

- [ ] **Step 3: Write minimal implementation**

在前三个任务完成后，执行下面的命令生成站点并验证关键页面：

```bash
make build
python3 - <<'PY'
from pathlib import Path
required = [
    Path('dist/vibecoding-tutorial-book/index.html'),
    Path('dist/vibecoding-tutorial-book/quick-start/index.html'),
    Path('dist/vibecoding-tutorial-book/core-concepts/index.html'),
    Path('dist/vibecoding-tutorial-book/practical-skills/index.html'),
    Path('dist/vibecoding-tutorial-book/case-study/index.html'),
    Path('dist/vibecoding-tutorial-book/best-practices/index.html'),
]
missing = [str(path) for path in required if not path.exists()]
if missing:
    raise SystemExit('Missing files: ' + ', '.join(missing))
print('OK: local build produced all required html files')
PY
```

- [ ] **Step 4: Run test to verify it passes**

Run: `python3 - <<'PY'
from pathlib import Path
book = Path('book.toml').read_text()
makefile = Path('Makefile').read_text()
workflow = Path('.github/workflows/pages.yml').read_text()
assert 'site-url = "/vibecoding/"' in book
assert 'PAGES_ARTIFACT_DIR := $(DIST_DIR)' in makefile
assert 'path: dist/vibecoding-tutorial-book' in workflow
assert Path('dist/vibecoding-tutorial-book/index.html').exists()
assert Path('dist/vibecoding-tutorial-book-v0.0.0-dev.tar.gz').exists() or any(Path('dist').glob('vibecoding-tutorial-book-*.tar.gz'))
print('OK: build output, package artifact, and workflow path are aligned')
PY`

Expected: PASS with `OK: build output, package artifact, and workflow path are aligned`

- [ ] **Step 5: Commit**

```bash
git add book.toml Makefile .github/workflows/pages.yml
git commit -m "feat: publish mdbook via github pages"
```

## Self-Review

- **Spec coverage:**
  - `make build` 继续作为唯一正式构建入口：Task 2, Task 4
  - GitHub Actions 自动发布 Pages：Task 3
  - Pages 发布目录固定为 `dist/vibecoding-tutorial-book/`：Task 2, Task 3, Task 4
  - 项目页前缀可用：Task 1, Task 4
  - 现有版本化压缩包工作流不受影响：Task 2, Task 4
- **Placeholder scan:** 已移除 TODO/TBD/“自行实现”等占位措辞；每个代码步骤都给出完整内容。
- **Type consistency:** `site-url`、`PAGES_ARTIFACT_DIR`、`dist/vibecoding-tutorial-book` 在所有任务中保持一致。
