---
name: makefile design
description: 为 mdBook 教程项目补充带版本化打包能力的常用版 Makefile 设计说明，覆盖 build/package/version/serve/clean/check/open 工作流
type: project
---

# Makefile 设计

## 目标
为当前 mdBook 教程项目增加一个带版本化打包能力的常用版 `Makefile`，覆盖日常构建、校验、打包与查看版本信息等最常见操作，避免每次手写 `mdbook`、`tar` 和校验命令。

## 范围
本次实现以下目标：

- `build`：在仓库根目录执行 mdBook 构建，并自动调用 `package`
- `package`：将构建结果打包为带版本号的压缩包
- `version`：输出项目名、版本、构建时间、提交哈希
- `serve`：启动 mdBook 本地预览服务
- `clean`：删除构建产物目录 `dist/vibecoding-tutorial-book` 和当前版本压缩包
- `check`：执行构建与关键 HTML 存在性检查
- `open`：打印入口页路径，并在系统支持时尝试打开 `index.html`

不包含：

- `watch`
- 自动安装依赖
- 复杂平台分支逻辑
- 额外 lint/test 体系
- 构建时手工指定版本号

## 设计原则

1. **薄封装**：Makefile 只是包一层常用命令，不重新发明工作流。
2. **以仓库根目录为入口**：所有目标默认从仓库根执行，避免在子目录误跑。
3. **版本自动推导**：版本统一来自 `git describe --tags --always --dirty`，避免手工传参导致产物不可追溯。
4. **失败即退出**：`check` 中任一步失败都应让命令失败。
5. **平台兼容尽量简单**：`open` 优先兼容 Linux/macOS，若无可用命令则只打印路径。

## 变量
建议定义以下变量：

- `PROJECT_NAME := vibecoding-tutorial-book`
- `DIST_DIR := dist/vibecoding-tutorial-book`
- `INDEX_HTML := $(DIST_DIR)/index.html`
- `VERSION := $(shell git describe --tags --always --dirty 2>/dev/null || echo "v0.0.0-dev")`
- `BUILD_TIME := $(shell date -u '+%Y-%m-%d_%H:%M:%S')`
- `COMMIT_HASH := $(shell git rev-parse --short HEAD 2>/dev/null || echo "unknown")`
- `PACKAGE_FILE := dist/vibecoding-tutorial-book-$(VERSION).tar.gz`

说明：
- 版本号不接受命令行覆盖或手工输入，统一由 Git 状态推导。
- 压缩包固定输出到 `dist/vibecoding-tutorial-book-$(VERSION).tar.gz`。

## 目标设计

### build
执行：

```make
mdbook build
$(MAKE) package
```

预期：
- 成功生成 `dist/vibecoding-tutorial-book`
- 成功生成 `dist/vibecoding-tutorial-book-$(VERSION).tar.gz`

说明：
- `build` 是默认目标。
- `build` 负责串起“构建 + 打包”完整主流程，而不是只生成 HTML。

### package
执行：

```make
@if [ ! -d "$(DIST_DIR)" ]; then \
	printf '%s\n' "Error: build output not found at $(DIST_DIR). Run 'make build' first."; \
	exit 1; \
fi
@tar -czf "$(PACKAGE_FILE)" -C dist "$(PROJECT_NAME)"
```

用途：将已生成的书籍目录打包为版本化归档文件。

说明：
- 若构建目录不存在则直接失败，避免打空包。
- 压缩包路径固定为 `dist/vibecoding-tutorial-book-$(VERSION).tar.gz`。

### version
行为：输出以下信息：

- 项目名
- 版本
- 构建时间
- 提交哈希

说明：
- `VERSION` 固定来自 `git describe --tags --always --dirty`。
- 不支持在构建时手工指定版本；版本信息应与当前 Git 状态一致。

### serve
执行：

```make
mdbook serve
```

用途：本地预览教程站点。

### clean
执行：

```make
rm -rf $(DIST_DIR) $(PACKAGE_FILE)
```

用途：清理构建结果以及当前版本对应的压缩包。

说明：
- `clean` 只删除当前 `VERSION` 对应的包，不做通配删除。

### check
执行顺序：

1. 运行 `mdbook build`
2. 用 Python 检查这些文件存在：
   - `dist/vibecoding-tutorial-book/index.html`
   - `dist/vibecoding-tutorial-book/quick-start/index.html`
   - `dist/vibecoding-tutorial-book/core-concepts/index.html`
   - `dist/vibecoding-tutorial-book/practical-skills/index.html`
   - `dist/vibecoding-tutorial-book/case-study/index.html`
   - `dist/vibecoding-tutorial-book/best-practices/index.html`
3. 输出明确成功提示 `OK: all required html files exist`

说明：
- 不把“精确匹配某条侧边栏文本”纳入 `check`，因为 mdBook 对引号字符的 HTML 输出会有格式差异，断言过于脆弱。
- `check` 的目标是验证“构建成功 + 关键页面存在”，而不是做脆弱的文本快照测试。

### open
行为：

1. 先打印 `$(INDEX_HTML)` 绝对或相对路径
2. 如果存在 `xdg-open`，则执行 `xdg-open $(INDEX_HTML)`
3. 否则如果存在 `open`，则执行 `open $(INDEX_HTML)`
4. 若都不存在，仅打印提示，不报错

说明：
- 这样兼容 Linux 和 macOS
- 不强依赖浏览器打开命令存在

## PHONY
应声明：

```make
.PHONY: build package serve clean check open version
```

## 默认目标
默认目标设为：

```make
build
```

理由：最符合项目日常使用习惯，也让默认入口直接产出可分发压缩包。

## 验收标准
- 在仓库根目录运行 `make build` 可成功构建 mdBook，并生成 `dist/vibecoding-tutorial-book-$(VERSION).tar.gz`
- `make package` 在缺少构建目录时失败，在构建目录存在时成功打包
- `make version` 可输出与当前 Git 状态一致的版本信息
- `make check` 在成功时输出 `OK: all required html files exist`，失败时退出非 0
- `make clean` 删除构建目录以及当前版本压缩包
- `make open` 在支持的系统上可尝试打开首页，不支持时至少打印入口路径
- Makefile 内容保持简短、直接、易读
