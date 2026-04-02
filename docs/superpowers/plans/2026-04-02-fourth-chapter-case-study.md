# 第四章《完整案例》Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 完成 `vibecoding-tutorial/case-study/build-a-real-project.md`，用一个本地 Web 版 Prompt / Task 工作台案例串起“需求收敛 → 拆解 → 实现 → Debug → Review → 交付”的完整 VibeCoding 闭环。

**Architecture:** 本章只产出一篇案例正文，但内部按 7 个连续阶段推进：开场、目标收敛、第一版实现、人类纠偏、Debug、Code Review、交付收束。写作时以“产品构建型主线”为骨架，重点展示关键 prompt、关键决策与关键检查点，不扩展数据库、鉴权、部署等会打散主线的内容。

**Tech Stack:** Markdown, GitBook, Claude Code, Superpowers, 本地 Web 应用案例

**Execution Note:** 本计划不包含 git commit 步骤；只有在用户明确要求提交时再执行提交。

---

## File Structure

### Files to create
- `vibecoding-tutorial/case-study/build-a-real-project.md` — 第四章完整案例正文，展示从模糊想法到交付的端到端协作过程

### Files to reference
- `vibecoding-tutorial-outline.md` — 第四章权威提纲来源
- `vibecoding-tutorial/SUMMARY.md` — 第四章标题与路径基准
- `docs/superpowers/specs/2026-04-02-fourth-chapter-case-study-design.md` — 已确认的第四章设计文档
- `vibecoding-tutorial/practical-skills/how-to-spec-tasks.md` — 任务描述方法的前文承接
- `vibecoding-tutorial/practical-skills/loop-and-debug.md` — Debug 闭环的前文承接
- `vibecoding-tutorial/practical-skills/code-review-for-ai.md` — Code Review 的前文承接
- `vibecoding-tutorial/core-concepts/commander-vs-coder.md` — “总指挥”主线的前文承接
- `vibecoding-tutorial/core-concepts/test-driven-vibe.md` — 验收与测试护栏的前文承接

### Files not expected to change
- `vibecoding-tutorial/SUMMARY.md` — 当前第四章条目已存在且命名正确，无需改动
- `vibecoding-tutorial/README.md` — 本轮只写章节正文，不回改首页

## Task 1: 搭好第四章骨架与开场定位

**Files:**
- Create: `vibecoding-tutorial/case-study/build-a-real-project.md`
- Reference: `docs/superpowers/specs/2026-04-02-fourth-chapter-case-study-design.md`
- Reference: `vibecoding-tutorial/SUMMARY.md`

- [ ] **Step 1: 写出整篇文章骨架，固定 7 段主线与统一节奏**

```md
# 从 0 到交付：端到端实战演示

## 目标

## 内容

### 这次不再讲原则，直接做一个完整项目

### 第一步：先把模糊想法收敛成可执行目标

### 第二步：让 AI 先做出可运行的第一版

### 第三步：第一版出来后，人类开始接管方向盘

### 第四步：当问题出现，进入 Debug 闭环

### 第五步：交付前做一次 AI Code Review

### 收尾：交付的不是一段代码，而是一套闭环

## 实践

## 小结
```

- [ ] **Step 2: 写 `## 目标`，明确第四章不是继续讲概念，而是跑完整闭环**

```md
读完这一篇，你应该第一次真正看到：VibeCoding 不是几个零散技巧拼起来的热闹，而是一条能从模糊想法一路推进到可交付结果的完整工作流。

前面三章，你已经分别学过角色转变、上下文管理、测试护栏、任务设计、Debug 和代码审查；这一篇不再单独讲哪一招更厉害，而是把这些动作按真实顺序跑一遍，让你建立“整套流程是怎么闭环的”这件事的整体感。
```

- [ ] **Step 3: 写开场段，交代本章产物与复杂度边界**

```md
这次我们不做大而全的产品，也不拉数据库、权限系统和部署流水线进来开会。

我们只做一个小而完整的本地 Web 工具：**Prompt / Task 工作台**。

它解决的问题很朴素：当你脑子里只有一句模糊需求时，怎样把它整理成 AI 更容易执行、你也更容易验收的任务卡。

这个题材足够轻，但流程足够完整，正适合拿来演示一次真正的 VibeCoding 闭环。
```

