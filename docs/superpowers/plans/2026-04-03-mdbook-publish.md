# mdBook 发布 vibecoding-tutorial Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 将 `vibecoding-tutorial/` 原位构建为 mdBook 静态站点，输出到单个目录，并在左侧导航中显示带编号的树状章/节结构。

**Architecture:** 在仓库根目录添加 `book.toml`，把 `vibecoding-tutorial/` 作为 mdBook `src`。通过为每个一级章节补充 `README.md` 作为章节入口页，并把 `SUMMARY.md` 改成嵌套结构，让 mdBook 原生生成 `1 / 1.1 / 1.2` 形式的树状导航。最后构建并检查输出目录中的 HTML 导航与链接。

**Tech Stack:** mdBook, Markdown, TOML, Python（仅用于本地校验命令）

---

## File Structure

- Create: `book.toml` — mdBook 根配置，定义源目录、输出目录与 HTML 编号显示
- Create: `vibecoding-tutorial/quick-start/README.md` — 第一章入口页，用于生成编号父节点 `1`
- Create: `vibecoding-tutorial/core-concepts/README.md` — 第二章入口页，用于生成编号父节点 `2`
- Create: `vibecoding-tutorial/practical-skills/README.md` — 第三章入口页，用于生成编号父节点 `3`
- Create: `vibecoding-tutorial/case-study/README.md` — 第四章入口页，用于生成编号父节点 `4`
- Create: `vibecoding-tutorial/best-practices/README.md` — 第五章入口页，用于生成编号父节点 `5`
- Modify: `vibecoding-tutorial/SUMMARY.md` — 从“按章标题分组的平铺列表”改成 mdBook 嵌套章节树
- Modify: `vibecoding-tutorial/README.md` — 把首页章节入口链接改到各章 `README.md`，与导航结构保持一致
- Verify: `dist/vibecoding-tutorial-book/index.html` — 构建产物入口

### Task 1: 添加 mdBook 根配置

**Files:**
- Create: `book.toml`

- [ ] **Step 1: 先运行构建命令，确认当前项目还不是 mdBook 工程**

Run:
```bash
cd /home/nika/workspace/doc/vibecoding && mdbook build
```

Expected: FAIL，报错包含 `book.toml` 缺失或当前目录不是 mdBook book root。

- [ ] **Step 2: 创建 `book.toml` 最小配置**

Write:
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
```

- [ ] **Step 3: 再次运行构建，确认下一步失败点已经转移到目录结构而不是配置缺失**

Run:
```bash
cd /home/nika/workspace/doc/vibecoding && mdbook build
```

Expected: FAIL 或部分构建失败；如果失败，错误应不再是缺少 `book.toml`，而是后续 `SUMMARY.md` / 章节入口文件问题。

- [ ] **Step 4: 提交配置文件**

Run:
```bash
git -C /home/nika/workspace/doc/vibecoding add book.toml
git -C /home/nika/workspace/doc/vibecoding commit -m "build: add mdBook root config"
```

Expected: PASS，生成包含 `build: add mdBook root config` 的提交。

### Task 2: 把 `SUMMARY.md` 改成带编号的树状章节结构

**Files:**
- Modify: `vibecoding-tutorial/SUMMARY.md`
- Create: `vibecoding-tutorial/quick-start/README.md`
- Create: `vibecoding-tutorial/core-concepts/README.md`
- Create: `vibecoding-tutorial/practical-skills/README.md`
- Create: `vibecoding-tutorial/case-study/README.md`
- Create: `vibecoding-tutorial/best-practices/README.md`

- [ ] **Step 1: 先把 `SUMMARY.md` 改成 mdBook 的嵌套章节树，故意引用尚未创建的章节入口页**

Replace `vibecoding-tutorial/SUMMARY.md` with:
```md
# Summary

[教程介绍](README.md)

- [第一章：快速开始](quick-start/README.md)
  - [什么是 VibeCoding？](quick-start/what-is-vibecoding.md)
  - [你的第一次"甩手掌柜"体验](quick-start/first-vibe.md)
  - [核心工具链与神仙套件](quick-start/toolkit-setup.md)
- [第二章：核心范式](core-concepts/README.md)
  - [角色转变：从"开发者"到"总指挥"](core-concepts/commander-vs-coder.md)
  - [上下文管理：如何喂饱 AI 的记忆](core-concepts/context-is-all.md)
  - [AI 可信度模型](core-concepts/ai-trust-model.md)
  - [自动化测试：Vibe Coding 的安全带](core-concepts/test-driven-vibe.md)
  - [AI 能力扩展三件套](core-concepts/skills-hooks-and-mcp.md)
