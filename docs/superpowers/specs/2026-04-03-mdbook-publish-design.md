# 使用 mdBook 发布 vibecoding-tutorial 的设计

## 目标

将 `vibecoding-tutorial/` 发布为一个可直接交付的静态 HTML 文档目录，使用 **mdBook** 构建，满足以下验收条件：

1. 输出为**单个目录**，可整体交付
2. 目录内包含可直接打开的 `index.html`
3. 页面具备**树状导航栏**
4. 点击导航可以跳转到对应页面
5. 页面中的文档链接可以正常点击跳转

## 约束

- 使用 **mdBook**，不自建文档渲染器
- 采用**原位构建**，直接使用 `vibecoding-tutorial/` 作为源目录
- 首轮不做自定义主题
- 首轮不追求单个 HTML 文件，而是单个输出目录
- 尽量复用现有目录结构与 `SUMMARY.md`

## 推荐方案

采用 **方案 A：原位构建标准 mdBook**。

### 原因

- 改动最小，最适合当前文档项目
- mdBook 原生支持侧边栏导航、章节跳转和 HTML 输出
- 不需要额外脚本或主题维护成本
- 未来如需增强样式，可在此基础上再加 theme 覆盖

## 目录与配置设计

### 源目录

- 文档源目录：`vibecoding-tutorial/`
- 首页内容：`vibecoding-tutorial/README.md`
- 导航定义：`vibecoding-tutorial/SUMMARY.md`

### 配置文件

在仓库根目录新增 `book.toml`，核心设计如下：

- `book.src = "vibecoding-tutorial"`
- `build.build-dir = "dist/vibecoding-tutorial-book"`
- 使用 mdBook 默认 HTML renderer

这样可以保证：

- 不迁移现有教程文件
- 构建产物与源文档隔离
- 输出目录稳定，便于直接交付或后续自动化发布

## 导航与链接设计

### 导航

- 左侧导航直接使用 mdBook 对 `SUMMARY.md` 的原生解析与渲染
- 章节顺序以 `SUMMARY.md` 为准
- 页面保留 mdBook 默认的上一页/下一页跳转能力

### 首页

- 使用 `README.md` 作为首页
- 首页作为读者进入教程的统一入口

### 链接

- 保留现有 Markdown 相对链接写法
- 构建后由 mdBook 转换为 HTML 页面链接
- 若发现少量不兼容链接，按需做定点修正，不引入预处理脚本

## 构建流程设计

### 构建前

需要确认以下事项：

1. 本地已安装 `mdbook`
2. `vibecoding-tutorial/` 中的 `SUMMARY.md` 能被 mdBook 正确识别
3. 章节文件路径与 `SUMMARY.md` 引用一致

### 构建命令

使用标准命令：

```bash
mdbook build
```

命令从仓库根目录执行，由 `book.toml` 决定源目录与输出目录。

### 输出结果

构建产物位于：

- `dist/vibecoding-tutorial-book/`

关键入口：

- `dist/vibecoding-tutorial-book/index.html`

## 验收标准

构建完成后，按以下标准验收：

1. 可以打开 `dist/vibecoding-tutorial-book/index.html`
2. 左侧显示基于 `SUMMARY.md` 生成的章节树
3. 点击侧边栏章节可跳转到对应页面
4. 页面中的文档链接可正常点击
5. 首页可以进入各章节内容
6. `dist/vibecoding-tutorial-book/` 可以作为单个静态站点目录整体交付

## 非目标

本次不包含以下内容：

- 自定义 `theme/` 目录
- 自定义导航交互脚本
- 构建前内容预处理脚本
- 单 HTML 文件打包
- 远程部署或托管配置

## 风险与应对

### 风险 1：现有 `SUMMARY.md` 与 mdBook 约定不完全一致

应对：

- 先以最小改动方式验证构建
- 若存在格式问题，只修正 `SUMMARY.md` 和必要的链接

### 风险 2：部分相对链接在 HTML 输出后失效

应对：

- 以构建产物做点击验证
- 仅修正具体失效链接，不增加额外构建脚本

### 风险 3：默认主题的导航表现与预期略有差异

应对：

- 首轮以“功能满足验收”为优先
- 如确有必要，再单独规划主题定制

## 实施边界

实现阶段预期只涉及以下类型改动：

- 新增根目录 `book.toml`
- 必要时调整 `vibecoding-tutorial/SUMMARY.md`
- 必要时修正少量文档内相对链接
- 运行 `mdbook build` 生成输出目录

## 结论

该设计以 mdBook 的默认能力为主，目标明确、改动集中、维护成本低，适合当前教程项目作为首个静态发布版本。第一步先完成最小可用发布；如果默认主题不能满足更强的展示诉求，再单独迭代主题层。