# 使用 GitHub Pages 发布 mdBook 静态站点的设计

## 目标

将 `make build` 生成的 mdBook 静态站点通过 **GitHub Actions + GitHub Pages** 自动发布到仓库项目页，满足以下验收条件：

1. 本地仍然通过 `make build` 产出完整构建结果
2. GitHub Actions 不引入第二套独立构建逻辑，只复用 `make build`
3. Pages 自动部署后可通过 `https://<user>.github.io/<repo>/` 访问
4. 首页、章节跳转、静态资源在项目页路径前缀下均可正常工作
5. 现有版本化压缩包工作流不受影响

## 约束

- 发布方式固定为 **GitHub Actions 部署到 GitHub Pages**
- Pages 形态固定为 **项目页**，不是用户主页，也不是自定义域名
- `make build` 必须继续作为唯一正式构建入口
- Actions 只消费 `make build` 产物中的站点目录，不新增独立真实构建流程
- 现有 Makefile 中的打包、清理、版本号逻辑必须保持兼容

## 推荐方案

采用 **方案 A：保留 `make build` 为唯一构建入口，Actions 直接发布其中的站点子目录**。

### 原因

- 与当前项目“构建 + 打包”工作流最一致
- 本地与 CI 共用同一套构建入口，排障成本最低
- 不需要额外维护 `pages-build` 之类的并行命令
- Makefile 负责构建，workflow 负责部署，职责边界清晰

## 方案对比

### 方案 A：保留 `make build`，Actions 发布站点子目录（推荐）

做法：
- `make build` 继续构建整套产物
- 明确 `dist/vibecoding-tutorial-book/` 为 Pages 发布目录
- GitHub Actions 执行 `make build` 后，直接上传该目录到 GitHub Pages

优点：
- 本地与 CI 行为一致
- 不会出现“两套构建真相”
- 与现有 `Makefile` 结构天然契合

缺点：
- 需要明确 mdBook 配置对项目页路径前缀的支持

### 方案 B：在 `make build` 中额外整理一个 Pages 专用目录

做法：
- `make build` 完成后，再把书站复制到 `dist/pages/` 一类专用目录
- Actions 只发布这个专用目录

优点：
- workflow 中的发布目标最直观

缺点：
- 多一次复制，增加不必要的同步成本
- 专用目录容易和真实书站输出脱节

### 方案 C：不改 Makefile，在 workflow 内拼接发布逻辑

做法：
- Actions 执行 `make build`
- 然后在 workflow 里自行判断、筛选、搬运最终发布目录

优点：
- 对 Makefile 表面改动最少

缺点：
- 规则分散在 CI 中
- 本地很难完整复现发布路径
- 后续维护成本最高

## 当前仓库状态

当前已知配置与本设计直接相关：

- `book.toml` 已存在，且配置了：
  - `src = "vibecoding-tutorial"`
  - `build-dir = "dist/vibecoding-tutorial-book"`
- `Makefile` 已存在，且当前：
  - `build` 调用 `mdbook build`
  - `package` 将 `dist/vibecoding-tutorial-book` 打为版本化压缩包
  - `clean` 会删除 `dist/vibecoding-tutorial-book` 和当前版本压缩包

这意味着 Pages 最自然的发布目录就是：

- `dist/vibecoding-tutorial-book/`

## 架构设计

### 1. Makefile 职责

`Makefile` 继续作为唯一正式构建入口，负责：

- 运行 `mdbook build`
- 保持站点输出到 `dist/vibecoding-tutorial-book/`
- 保持现有版本化打包流程

`Makefile` 不负责：

- 调用 GitHub API
- 触发 Pages 发布
- 管理部署状态

### 2. mdBook 配置职责

`book.toml` 负责静态站点在项目页环境下的可访问性，重点是：

- 明确站点输出目录已经固定为 `dist/vibecoding-tutorial-book/`
- 为项目页场景补齐站点 URL / base path 相关配置
- 确保生成后的页面资源链接能在 `/<repo>/` 前缀下正确解析

由于目标地址是 `https://<user>.github.io/<repo>/`，不能假设站点部署在域名根路径 `/`。如果当前 mdBook 默认输出依赖根路径，就必须在配置中显式设置对应站点地址。

### 3. GitHub Actions 职责

新增 `.github/workflows/pages.yml`，负责：

1. 在 `master` 分支发生需要发布的变更后触发
2. 安装或准备 mdBook 构建环境
3. 执行 `make build`
4. 将 `dist/vibecoding-tutorial-book/` 上传为 GitHub Pages artifact
5. 调用官方 Pages 部署动作完成发布