- [第三章：实战操纵](practical-skills/README.md)
  - [如何给 AI 下达“可执行任务”](practical-skills/how-to-spec-tasks.md)
  - [拆解大需求：从 PRD 到逐步实现](practical-skills/big-feature-breakdown.md)
  - [死循环处理：当 AI 陷入反复尝试怎么办](practical-skills/loop-and-debug.md)
  - [审查 AI 的代码](practical-skills/code-review-for-ai.md)
  - [老代码重构：让 AI 接管遗留系统](practical-skills/refactor-with-vibe.md)
- [第四章：完整案例](case-study/README.md)
  - [从 0 到交付：端到端实战演示](case-study/build-a-real-project.md)
- [第五章：最佳实践](best-practices/README.md)
  - [上下文的"黄金边界"与防退化指南](best-practices/context-limits.md)
  - ["及时回退"法则：避免无效迭代](best-practices/rewind-not-loop.md)
  - [巨型需求的"原子化"拆解法](best-practices/epic-to-story.md)
  - [高效协作原则](best-practices/dos-and-donts.md)
  - [为什么核心不是 Prompt，而是任务设计](best-practices/prompt-less-is-more.md)
  - [成本、限制与不适用场景](best-practices/limitations-and-costs.md)
  - [进阶：构建自动化 AI 开发工作流](best-practices/next-steps.md)
```

- [ ] **Step 2: 运行构建，确认失败信息指向缺失的章节入口页**

Run:
```bash
cd /home/nika/workspace/doc/vibecoding && mdbook build
```

Expected: FAIL，报错包含 `quick-start/README.md`、`core-concepts/README.md` 等文件不存在。

- [ ] **Step 3: 创建第一章入口页**

Create `vibecoding-tutorial/quick-start/README.md`:
```md
# 第一章：快速开始

这一章的目标不是把所有概念一次讲透，而是先让你对 VibeCoding 建立直觉，完成第一次协作体验，并认识后续会频繁使用的工具链。

## 本章内容

- [什么是 VibeCoding？](./what-is-vibecoding.md)
- [你的第一次"甩手掌柜"体验](./first-vibe.md)
- [核心工具链与神仙套件](./toolkit-setup.md)

## 建议阅读顺序

按上面的顺序阅读即可：先建立概念，再体验一次，再补齐工具认知。
```

- [ ] **Step 4: 创建第二章入口页**

Create `vibecoding-tutorial/core-concepts/README.md`:
```md
# 第二章：核心范式

这一章解释 VibeCoding 为什么可行，以及为什么很多人“用了 AI 但还是很痛苦”。重点不是多会写 Prompt，而是理解角色、上下文、可信度和扩展能力。

## 本章内容

- [角色转变：从"开发者"到"总指挥"](./commander-vs-coder.md)
- [上下文管理：如何喂饱 AI 的记忆](./context-is-all.md)
- [AI 可信度模型](./ai-trust-model.md)
- [自动化测试：Vibe Coding 的安全带](./test-driven-vibe.md)
- [AI 能力扩展三件套](./skills-hooks-and-mcp.md)

## 建议阅读顺序

建议按顺序阅读，因为后面的可信度判断、测试和扩展能力都建立在前面的协作范式之上。
```

- [ ] **Step 5: 创建第三章入口页**

Create `vibecoding-tutorial/practical-skills/README.md`:
```md
# 第三章：实战操纵

这一章聚焦“怎么把 AI 真正带进开发流程”。重点是把模糊需求变成可执行任务，并在 AI 走偏、生成代码、接手老系统时保持控制力。

## 本章内容

- [如何给 AI 下达“可执行任务”](./how-to-spec-tasks.md)
- [拆解大需求：从 PRD 到逐步实现](./big-feature-breakdown.md)
- [死循环处理：当 AI 陷入反复尝试怎么办](./loop-and-debug.md)
- [审查 AI 的代码](./code-review-for-ai.md)
- [老代码重构：让 AI 接管遗留系统](./refactor-with-vibe.md)

## 建议阅读顺序

先学任务设计，再看需求拆解；其余三篇分别对应执行过程中的偏航、审查和重构场景。
```

- [ ] **Step 6: 创建第四章入口页**

Create `vibecoding-tutorial/case-study/README.md`:
```md
# 第四章：完整案例

