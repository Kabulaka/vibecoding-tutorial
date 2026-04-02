# 第四章《完整案例》精简 Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 将 `vibecoding-tutorial/case-study/build-a-real-project.md` 压缩为紧凑版，在保留完整主线的前提下，收敛到更接近单文件 1200-1500 字的教程风格。

**Architecture:** 保留章节结构不变，继续使用“目标 → 内容 → 实践 → 小结”框架，并保住完整主线：目标收敛 → 最小 PRD / tasks → 第一版 → 人类纠偏 → Debug → Review → 交付。通过删减重复铺垫、收束比喻、压缩长段解释、局部改成更紧凑的要点表达来实现压缩，而不是重写方向。

**Tech Stack:** Markdown, GitBook, Claude Code

**Execution Note:** 本计划不包含 git commit 步骤；只有在用户明确要求提交时再执行提交。

---

## File Structure

### Files to modify
- `vibecoding-tutorial/case-study/build-a-real-project.md` — 第四章正文，按紧凑版目标压缩并保留完整主线

### Files to reference
- `docs/superpowers/specs/2026-04-02-fourth-chapter-case-study-compression-design.md` — 已确认的精简设计
- `docs/superpowers/specs/2026-04-02-fourth-chapter-case-study-design.md` — 原始章节设计
- `vibecoding-tutorial-outline.md` — 第四章提纲来源
- `vibecoding-tutorial/SUMMARY.md` — 章节标题与路径基准

### Files not expected to change
- `vibecoding-tutorial/SUMMARY.md`
- `vibecoding-tutorial/README.md`

## Task 1: 压缩开场与第一步，保留目标收敛主线

**Files:**
- Modify: `vibecoding-tutorial/case-study/build-a-real-project.md:11-60`
- Reference: `docs/superpowers/specs/2026-04-02-fourth-chapter-case-study-compression-design.md`

- [ ] **Step 1: 压缩开场段，保留范围与案例定位**

```md
### 这次不再讲原则，直接做一个完整项目

前三章讲的是方法，这一章要把方法真正跑起来。

这次我们故意不做大而全的系统，只围绕一个小而完整的本地 Web 工具：**Prompt / Task 工作台**。目标不是证明 AI 多会生成，而是看清楚一个真实小项目怎样从模糊想法一路推进到交付。
```

- [ ] **Step 2: 压缩第一步前半，保留“模糊想法 → 最小 PRD”**

```md
### 第一步：先把模糊想法收敛成可执行目标

项目的起点不是“来，写吧”，而是先把终点钉住。

比如这句需求：

> 我想做个小工具，帮我把模糊需求整理一下，最好还能顺手拆成任务。

它真实，但还不够开工。因为输入、输出、边界和验收标准都不清楚。更稳的做法，是先把它收成一个**最小 PRD**：不用正式文档架子，但要先讲清楚这次到底做什么、做到哪里、怎么才算完成。
```

- [ ] **Step 3: 把最小 PRD 压成一组最小定义**

```md
在这个案例里，最小 PRD 至少要钉住：

- 输入：一段自然语言需求描述
- 输出：一组结构化任务卡
- 内容：目标、输入 / 输出、约束条件、验收标准、可执行子任务
- 形式：本地 Web 单页应用
- 约束：不接数据库，不做登录和权限
- 验收：输入需求后，页面能生成清晰、可继续加工的任务卡
```

- [ ] **Step 4: 压缩任务拆解说明，只保留“它是护栏”这一层**

```md
到这里还不能立刻开写，还要再做一步：把最小 PRD 翻成任务拆解。任务拆解不是装饰字段，而是实现护栏——先做什么、后做什么、主流程先验证什么、这次先别扩到哪里，都在这一步说清楚。
```

- [ ] **Step 5: 保留一个最短的指令示例与前文链接**

```md
如果把这一步翻成协作指令，大概就是：先按最小 PRD 实现本地单页的主流程，只交付输入、触发和任务卡展示，不扩展数据库、登录和额外功能。

这和前一章《[如何给 AI 下达“可执行任务”](../practical-skills/how-to-spec-tasks.md)》讲的是同一件事：先把目标和边界讲清，再让 AI 开始跑。
```

## Task 2: 压缩第二到第四步，保留实现、纠偏与 Debug 链路

**Files:**
- Modify: `vibecoding-tutorial/case-study/build-a-real-project.md:62-115`
- Reference: `docs/superpowers/specs/2026-04-02-fourth-chapter-case-study-compression-design.md`

- [ ] **Step 1: 压缩第二步，强调“最小可验证版本”**

```md
### 第二步：让 AI 先做出可运行的第一版

这一步不是让 AI 随便写一版，而是沿着最小 PRD 和任务拆解，先交一个**最小可验证版本**：输入需求、点击整理、看到结构化任务卡。先跑通主流程，再谈样式和扩展，才能尽早开始验证方向。
```

