# 第一章《快速开始》Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 完成 `vibecoding-tutorial/quick-start/` 下第一章的 3 篇正文，使读者在读完后理解 VibeCoding 的基本协作方式、看懂一次小功能协作示例，并具备最小可用工具链起步条件。

**Architecture:** 本章按“先理解 → 再惊艳 → 后落地”的顺序落地为 3 篇独立文章，每篇只承担一个核心目标。先写文章骨架与关键论点，再补足示例、过渡与收束，最后统一检查章节衔接、语气、链接和可读性。

**Tech Stack:** Markdown, GitBook, Claude Code, Superpowers, MCP, Hooks

**Execution Note:** 当前工作目录不是 git repository，因此本计划不包含 commit 步骤；如后续将教程纳入 git 管理，再补充提交检查点。

---

## File Structure

### Files to create
- `vibecoding-tutorial/quick-start/what-is-vibecoding.md` — 第一篇，建立 VibeCoding 认知框架与边界
- `vibecoding-tutorial/quick-start/first-vibe.md` — 第二篇，展示一次旁观式小功能协作开发闭环
- `vibecoding-tutorial/quick-start/toolkit-setup.md` — 第三篇，提供最小可用工具链上手路径

### Files to reference
- `vibecoding-tutorial/README.md` — 校准教程整体定位与语气
- `vibecoding-tutorial/SUMMARY.md` — 校准第一章条目名称与顺序
- `docs/superpowers/specs/2026-04-01-first-chapter-quick-start-design.md` — 本计划对应的已批准设计文档

### Files not expected to change
- `vibecoding-tutorial/SUMMARY.md` — 当前目录条目已存在，无需改动
- `vibecoding-tutorial/README.md` — 当前首页已可作为第一章的外层导览，无需改动

## Task 1: 写作第一篇《什么是 VibeCoding？》

**Files:**
- Create: `vibecoding-tutorial/quick-start/what-is-vibecoding.md`
- Reference: `vibecoding-tutorial/README.md`
- Reference: `docs/superpowers/specs/2026-04-01-first-chapter-quick-start-design.md`

- [ ] **Step 1: 写出文章骨架与标题层级**

```md
# 什么是 VibeCoding？

## 先别把它想成“更高级的 Prompt”

## 开发者的角色，已经悄悄变了

## 为什么这套方式现在值得学

## 你能把哪些活交给 AI，哪些不能

## 小结
```

- [ ] **Step 2: 写入开场破题段，明确它不是什么**

```md
VibeCoding 不是某个新框架，也不是“谁更会写 Prompt 谁就赢”。

它更像一种新的开发协作方式：你负责定义目标、补充上下文、判断结果是否靠谱，AI 负责帮你生成、修改、解释和推进实现。

所以问题不再只是“你会不会写代码”，而变成“你会不会把一件事描述清楚、拆清楚、验清楚”。
```

- [ ] **Step 3: 写出角色变化部分，强调开发重心迁移**

```md
过去你更像亲自上手的工匠：需求来了，自己拆、自己写、自己改。

现在你更像一个总指挥：

- 定义目标是什么
- 说明约束有哪些
- 判断结果对不对
- 发现跑偏时及时纠正

代码当然还是重要，但你的高价值时间，会更多花在任务设计、上下文组织和结果验收上。
```

- [ ] **Step 4: 写出“为什么值得学”部分，面向有经验开发者**

```md
这套方式之所以值得学，不是因为它能让人从此不写代码，而是因为它能把很多机械劳动压缩掉。

比如搭一个小页面、补一段样板逻辑、改一个常见交互、解释一段陌生代码，这些事情过去可能要你自己一点点敲；现在你可以把更多精力放在“做什么、为什么这样做、结果靠不靠谱”上。
```

- [ ] **Step 5: 写出边界提醒，避免神化 AI**

```md
但这里有个前提：AI 会犯错，而且会一本正经地犯错。

它可能误解需求、补错细节、写出能跑但不符合预期的实现，甚至把不确定的东西说得像真的一样。

所以 VibeCoding 不是“把活甩出去就完事”，而是“把机械部分交给 AI，把判断责任留在人手里”。
```

- [ ] **Step 6: 写出收束段，并引到第二篇**

```md
如果你现在已经大致理解了这种协作方式，下一步最重要的不是继续背概念，而是亲眼看一次完整过程。

因为只要你看过一次 AI 和人如何配合把一个小功能做出来，很多抽象说法都会瞬间落地。

下一篇，我们就直接看一次真实但轻量的协作演示。
```

- [ ] **Step 7: 保存文件并通读一遍**

Run: `sed -n '1,220p' vibecoding-tutorial/quick-start/what-is-vibecoding.md`
Expected: 文章包含完整标题层级、角色变化、价值说明、边界提醒与结尾过渡

## Task 2: 写作第二篇《你的第一次“甩手掌柜”体验》