这一章用一个端到端案例把前面几章串起来，让你看到从需求、拆解、执行、审查到交付的完整链路。

## 本章内容

- [从 0 到交付：端到端实战演示](./build-a-real-project.md)

## 阅读建议

建议在完成前三章后再阅读，这样你能看懂案例里每一步背后的判断依据。
```

- [ ] **Step 7: 创建第五章入口页**

Create `vibecoding-tutorial/best-practices/README.md`:
```md
# 第五章：最佳实践

这一章沉淀长期协作的方法论，帮助你在项目变复杂、上下文变长、需求变大时，仍然能稳定地和 AI 协作。

## 本章内容

- [上下文的"黄金边界"与防退化指南](./context-limits.md)
- ["及时回退"法则：避免无效迭代](./rewind-not-loop.md)
- [巨型需求的"原子化"拆解法](./epic-to-story.md)
- [高效协作原则](./dos-and-donts.md)
- [为什么核心不是 Prompt，而是任务设计](./prompt-less-is-more.md)
- [成本、限制与不适用场景](./limitations-and-costs.md)
- [进阶：构建自动化 AI 开发工作流](./next-steps.md)

## 阅读建议

这一章更适合在你已经完成至少一次完整 AI 协作开发后回来看，会更有代入感。
```

- [ ] **Step 8: 运行构建，确认树状编号导航已经生成**

Run:
```bash
cd /home/nika/workspace/doc/vibecoding && mdbook build
```

Expected: PASS，输出目录 `dist/vibecoding-tutorial-book` 出现；侧边栏导航基于嵌套 `SUMMARY.md` 生成父子层级。

- [ ] **Step 9: 提交目录树改造**

Run:
```bash
git -C /home/nika/workspace/doc/vibecoding add \
  vibecoding-tutorial/SUMMARY.md \
  vibecoding-tutorial/quick-start/README.md \
  vibecoding-tutorial/core-concepts/README.md \
  vibecoding-tutorial/practical-skills/README.md \
  vibecoding-tutorial/case-study/README.md \
  vibecoding-tutorial/best-practices/README.md

git -C /home/nika/workspace/doc/vibecoding commit -m "docs: add numbered chapter entry pages"
```

Expected: PASS，生成包含章节入口页和嵌套目录的提交。

### Task 3: 让首页入口与章节树一致

**Files:**
- Modify: `vibecoding-tutorial/README.md`

- [ ] **Step 1: 先修改首页学习路径表格与“从这里开始”入口，让它们指向章节入口页**

Edit `vibecoding-tutorial/README.md` with these replacements:

1. Replace:
```md
| [第一章：快速开始](./quick-start/what-is-vibecoding.md) | 25 分钟 | 先建立直觉认知，完成第一次 VibeCoding 体验，并补齐核心工具链 |
| [第二章：核心范式](./core-concepts/commander-vs-coder.md) | 40 分钟 | 理解角色转变、上下文管理、可信度判断、测试与能力扩展 |
| [第三章：实战操纵](./practical-skills/how-to-spec-tasks.md) | 30 分钟 | 学会任务设计、需求拆解、死循环处理、代码审查与重构协作 |
| [第四章：完整案例](./case-study/build-a-real-project.md) | 30 分钟 | 用一个完整案例串起从需求到交付的全过程 |
| [第五章：最佳实践](./best-practices/context-limits.md) | 30 分钟 | 建立长期可复用的高效协作原则，避免常见踩坑 |
```
with:
```md
| [第一章：快速开始](./quick-start/README.md) | 25 分钟 | 先建立直觉认知，完成第一次 VibeCoding 体验，并补齐核心工具链 |
| [第二章：核心范式](./core-concepts/README.md) | 40 分钟 | 理解角色转变、上下文管理、可信度判断、测试与能力扩展 |
| [第三章：实战操纵](./practical-skills/README.md) | 30 分钟 | 学会任务设计、需求拆解、死循环处理、代码审查与重构协作 |
| [第四章：完整案例](./case-study/README.md) | 30 分钟 | 用一个完整案例串起从需求到交付的全过程 |
| [第五章：最佳实践](./best-practices/README.md) | 30 分钟 | 建立长期可复用的高效协作原则，避免常见踩坑 |
```

2. Replace:
```md
准备好了就从 [第一章：快速开始](./quick-start/what-is-vibecoding.md) 开始。
```
with:
```md
准备好了就从 [第一章：快速开始](./quick-start/README.md) 开始。
```

- [ ] **Step 2: 运行构建，确认首页链接仍能生成且不报路径错误**

Run:
```bash
cd /home/nika/workspace/doc/vibecoding && mdbook build
```

Expected: PASS，无路径报错；首页链接指向各章入口页。

- [ ] **Step 3: 提交首页入口调整**

Run:
```bash
git -C /home/nika/workspace/doc/vibecoding add vibecoding-tutorial/README.md
git -C /home/nika/workspace/doc/vibecoding commit -m "docs: align homepage links with mdBook chapters"
```

Expected: PASS，生成首页入口统一化的提交。

### Task 4: 校验构建产物满足验收标准

**Files:**
- Verify: `dist/vibecoding-tutorial-book/index.html`
- Verify: `dist/vibecoding-tutorial-book/quick-start/index.html`
- Verify: `dist/vibecoding-tutorial-book/core-concepts/index.html`

- [ ] **Step 1: 执行完整构建，确保输出目录是最终交付目录**

Run:
```bash
cd /home/nika/workspace/doc/vibecoding && mdbook build
```

Expected: PASS，输出目录为 `dist/vibecoding-tutorial-book/`。

- [ ] **Step 2: 用 Python 检查关键 HTML 文件存在**

Run:
```bash
cd /home/nika/workspace/doc/vibecoding && python - <<'PY'
from pathlib import Path
required = [
    Path('dist/vibecoding-tutorial-book/index.html'),
    Path('dist/vibecoding-tutorial-book/quick-start/index.html'),
    Path('dist/vibecoding-tutorial-book/core-concepts/index.html'),
    Path('dist/vibecoding-tutorial-book/practical-skills/index.html'),
    Path('dist/vibecoding-tutorial-book/case-study/index.html'),
    Path('dist/vibecoding-tutorial-book/best-practices/index.html'),
]
missing = [str(p) for p in required if not p.exists()]
if missing:
    raise SystemExit('Missing files: ' + ', '.join(missing))