- [ ] **Step 2: 压缩第三步，保留“人类接管方向盘”的三件事**

```md
### 第三步：第一版出来后，人类开始接管方向盘

第一版出来后，最重要的不是继续放任 AI 发挥，而是由人接管三个动作：

- 控范围：先不让案例悄悄长成一个小产品
- 判质量：判断任务卡和交互是不是真的有用
- 压发挥：删掉这次目标并不需要的热心扩展

AI 负责加速，人负责定边界、做判断、组织验证。
```

- [ ] **Step 3: 压缩第四步，保留 Debug 的最小闭环**

```md
### 第四步：当问题出现，进入 Debug 闭环

假设长输入时，“约束条件”和“验收标准”混在了一起。这时别只说“结果不对”，而要把问题重新组织成四项：

- 现象：长需求下字段边界不清
- 范围：短输入基本正常
- 约束：先别重做页面，也别加新功能
- 期望：无论输入长短，两个字段都能稳定区分

这才是有效的 Debug。它不是催 AI 多试几次，而是让每一轮尝试更接近真实问题。需要时可回看《[让 AI 陷入 Debug 循环怎么办](../practical-skills/loop-and-debug.md)》。 
```

## Task 3: 压缩第五步、实践和小结，形成收口

**Files:**
- Modify: `vibecoding-tutorial/case-study/build-a-real-project.md:117-170`
- Reference: `docs/superpowers/specs/2026-04-02-fourth-chapter-case-study-compression-design.md`

- [ ] **Step 1: 压缩第五步，只保留 Review 的四个检查点**

```md
### 第五步：交付前做一次 AI Code Review

交付前，最好再做一次轻量但聚焦的 Review，只看四类问题：

- 过度设计
- 无关改动
- 边界遗漏
- 表达不一致

Review 不是为了显得严谨，而是把“看起来能交”提升成“真的敢交”。需要更系统的方法，可以回看《[如何让 AI 帮你做 Code Review](../practical-skills/code-review-for-ai.md)》。
```

- [ ] **Step 2: 压缩收尾，明确完整闭环已经走完**

```md
### 收尾：交付的不是一段代码，而是一套闭环

回头看，这次案例真正走完的是：需求描述 → 最小 PRD → 任务拆解 → AI 实现 → 调试修复 → Code Review → 交付收口。

页面只是载体，真正可迁移的是这套闭环：什么时候先收敛，什么时候让 AI 加速，什么时候把它拉回来重新对焦。
```

- [ ] **Step 3: 将实践压成 4-5 行的迁移练习**

```md
## 实践

任选一个你手边的小需求，按这条闭环走一遍：先写最小 PRD，再拆任务，再让 AI 交付第一版；如果出现问题，用“现象、范围、约束、期望结果”组织 Debug；最后做一次只看过度设计、无关改动、边界遗漏和表达不一致的 Review。
```

- [ ] **Step 4: 将小结压成 1-2 段，并引到第五章**

```md
## 小结

第四章真正想交付给你的，不是某个案例答案，而是一种项目推进方式：目标收敛、任务拆解、最小实现、纠偏、Debug、Review、收口。

接下来进入第五章，我们会专门聊一个所有人迟早都会遇到的问题：上下文一长，AI 为什么就开始跑偏。请继续阅读《[上下文一长，为什么 AI 就开始跑偏](../best-practices/context-limits.md)》。
```

## Task 4: 统一收口并检查字数、链接和主线

**Files:**
- Modify: `vibecoding-tutorial/case-study/build-a-real-project.md`
- Reference: `vibecoding-tutorial-outline.md`
- Reference: `vibecoding-tutorial/SUMMARY.md`

- [ ] **Step 1: 确认仍保留统一结构**

```md
检查点：
- `## 目标`
- `## 内容`
- `## 实践`
- `## 小结`
```

- [ ] **Step 2: 确认完整主线仍然可见**

```md
必须清楚读到：
- 目标收敛
- 最小 PRD / spec
- tasks 拆解
- 最小可验证版本
- Debug 闭环
- Review / 交付
```

- [ ] **Step 3: 检查必要链接仍存在且仅保留一处自然入口**

```md
必须保留：
- `../practical-skills/how-to-spec-tasks.md`
- `../practical-skills/loop-and-debug.md`
- `../practical-skills/code-review-for-ai.md`
- `../best-practices/context-limits.md`
```

- [ ] **Step 4: 压缩重复比喻和反复总结**

```md
删减目标：
- 同一意思不重复解释两次
- 类比只保留最顺的一句
- 每节尽量控制在 1-2 段内
```

- [ ] **Step 5: 最终通读全文，确认已接近紧凑版目标**

Run: `sed -n '1,220p' vibecoding-tutorial/case-study/build-a-real-project.md`
Expected: 第四章仍然完整，但明显更紧、更顺，接近 1200-1500 字的单文件目标