- [ ] **Step 4: 在开场末尾补一句，明确这一章关注的是流程完整而不是功能炫技**

```md
这一章的重点，不是证明 AI 能一口气变出多复杂的系统，而是证明：只要目标、边界和节奏掌握得当，人和 AI 确实可以把一个真实小项目稳稳推进到交付。
```

- [ ] **Step 5: 通读开头 80 行，确认读者能立刻知道“做什么、为什么做、边界在哪”**

Run: `sed -n '1,80p' vibecoding-tutorial/case-study/build-a-real-project.md`
Expected: 标题、目标、开场场景、案例产物与复杂度边界清晰完整

## Task 2: 写“需求收敛”阶段，建立案例起点

**Files:**
- Modify: `vibecoding-tutorial/case-study/build-a-real-project.md`
- Reference: `vibecoding-tutorial/practical-skills/how-to-spec-tasks.md`
- Reference: `docs/superpowers/specs/2026-04-02-fourth-chapter-case-study-design.md`

- [ ] **Step 1: 写原始模糊需求，故意保持“像真实想法但不可直接开工”**

```md
假设你现在脑子里只有这么一句话：

> 我想做个小工具，帮我把模糊需求整理一下，最好还能顺手拆成任务。

这句话不算错，但还远远不够开工。

因为它没有说清楚：谁来用、输入什么、输出什么、哪些事情这次不做、做到什么程度算完成。
```

- [ ] **Step 2: 把模糊需求收敛为可执行目标，写成结构化说明**

```md
于是，我们先把它收敛成这次案例的明确目标：

- 输入：一段自然语言需求描述
- 输出：结构化任务卡
- 卡片内容：目标、输入 / 输出、约束、验收标准、可执行子任务
- 形式：本地 Web 页面，单页完成交互
- 约束：不接数据库、不做登录、不追求持久化
- 验收：用户能输入一段需求，并得到一组清晰、可阅读的任务卡结果
```

- [ ] **Step 3: 写一个关键 prompt 示例，展示“总指挥式表达”**

```text
请帮我实现一个本地 Web 版 Prompt / Task 工作台。

目标：把一段模糊需求整理成结构化任务卡。
输出内容至少包含：目标描述、输入/输出、约束条件、验收标准、可执行子任务。
约束：
- 只做单页本地 Web 应用
- 不接数据库
- 不做登录和权限
- 先实现主流程，再考虑细节优化
完成后请说明页面结构、核心交互流程，以及我该如何最小验证。
```

- [ ] **Step 4: 写解释段，点明为什么这一步才是真正的起点**

```md
你会发现，真正的起点并不是“让 AI 开始写代码”，而是先把终点钉住。

一旦目标、输出、约束和验收标准说清楚，AI 才是在朝一个明确方向施工；否则它只是根据你的语气，努力猜老板今天心情如何。
```

- [ ] **Step 5: 在段末自然回扣 `../practical-skills/how-to-spec-tasks.md`**

```md
如果你对这种“先把任务写成可执行目标”的方法还有点陌生，可以回看前一章的《[如何给 AI 下达"可执行任务"](../practical-skills/how-to-spec-tasks.md)》。第四章只是把那套方法真正带进一次完整项目里。
```

- [ ] **Step 6: 通读这一段，确认模糊需求、收敛结果、关键 prompt 与解释顺序自然**

Run: `sed -n '80,170p' vibecoding-tutorial/case-study/build-a-real-project.md`
Expected: 读者能清楚看到“模糊想法 → 可执行目标”的转换过程

## Task 3: 写“第一版实现”阶段，展示速度感但不过度神化 AI

**Files:**
- Modify: `vibecoding-tutorial/case-study/build-a-real-project.md`
- Reference: `vibecoding-tutorial/core-concepts/commander-vs-coder.md`
- Reference: `vibecoding-tutorial/core-concepts/test-driven-vibe.md`

- [ ] **Step 1: 写 AI 先产出第一版的目标，明确只求跑通主流程**

```md
目标收敛之后，就可以让 AI 先把第一版跑起来。

这里的关键策略不是“一口气做满”，而是先做一个**最小可运行版本**：

- 一个输入区，用来粘贴原始需求
- 一个按钮，用来触发整理
- 一个结果区，用来展示结构化任务卡

先让主流程跑通，再谈细节质量。这比一开始就要求它把所有边角都照顾到，更稳也更快。
```