print('OK: all required html files exist')
PY
```

Expected: PASS，输出 `OK: all required html files exist`。

- [ ] **Step 3: 用 Python 检查首页导航里出现编号父节点与子节点文本**

Run:
```bash
cd /home/nika/workspace/doc/vibecoding && python - <<'PY'
from pathlib import Path
html = Path('dist/vibecoding-tutorial-book/index.html').read_text(encoding='utf-8')
checks = [
    '第一章：快速开始',
    '第二章：核心范式',
    '什么是 VibeCoding？',
    '角色转变：从"开发者"到"总指挥"',
]
missing = [item for item in checks if item not in html]
if missing:
    raise SystemExit('Missing nav text: ' + ', '.join(missing))
print('OK: sidebar chapter labels exist in built HTML')
PY
```

Expected: PASS，输出 `OK: sidebar chapter labels exist in built HTML`。

- [ ] **Step 4: 手动打开入口页做最终验收**

Open:
```text
/home/nika/workspace/doc/vibecoding/dist/vibecoding-tutorial-book/index.html
```

Manual checklist:
```text
[ ] 左侧显示树状导航
[ ] 导航中能看到章/节层级
[ ] 章/节点击可跳转
[ ] 首页中的章节链接可点击
[ ] 页面可作为单个输出目录交付
```

Expected: 全部勾选。

- [ ] **Step 5: 提交最终发布配置与导航验证结果**

Run:
```bash
git -C /home/nika/workspace/doc/vibecoding status --short
```

Expected: 只剩本次计划内改动；如果工作树干净或仅保留构建产物未跟踪，说明实现完成，可以按仓库策略决定是否忽略 `dist/`。

## Self-Review Checklist

- Spec coverage:
  - 单个输出目录：Task 1 与 Task 4 覆盖
  - 原位构建：Task 1 覆盖
  - 左侧树状导航：Task 2 覆盖
  - 显示 `1 / 1.1 / 1.2` 风格编号层级：Task 2 覆盖
  - 页面链接点击：Task 3 与 Task 4 覆盖
- Placeholder scan: 无 `TODO` / `TBD` / “后续补充” 类占位内容
- Type consistency: 所有路径、目录名、输出目录名统一为 `dist/vibecoding-tutorial-book`