**Files:**
- Create: `vibecoding-tutorial/quick-start/first-vibe.md`
- Reference: `vibecoding-tutorial/quick-start/what-is-vibecoding.md`
- Reference: `docs/superpowers/specs/2026-04-01-first-chapter-quick-start-design.md`

- [ ] **Step 1: 写出文章骨架，确保是“旁观式体验”而不是实操手册**

```md
# 你的第一次“甩手掌柜”体验

## 先看一个足够小的任务

## 第 1 轮：把需求说清楚

## 第 2 轮：让 AI 开始干活

## 第 3 轮：你不是旁观者，你是验收人

## 这就是一次最小可用的 VibeCoding 闭环
```

- [ ] **Step 2: 选定一个小而完整的示例任务并写入背景**

```md
为了先建立感觉，我们不选复杂业务，也不碰重架构。

就看一个足够常见的小任务：

> 在一个已有页面里，加一个“订阅更新”表单。用户输入邮箱后，点击按钮提交；提交成功后显示一条明确反馈。

这个任务的好处是：它小、完整、常见，而且很容易看出“几轮协作之后，东西就已经像样了”。
```

- [ ] **Step 3: 写第 1 轮协作，展示如何给出可执行任务**

```md
你不会只丢一句“帮我做个表单”然后听天由命。

更好的说法是：

- 页面里新增一个邮箱输入框和提交按钮
- 输入合法邮箱才能提交
- 提交成功后显示“订阅成功，请留意邮箱”
- 样式保持简单，不要额外引入组件库

这一步看起来像是在“多说几句”，但它其实是在给 AI 划边界。边界越清楚，返工越少。
```

- [ ] **Step 4: 写第 2 轮协作，强调速度感**

```md
一旦任务说清楚，AI 往往能很快给出第一版结果：

- 表单结构搭好了
- 输入校验补上了
- 成功反馈也出现了

这就是第一波冲击感：过去你可能要先搭结构、绑状态、写校验、补提示；现在很多机械步骤都被压缩了。

你会第一次直观感到：原来一个小功能真的可以推进得这么快。
```

- [ ] **Step 5: 写第 3 轮协作，强调人类判断没有消失**

```md
但你并没有下线。

这时候你还要继续看几件事：

- 交互文案是不是符合预期
- 校验是不是太松或太严
- 成功提示是不是出现得合理
- 代码改动有没有偏离你原本想要的范围

也就是说，AI 提速了实现过程，但“这是不是我要的”仍然由你拍板。
```

- [ ] **Step 6: 写结果验收与闭环总结**

```md
一次最小可用的 VibeCoding 闭环，通常就是这样：

1. 你把任务讲清楚
2. AI 快速给出第一版
3. 你检查、纠偏、补约束
4. AI 继续调整
5. 你验证结果是否真的可用

关键不是“AI 一把梭”，而是“你让它每一步都朝正确方向前进”。
```

- [ ] **Step 7: 写出过渡段，引到第三篇工具链**

```md
如果你已经开始觉得“这方式我也想试试”，那下一步就不是继续围观，而是把最小工具链搭起来。

别担心，第一章不追求把环境配到满级，我们只追求：你今天就能开始。
```

- [ ] **Step 8: 保存文件并通读一遍**

Run: `sed -n '1,260p' vibecoding-tutorial/quick-start/first-vibe.md`
Expected: 文章完整展示一个小功能协作闭环，突出速度感，同时明确人类仍负责判断与验收

## Task 3: 写作第三篇《核心工具链与神仙套件》

**Files:**
- Create: `vibecoding-tutorial/quick-start/toolkit-setup.md`
- Reference: `vibecoding-tutorial/quick-start/first-vibe.md`
- Reference: `docs/superpowers/specs/2026-04-01-first-chapter-quick-start-design.md`

- [ ] **Step 1: 写出文章骨架，控制在“轻量上手”深度**

```md
# 核心工具链与神仙套件

## 为什么现在就把工具装起来

## Claude Code：主力工作台

## Superpowers：把常见流程固化成技能

## MCP 和 Hooks：让 AI 接上外部能力

## 先装到能跑，再慢慢升级
```

- [ ] **Step 2: 写工具链总览段，说明主次关系**

```md
第一章不追求把工具链一次性武装到牙齿。

我们的目标很简单：先把最小可用组合搭起来，让你能开始用，再在后续章节里逐步升级。

这套组合里，Claude Code 是主工作台；Superpowers 帮你把常见流程标准化；MCP 和 Hooks 则让 AI 不只是“会聊天”，而是真的能接工具、接能力、接自动化。
```

- [ ] **Step 3: 写 Claude Code 部分，说明为什么它是起点**

```md
如果把 VibeCoding 比作带队开发，Claude Code 就像你的主控台。

你可以在里面提任务、看修改、读文件、跑命令、让 AI 分析上下文，还能逐步把一次模糊想法推进成真正可执行的工作。

所以第一步不是把所有增强件都装上，而是先确保你有一个能稳定工作的主入口。
```

- [ ] **Step 4: 写 Superpowers / MCP / Hooks 的最小认知说明**