- [ ] **Step 2: 写 AI 第一版可能交出的结果，用列表展示核心能力**

```md
在这一步，AI 通常能很快给出一个像样的基础版本：

- 页面骨架搭好了
- 输入框和按钮能正常交互
- 点击后会生成一组任务卡
- 卡片里已经分出了目标、约束和验收这类基本结构

这就是 VibeCoding 最容易让人上头的地方：你刚把任务说清楚，东西已经长出来了。
```

- [ ] **Step 3: 写提醒段，强调第一版“能跑”不等于“能交付”**

```md
但这里先别急着庆祝。

第一版的价值，是把抽象想法快速变成可以讨论、可以检查、可以继续修的具体东西；它的价值不在于“一次完美”，而在于“尽快把正确的讨论对象摆到桌面上”。
```

- [ ] **Step 4: 补一个简短的最小验证清单，把测试护栏轻量带入**

```md
这时候更稳的做法，不是凭感觉说“看着还行”，而是先跑一遍最小验证：

1. 输入一段模糊需求，是否真的能产出任务卡
2. 结果结构是否包含约束和验收标准
3. 页面交互是否完整，没有点了没反应的尴尬场面

这还不是正式测试体系，但已经是在给速度装护栏了。
```

- [ ] **Step 5: 通读这一段，确认“速度感 → 限制感 → 最小验证”三层都在**

Run: `sed -n '170,250p' vibecoding-tutorial/case-study/build-a-real-project.md`
Expected: 第一版实现既体现效率，也明确说明其边界与最小验证方式

## Task 4: 写“人类纠偏”阶段，突出总指挥职责

**Files:**
- Modify: `vibecoding-tutorial/case-study/build-a-real-project.md`
- Reference: `vibecoding-tutorial/core-concepts/commander-vs-coder.md`

- [ ] **Step 1: 写“第一版出来后，人类开始接管方向盘”主段**

```md
真正有经验的协作者，看到第一版后不会只说一句“不错，继续”。

因为这时候最有价值的工作，已经从“让东西长出来”切换成“判断它是不是朝对的方向长”。

这正是第二章里说的总指挥角色开始真正发挥作用的地方。
```

- [ ] **Step 2: 写人类需要检查的 4 个维度**

```md
这时你至少要看 4 件事：

- 有没有超出原本范围，偷偷做了你没要求的发挥
- 页面交互是不是符合最初目标，而不是只是“有东西在动”
- 任务卡结构是否清晰，读者能不能一眼看明白
- 文案和结果表达是否一致，没有一半像产品，一半像接口文档
```

- [ ] **Step 3: 写一个具体偏差示例，展示为什么需要人工判断**

```md
比如，AI 也许会很热心地补上“优先级”“风险等级”“预计工时”这些字段。

听起来很专业，但如果你这次的目标只是把模糊需求整理成最小可执行任务卡，这些内容反而会让页面更乱、理解更慢，还把案例主线悄悄带偏。

这就是为什么“看起来更丰富”不等于“更适合当前目标”。
```

- [ ] **Step 4: 写收口句，强调人类价值在于判断，不在于抢回实现权**

```md
AI 的价值，是把很多机械实现迅速往前推；人类的价值，是决定哪些该留、哪些该删、哪些虽然能做但这次根本不该做。

你不是要把键盘抢回来，而是要把方向盘握稳。
```

- [ ] **Step 5: 通读这一段，确认“总指挥”主线足够明确且不流于口号**

Run: `sed -n '250,320p' vibecoding-tutorial/case-study/build-a-real-project.md`
Expected: 这一段清楚说明人类如何在第一版后做范围控制与质量判断

## Task 5: 写“Debug 闭环”阶段，展示如何在问题出现时重建上下文

**Files:**
- Modify: `vibecoding-tutorial/case-study/build-a-real-project.md`
- Reference: `vibecoding-tutorial/practical-skills/loop-and-debug.md`

- [ ] **Step 1: 设定一个真实而轻量的问题，避免凭空大故障**

```md
接下来，问题果然来了。

页面能跑，任务卡也能生成，但当你输入一段更长的需求时，结果区会把“验收标准”和“可执行子任务”混在一起，读起来像两拨人在争抢同一个文本框。

这不是致命 bug，但它足够真实：第一版常常能跑，却不一定能稳稳表达对。
```