workflow 不负责：

- 自行拼装站点内容
- 替代 Makefile 的构建逻辑
- 直接操作 `gh-pages` 分支

## 目录与文件边界

本次实现建议只涉及以下文件：

- 修改：`book.toml`
  - 如有需要，补充项目页所需的站点 URL / path 配置
- 修改：`Makefile`
  - 仅在确有必要时补充一个明确的 Pages 站点目录变量或输出说明
  - 不新增第二套构建命令
- 新增：`.github/workflows/pages.yml`
  - 定义 GitHub Actions 构建与 Pages 部署流程
- 可选新增：`.github/workflows/` 下辅助配置
  - 仅当 Pages 官方动作需要额外权限或并发控制时才加入

不建议新增：

- `make pages-build`
- `make publish-build`
- 独立的发布脚本
- `gh-pages` 分支同步脚本

## 发布流程设计

### 本地流程

开发者在仓库根目录执行：

```bash
make build
```

预期结果：

- 生成 `dist/vibecoding-tutorial-book/`
- 生成当前版本对应的压缩包
- 本地可直接检查 `dist/vibecoding-tutorial-book/index.html`

### CI 流程

GitHub Actions 执行顺序：

1. checkout 仓库代码
2. 准备 mdBook 环境
3. 执行 `make build`
4. 校验 `dist/vibecoding-tutorial-book/index.html` 存在
5. 上传 `dist/vibecoding-tutorial-book/` 为 Pages artifact
6. 部署到 GitHub Pages

### 访问路径

发布完成后，用户通过以下形式访问：

- `https://<user>.github.io/<repo>/`

因此必须验证：

- 首页可打开
- 章节导航可跳转
- CSS / JS / 字体等静态资源路径不丢失前缀
- Markdown 中的相对链接在 HTML 输出后仍然正确

## 验证策略

### 本地验证

本地至少验证以下内容：

1. `make build` 成功
2. `dist/vibecoding-tutorial-book/index.html` 存在
3. `dist/vibecoding-tutorial-book/` 下关键章节页面存在
4. 版本化压缩包仍正常生成

### 配置验证

在提交 workflow 前确认：

1. `book.toml` 中站点 URL / 路径前缀配置与项目页一致
2. workflow 使用的上传目录与 `Makefile` 输出目录一致
3. workflow 没有复制、搬运或二次构建书站目录

### 发布后验证

部署完成后手工验收：

1. `https://<user>.github.io/<repo>/` 可访问
2. 首页正常渲染
3. 左侧导航和章节跳转可用
4. 页面静态资源加载正常
5. 站内相对链接无 404

## 非目标

本次设计不包含以下内容：

- 自定义域名配置
- 多环境发布（如 preview / production）
- 推送到 `gh-pages` 分支的兼容工作流
- 为 Pages 单独新增构建命令
- 额外的主题定制或视觉改版

## 风险与应对

### 风险 1：项目页路径前缀导致资源 404

应对：
- 在 `book.toml` 中显式配置与项目页匹配的站点 URL / base path
- 发布后优先检查首页静态资源加载情况

### 风险 2：workflow 与 Makefile 各自维护一套构建规则

应对：
- workflow 只调用 `make build`
- 不在 workflow 中复写书籍输出目录逻辑

### 风险 3：现有打包流程被 Pages 改动破坏

应对：
- 保持 `dist/vibecoding-tutorial-book/` 为统一站点目录
- 不改变 `package` 对该目录的依赖关系
- 在验证中保留对版本化压缩包的检查

## 验收标准

本次设计完成后的实现应满足：

1. `make build` 仍然是唯一正式构建入口
2. `make build` 仍会生成站点目录与版本化压缩包
3. GitHub Actions 能基于 `make build` 自动发布 Pages
4. Pages 发布目录固定且清晰，为 `dist/vibecoding-tutorial-book/`
5. 项目页地址 `https://<user>.github.io/<repo>/` 可正常访问
6. 不引入第二套 CI 专用真实构建逻辑

## 结论

本设计选择以 `make build` 为中心，复用现有 `dist/vibecoding-tutorial-book/` 作为 GitHub Pages 发布目录，由 GitHub Actions 负责自动部署。这样既保留现有版本化打包工作流，也能以最小维护成本接入标准的 Pages 发布路径，是当前项目最稳妥的落地方案。