```md
接下来你会反复见到 3 个关键词：

- **Superpowers**：把常见工作流做成技能，比如 brainstorming、debugging、code review
- **MCP**：给 AI 接入额外工具和外部资源
- **Hooks**：在特定时机自动触发动作，比如检查、提醒或格式化

你现在不需要把它们全部吃透，只要先知道：这些东西的作用，是把 AI 从“会回答问题”推进到“会参与工作流”。
```

- [ ] **Step 5: 写最小安装/启用路径，避免展开高级配置**

```md
建议你的起步顺序是：

1. 先确保 Claude Code 可以正常使用
2. 再启用默认就能明显提升体验的技能或配置
3. 最后在需要时逐步接入 MCP 与 Hooks

先别急着折腾一整套“大神配置”。

因为对初学者来说，真正重要的不是配置数量，而是你能不能先把第一次协作跑通。
```

- [ ] **Step 6: 写最小验证动作，确保读者可以立即尝试**

```md
工具装好后，马上做一个最小验证动作。

比如直接给 Claude Code 一个简单任务：

> 读取当前项目结构，并告诉我这个项目最适合从哪里开始。

如果它能稳定读取上下文、解释结果、给出合理建议，你就已经完成了“能起跑”的那一步。
```

- [ ] **Step 7: 写收束段，结束第一章**

```md
到这里，第一章的目标就完成了。

你已经知道 VibeCoding 是什么，看过一次小功能协作闭环，也把最小工具链搭了起来。

你现在当然还不是熟练使用者，但这不重要。重要的是：你已经从“听说过”走到了“可以开始用”。
```

- [ ] **Step 8: 保存文件并通读一遍**

Run: `sed -n '1,260p' vibecoding-tutorial/quick-start/toolkit-setup.md`
Expected: 文章清楚解释工具链角色、给出最小上手路径，并以“敢开始用”收束全章

## Task 4: 统一校对第一章的衔接、链接与风格

**Files:**
- Modify: `vibecoding-tutorial/quick-start/what-is-vibecoding.md`
- Modify: `vibecoding-tutorial/quick-start/first-vibe.md`
- Modify: `vibecoding-tutorial/quick-start/toolkit-setup.md`
- Reference: `vibecoding-tutorial/README.md`
- Reference: `vibecoding-tutorial/SUMMARY.md`

- [ ] **Step 1: 检查三篇标题、开头和结尾是否顺着“先理解 → 再惊艳 → 后落地”**

```md
检查点：
- 第一篇结尾明确引到“看一次完整协作”
- 第二篇结尾明确引到“搭最小工具链”
- 第三篇结尾明确收束“现在可以开始用”
```

- [ ] **Step 2: 补齐必要的相对链接**

```md
需要出现的相对链接：
- 在 `what-is-vibecoding.md` 中链接到 `./first-vibe.md`
- 在 `first-vibe.md` 中链接到 `./toolkit-setup.md`
- 在 `toolkit-setup.md` 中可回链 `./what-is-vibecoding.md` 或自然指向后续章节
```

- [ ] **Step 3: 统一语气与篇幅，避免一篇像博客、一篇像说明书**

```md
统一要求：
- 简体中文，术语保留英文
- 语气亲切、实用、略带幽默
- 每篇都包含“小结”性质的收束
- 不夸大 AI 能力，不写成宣传文案
```

- [ ] **Step 4: 逐篇快速自检可读性**

Run: `for f in vibecoding-tutorial/quick-start/what-is-vibecoding.md vibecoding-tutorial/quick-start/first-vibe.md vibecoding-tutorial/quick-start/toolkit-setup.md; do echo "===== $f ====="; sed -n '1,260p' "$f"; done`
Expected: 三篇内容结构完整、过渡自然、链接路径正确、语气统一

## Task 5: 最终验证第一章与目录的一致性

**Files:**
- Reference: `vibecoding-tutorial/SUMMARY.md`
- Reference: `vibecoding-tutorial/quick-start/what-is-vibecoding.md`
- Reference: `vibecoding-tutorial/quick-start/first-vibe.md`
- Reference: `vibecoding-tutorial/quick-start/toolkit-setup.md`

- [ ] **Step 1: 确认 3 个文件名与 SUMMARY 条目完全一致**

```md
应一致的文件：
- quick-start/what-is-vibecoding.md
- quick-start/first-vibe.md
- quick-start/toolkit-setup.md
```

- [ ] **Step 2: 确认第一章完成后能支撑第二章的阅读前提**

```md
验证点：
- 读者已理解“VibeCoding 是协作方式”
- 读者已看过一次最小协作闭环
- 读者已具备继续阅读后续章节的最小工具认知
```

- [ ] **Step 3: 最终人工通读第一章 3 篇内容**

Run: `for f in vibecoding-tutorial/quick-start/*.md; do echo "===== $f ====="; sed -n '1,260p' "$f"; done`
Expected: 第一章三篇内容可独立阅读，也能按顺序形成完整的新手起步路径