- [ ] **Step 2: 写错误示范，指出“别直接让 AI 盲改”**

```md
这时候最容易犯的错，是直接甩一句：

> 这里不对，你改一下。

这类说法的问题，和一开始那句模糊需求几乎一模一样：信息不够，范围不清，AI 很容易再次进入高风险猜测模式。
```

- [ ] **Step 3: 写更好的 Debug 指令，补足现象、范围、约束与预期**

```text
请帮我分析 Prompt / Task 工作台的结果展示问题。

现象：输入较长需求时，任务卡中的“验收标准”和“可执行子任务”会混在一起，阅读顺序不清。
范围：只检查结果展示区的结构与渲染逻辑。
约束：不要重做整个页面；不要扩展新字段；先解释你认为问题出在哪，再给修改方案。
完成后请告诉我最小验证步骤。
```

- [ ] **Step 4: 写解释段，点明 Debug 的关键是重新组织上下文而不是重复尝试**

```md
真正有效的 Debug，不是让 AI 多试几次，而是让它少猜几次。

你一旦把现象、范围、约束和预期补完整，问题空间就会迅速缩小；协作的节奏也会从“乱改一通”回到“围着同一个问题定位”。
```

- [ ] **Step 5: 在段末自然回扣 `../practical-skills/loop-and-debug.md`**

```md
如果你发现 AI 已经开始来回试同几种办法，却始终没碰到问题核心，就该及时打断，回到前一章《[死循环处理：当 AI 陷入反复尝试怎么办](../practical-skills/loop-and-debug.md)》讲的那套方法：先收缩问题，再继续推进。
```

- [ ] **Step 6: 通读这一段，确认问题示例、错误示范、改进指令与方法解释完整**

Run: `sed -n '320,410p' vibecoding-tutorial/case-study/build-a-real-project.md`
Expected: Debug 段清楚展示“问题出现 → 补上下文 → 缩小问题空间 → 继续推进”的闭环

## Task 6: 写“Code Review 与交付”阶段，完成案例收束

**Files:**
- Modify: `vibecoding-tutorial/case-study/build-a-real-project.md`
- Reference: `vibecoding-tutorial/practical-skills/code-review-for-ai.md`
- Reference: `vibecoding-tutorial/core-concepts/test-driven-vibe.md`

- [ ] **Step 1: 写交付前 Code Review 的目标，说明不是重型流程而是聚焦检查**

```md
问题修完，不代表可以直接收工。

在真正交付前，还需要做一件很关键但经常被忽略的事：对 AI 产物做一次聚焦型 Code Review。

这里的目标不是摆出一套大厂审核阵仗，而是确认这个小项目没有留下那些最典型、最容易混进交付物里的问题。
```

- [ ] **Step 2: 写 4 项轻量 review checklist**

```md
这次案例里，最值得重点看的通常是这 4 类问题：

1. 有没有过度设计，塞进了这次目标根本不需要的字段或流程
2. 有没有无关改动，明明只该改结果区，却顺手动了别的结构
3. 有没有边界遗漏，比如空输入、超长文本、结果为空时的展示
4. 有没有表达不一致，页面文案和任务卡结构一会儿像产品，一会儿像调试日志
```

- [ ] **Step 3: 写“为什么 AI 代码尤其需要这种检查”解释段**

```md
AI 写代码时，最常见的问题未必是“完全不能跑”，反而常常是“能跑，但夹带了不少热心发挥”。

所以 review 的意义，不只是抓 bug，更是确认产物是不是仍然忠于最初目标。
```

- [ ] **Step 4: 写最终交付结果，用 3 项成果收束本章案例**

```md
到这里，这个小项目就算真正完成了。

你最终交付的，不只是一个能输入需求、生成任务卡的本地 Web 工具，还包括：

- 一条从模糊想法到结构化任务的主流程
- 一套围绕边界、Debug 和 Review 的协作节奏
- 一个足够小、但能完整演示 VibeCoding 方法论的案例样本
```

- [ ] **Step 5: 写“收尾”段，把价值收束到工作流而不是页面功能**

```md
这就是第四章最想让你带走的东西：交付的从来不只是那一页 UI，而是一整套闭环。

页面只是载体，真正可迁移的是这条节奏：先收敛目标，再快速产出第一版；先把问题说清，再让 AI 修；交付前不靠感觉，而靠检查点收口。
```

