---
name: makefile design
description: 为 mdBook 教程项目补充常用版 Makefile 的设计说明，覆盖 build/serve/clean/check/open 工作流
type: project
---

# Makefile 设计

## 目标
为当前 mdBook 教程项目增加一个常用版 `Makefile`，覆盖日常最常见的本地操作，避免每次手写 `mdbook` 和校验命令。

## 范围
本次仅实现以下目标：

- `build`：在仓库根目录执行 mdBook 构建，输出到 `dist/vibecoding-tutorial-book`
- `serve`：启动 mdBook 本地预览服务
- `clean`：删除构建产物目录 `dist/vibecoding-tutorial-book`
- `check`：执行构建与关键 HTML 存在性检查
- `open`：打印入口页路径，并在系统支持时尝试打开 `index.html`

不包含：

- `watch`
- 自动安装依赖
- 复杂平台分支逻辑
- 额外 lint/test 体系

## 设计原则

1. **薄封装**：Makefile 只是包一层常用命令，不重新发明工作流。
2. **以仓库根目录为入口**：所有目标默认从仓库根执行，避免在子目录误跑。
3. **最少变量**：只抽出必要路径变量，保持可读性。
4. **失败即退出**：`check` 中任一步失败都应让命令失败。
5. **平台兼容尽量简单**：`open` 优先兼容 Linux/macOS，若无可用命令则只打印路径。

## 变量
建议仅定义以下变量：

- `DIST_DIR := dist/vibecoding-tutorial-book`
- `INDEX_HTML := $(DIST_DIR)/index.html`

不额外引入 `BOOK_DIR`、`PORT` 等变量，避免过度设计。

## 目标设计

### build
执行：

```make
mdbook build
```

预期：成功生成 `dist/vibecoding-tutorial-book`

### serve
执行：

```make
mdbook serve
```

用途：本地预览教程站点。

### clean
执行：

```make
rm -rf $(DIST_DIR)
```

用途：清理构建结果。

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
3. 输出明确成功提示

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
.PHONY: build serve clean check open
```

## 默认目标
默认目标设为：

```make
build
```

理由：最符合项目日常使用习惯，也最安全。

## 验收标准
- 在仓库根目录运行 `make build` 可成功构建 mdBook
- `make check` 在成功时输出明确通过信息，失败时退出非 0
- `make clean` 删除构建目录
- `make open` 在支持的系统上可尝试打开首页，不支持时至少打印入口路径
- Makefile 内容保持简短、直接、易读