- [ ] **Step 6: 在结尾自然引到第五章 `../best-practices/context-limits.md`**

```md
当你第一次把完整闭环跑顺，下一步就不是继续追求“更会下指令”，而是学会长期稳定地把这套节奏保持住。第五章，我们就来专门聊这些让协作不退化的最佳实践。先从《[上下文的"黄金边界"与防退化指南](../best-practices/context-limits.md)》开始。
```

- [ ] **Step 7: 写 `## 实践`，给读者一个可迁移的小练习**

```md
你不一定要复刻同一个 Prompt / Task 工作台，但可以立刻试着把自己手头的一个小需求，按这篇文章的顺序走一遍：

1. 先把模糊想法改写成目标、输出、约束、验收标准
2. 让 AI 先做最小可运行版本
3. 检查它有没有超范围发挥
4. 遇到问题时重新补现象、范围和约束
5. 交付前做一次聚焦检查

只要你能完整走完这五步，你就已经不是在“试试看 AI 能不能帮忙”，而是在真正使用 VibeCoding 工作流。
```

- [ ] **Step 8: 写 `## 小结`，用一段话总结全章意义**

```md
第四章的意义，不在于这个小工具本身有多惊艳，而在于它第一次把前面三章讲过的那些原则，压缩进了一次真实、紧凑、可复用的协作演示里。

到这里，你应该已经能看到：VibeCoding 的核心从来不是“让 AI 替你写代码”，而是“你如何带着 AI，把一件事从想法稳定推进到结果”。
```

- [ ] **Step 9: 通读结尾 120 行，确认 review、交付、实践、小结和到第五章的过渡完整**

Run: `sed -n '410,560p' vibecoding-tutorial/case-study/build-a-real-project.md`
Expected: 文章完成交付收束、读者练习与到第五章的自然过渡

## Task 7: 最终统一校对第四章的结构、链接和口径

**Files:**
- Modify: `vibecoding-tutorial/case-study/build-a-real-project.md`
- Reference: `vibecoding-tutorial-outline.md`
- Reference: `vibecoding-tutorial/SUMMARY.md`
- Reference: `docs/superpowers/specs/2026-04-02-fourth-chapter-case-study-design.md`

- [ ] **Step 1: 检查文章是否保留统一节奏“目标 → 内容 → 实践 → 小结”**

```md
检查点：
- 存在 `## 目标`
- 存在 `## 内容`
- 存在 `## 实践`
- 存在 `## 小结`
```

- [ ] **Step 2: 检查 7 个阶段小节是否齐全且顺序正确**

```md
应存在的小节：
- 这次不再讲原则，直接做一个完整项目
- 第一步：先把模糊想法收敛成可执行目标
- 第二步：让 AI 先做出可运行的第一版
- 第三步：第一版出来后，人类开始接管方向盘
- 第四步：当问题出现，进入 Debug 闭环
- 第五步：交付前做一次 AI Code Review
- 收尾：交付的不是一段代码，而是一套闭环
```

- [ ] **Step 3: 检查相对链接是否正确且只引用必要前文**

```md
必须出现的相对链接：
- `../practical-skills/how-to-spec-tasks.md`
- `../practical-skills/loop-and-debug.md`
- `../best-practices/context-limits.md`

建议保留的前文概念引用：
- `../core-concepts/commander-vs-coder.md`
- `../core-concepts/test-driven-vibe.md`
- `../practical-skills/code-review-for-ai.md`
```

- [ ] **Step 4: 检查案例边界，确认没有引入设计文档禁止扩展的内容**

```md
不得扩展：
- 登录与权限
- 数据库与持久化
- 多角色协作
- 复杂状态管理框架
- 生产级部署细节
```

- [ ] **Step 5: 检查语气是否统一为“亲切、实用、略带幽默”，且没有写成流水账**

```md
校对要求：
- 有过程感，但不碎
- 有方法感，但不说教
- 有轻松表达，但不油滑
```

- [ ] **Step 6: 最终通读全文，确认第四章完成“串联前三章、引出第五章”的章节职责**

Run: `sed -n '1,560p' vibecoding-tutorial/case-study/build-a-real-project.md`
Expected: 第四章既能独立成立，又明确承担从前三章方法到第五章最佳实践的桥接作用
