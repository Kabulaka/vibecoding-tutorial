# Web Notes Demo Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 将第四章案例改写为《使用 Claude Code 构建一个带 AI 总结功能的 Web 笔记工具》的现场演示方案，并让正文以更直观、更有互动感的方式串联第二章核心范式与第五章最佳实践。

**Architecture:** 本轮实施只改一篇正文：`vibecoding-tutorial/case-study/build-a-real-project.md`。文章继续保持 GitBook 的“目标 → 内容 → 实践 → 小结”结构，但主案例从旧的 Prompt / Task 工作台切换为 Web 笔记工具，内容按“开场定标 → 初始化 → 基础页面流程 → summarize → 纠偏 → 收束”推进，并在各等待点插入第二章与第五章的对应概念、轻度幽默话术和互动问题。

**Tech Stack:** Markdown, GitBook, Claude Code, Node.js, TypeScript, Sqlite, Web demo script design

---

## File Structure

### Files to modify
- `vibecoding-tutorial/case-study/build-a-real-project.md` — 将第四章正文改写为 Web 笔记工具现场演示案例

### Files to reference
- `docs/superpowers/specs/2026-04-08-claude-code-cli-notes-demo-design.md` — 已确认的二合一设计稿
- `vibecoding-tutorial-outline.md` — 第四章定位、第二章与第五章的章节命名基准
- `vibecoding-tutorial/SUMMARY.md` — 第四章标题与路径基准
- `vibecoding-tutorial/core-concepts/commander-vs-coder.md` — 开场定标引用目标
- `vibecoding-tutorial/core-concepts/context-is-all.md` — 初始化阶段等待期引用目标
- `vibecoding-tutorial/core-concepts/ai-trust-model.md` — 基础页面流程阶段等待期引用目标
- `vibecoding-tutorial/core-concepts/skills-hooks-and-mcp.md` — summarize 阶段等待期引用目标
- `vibecoding-tutorial/best-practices/prompt-less-is-more.md` — 基础页面流程阶段最佳实践引用目标
- `vibecoding-tutorial/best-practices/limitations-and-costs.md` — summarize 阶段最佳实践引用目标
- `vibecoding-tutorial/best-practices/rewind-not-loop.md` — 纠偏阶段最佳实践引用目标
- `vibecoding-tutorial/best-practices/dos-and-donts.md` — 纠偏阶段最佳实践引用目标

### Files not expected to change
- `vibecoding-tutorial/SUMMARY.md` — 当前第四章链接已存在，无需改动
- `vibecoding-tutorial-outline.md` — 仅作为内容边界参考，不在本轮修改

## Task 1: 重写第四章骨架与案例定位

**Files:**
- Modify: `vibecoding-tutorial/case-study/build-a-real-project.md`
- Reference: `docs/superpowers/specs/2026-04-08-claude-code-cli-notes-demo-design.md`
- Reference: `vibecoding-tutorial/SUMMARY.md`

- [ ] **Step 1: 写出新标题与固定结构，保持教程统一节奏**

```md
# 使用 Claude Code 构建一个带 AI 总结功能的 Web 笔记工具

## 目标

## 内容

### 这次不讲抽象原则，直接跑一遍现场演示

### 第一步：先定目标，不急着写代码

### 第二步：让 Claude Code 先把基础 CRUD 跑起来

### 第三步：给项目接上 AI summarize

### 第四步：报错不可怕，关键是怎么纠偏

### 收尾：项目只是载体，操作流才是重点

## 实践

## 小结
```

- [ ] **Step 2: 重写 `## 目标`，明确第四章的教学目标是“看懂操作流”**

```md
读完这一篇，你应该能看懂一次完整的 Claude Code 现场演示是怎么组织的：从给意图、看执行、做验证，到在跑偏时及时纠偏。

这一章的重点不是教你手写一个 Web 工具，而是让你第一次真正看到：Claude Code 不只是补全工具，而是一个可以被你指挥、被你观察、也需要被你监管的开发代理。
```

- [ ] **Step 3: 重写开场段，交代案例产物与边界**

```md
这次案例我们选一个足够小、又足够真实的题目：做一个带 AI 总结功能的 Web 笔记工具。

它保留四个核心动作：新增笔记、列表展示、详情查看、AI summarize。前面三个负责把主流程跑通，最后一个负责把真实 LLM API 接进来，让这个项目从“普通 Web 小工具”升级为“AI 协作产品”。

这个题目不复杂，但现场感很强：它会建项目、装依赖、起服务、点页面、跑验证，也会遇到等待、报错和纠偏，刚好适合拿来讲一遍完整操作流。
```

- [ ] **Step 4: 在开场末尾加一句，固定“等待期穿插法”作为叙事主线**

```md
所以这一章不会把理论和实战硬拆开，而是采用“等待期穿插法”：Claude Code 一干活，我们就趁它工作的时候，讲清第二章和第五章里那些真正决定成败的判断方法。
```

- [ ] **Step 5: 运行结构检查，确认新骨架已经替换旧案例主线**

Run: `python - <<'PY'
from pathlib import Path
p = Path('vibecoding-tutorial/case-study/build-a-real-project.md')
text = p.read_text()
for required in [
    '# 使用 Claude Code 构建一个带 AI 总结功能的 Web 笔记工具',
    '## 目标', '## 内容', '## 实践', '## 小结',
    '等待期穿插法'
]:
    assert required in text, required
print('structure ok')
PY`
Expected: `structure ok`

## Task 2: 写初始化与基础页面流程阶段

**Files:**
- Modify: `vibecoding-tutorial/case-study/build-a-real-project.md`
- Reference: `vibecoding-tutorial/core-concepts/commander-vs-coder.md`
- Reference: `vibecoding-tutorial/core-concepts/context-is-all.md`
- Reference: `vibecoding-tutorial/core-concepts/ai-trust-model.md`
- Reference: `vibecoding-tutorial/best-practices/prompt-less-is-more.md`

- [ ] **Step 1: 写“先定目标，不急着写代码”，突出 commander 视角**

```md
这场演示一开始，我不会先画页面，也不会先去纠结按钮放左边还是右边。

更稳的起手式，是先把项目目标、技术栈、边界和验收标准讲清楚。因为在 Claude Code 场景里，你最先交出去的不是代码，而是方向。

这也是第二章《[角色转变：从“开发者”到“总指挥”](../core-concepts/commander-vs-coder.md)》一直在强调的那件事：你不再是逐行实现的人，而是负责定义任务的人。
```

- [ ] **Step 2: 插入初始化 shell 与首轮提示词，做成可直接照着演的案例片段**

```md
现场通常会这样开场：

```bash
mkdir vibe-notes-web
cd vibe-notes-web
claude
```

然后第一轮提示词不要碎碎念，而要像一张任务单：

```text
帮我从 0 开始创建一个 Node.js + TypeScript + Sqlite 的 Web 笔记工具项目，项目名叫 vibe-notes-web。

需求：
1. 支持新增笔记、列表页、详情页
2. 笔记存储在本地 Sqlite 中
3. 页面交互尽量简单直接
4. 先不要做 summarize
5. 请优先保证主流程可运行，不要过度设计

请你：
- 先规划最小可用实现
- 搭好项目结构
- 实现页面与数据存储
- 安装所需依赖
- 告诉我如何运行验证
```

你也可以顺手抛给观众一个轻问题：“如果是你来起手，你会先让 AI 写页面，还是先把数据存储钉住？” 这种问题不难，但很容易把观众从“看热闹”拉进“跟着判断”。
```

- [ ] **Step 3: 写等待期解释，回扣 context-is-all**

```md
注意这里的重点，不是 prompt 写得多像魔法咒语，而是上下文给得够准：

- 技术栈定成 Node.js + TypeScript + Sqlite
- 功能边界先锁在新增 / 列表 / 详情
- 存储方式明确为本地 Sqlite
- 优先级明确成“先跑通，再谈漂亮”

这就是第二章《[上下文管理：如何喂饱 AI 的记忆](../core-concepts/context-is-all.md)》要讲的核心：上下文不是越多越好，而是越准越好。
```

- [ ] **Step 4: 写基础页面流程跑通阶段，并嵌入 trust model 与 prompt-less-is-more**

```md
接下来就进入最容易让人上头的阶段了：Claude Code 开始建项目、装依赖、搭页面、接 Sqlite，然后告诉你怎么验证。

你通常会顺着它给的步骤跑一遍：

```bash
npm install
npm run dev
```

然后在浏览器里依次验证：打开首页、新增一条笔记、在列表里看到它、再点进详情页。页面好看当然加分，但先别让自己被 CSS 哄骗了，数据真落地才算数。

这时候最该讲的，不是“它真厉害”，而是第二章《[什么时候该信 AI，什么时候必须验证](../core-concepts/ai-trust-model.md)》里的分层信任：脚手架、页面骨架、路由、基础 CRUD、Sqlite 读写可以先交给 AI，但依赖是否合理、页面是否真能点通、数据是否真实落库，必须亲自验。

顺手也能把第五章《[为什么核心不是 Prompt，而是任务设计](../best-practices/prompt-less-is-more.md)》串进来：真正重要的不是 prompt 花活，而是你有没有说清楚“做什么、不做什么、怎样算完成”。
```

- [ ] **Step 5: 运行内容检查，确认初始化与基础页面流程同时出现 Web 栈、提示词和两类理论链接**

Run: `python - <<'PY'
from pathlib import Path
text = Path('vibecoding-tutorial/case-study/build-a-real-project.md').read_text()
checks = [
    'mkdir vibe-notes-web',
    'Node.js + TypeScript + Sqlite 的 Web 笔记工具项目',
    '../core-concepts/context-is-all.md',
    '../core-concepts/ai-trust-model.md',
    '../best-practices/prompt-less-is-more.md'
]
for item in checks:
    assert item in text, item
print('page flow section ok')
PY`
Expected: `page flow section ok`

## Task 3: 写 summarize、等待期穿插与纠偏阶段

**Files:**
- Modify: `vibecoding-tutorial/case-study/build-a-real-project.md`
- Reference: `vibecoding-tutorial/core-concepts/skills-hooks-and-mcp.md`
- Reference: `vibecoding-tutorial/best-practices/limitations-and-costs.md`
- Reference: `vibecoding-tutorial/best-practices/rewind-not-loop.md`
- Reference: `vibecoding-tutorial/best-practices/dos-and-donts.md`

- [ ] **Step 1: 写 summarize 阶段，明确这是“普通 Web 工具”到“AI 产品”的升级点**

```md
基础页面流程跑通后，这个项目还只是个普通 Web 小工具。真正让它有“AI 味儿”的，是下一步：给详情页加上 `Summarize`。

这里我会继续要求 Claude Code 在现有项目上最小改动，不要回头重构已经能跑的新增、列表、详情流程，而是直接把真实 LLM API 接上来。
```

- [ ] **Step 2: 插入第二轮提示词与验证方式，保持现场可演性**

```md
第二轮提示词通常这样给：

```text
现在在现有 Web 笔记工具基础上增加 summarize 功能。

目标：
- 用户可以在笔记详情页触发 summarize
- summarize 调用真实的 LLM API 生成摘要
- 尽量复用现有页面风格
- 如果笔记太短，可以直接提示无需总结
- 不要重构已经能工作的新增/列表/详情流程

请你先基于当前代码结构设计最小改动方案，然后直接实现，并告诉我需要什么环境变量以及如何运行。
```

如果需要补约束，再加一句：

```text
补充约束：
- 环境变量方式读取 API key
- 摘要输出控制在卡片或详情区域，2 到 4 行即可
- 先以页面可跑通为目标，不要额外加复杂配置系统
```

然后按它给的方式验证，例如：

```bash
export OPENAI_API_KEY=your_key_here
npm run dev
```

再在浏览器里打开某条笔记详情页，点击 `Summarize`，观察摘要是否显示，顺便看看短笔记会不会老老实实提示“无需总结”。
```

- [ ] **Step 3: 写等待期穿插，回扣 skills-hooks-and-mcp 与 limitations-and-costs**

```md
Claude Code 一开始接 API、补配置、试请求，你就正好可以把第二章《[AI 能力扩展三件套](../core-concepts/skills-hooks-and-mcp.md)》带进来：今天我们只是接一个 LLM API，但往前再走一步，就是 Skills、Hooks、MCP 这些更完整的能力扩展。

同时也别忘了把第五章《[成本、限制与不适用场景](../best-practices/limitations-and-costs.md)》讲明白：真实 API 带来的不只是“更像真的”，也包括延迟、成本、配置风险和网络依赖。AI 很强，但它不是魔法。
```

- [ ] **Step 4: 写报错与纠偏阶段，给出高信息量反馈模板和互动点**

```md
如果这一步报错，反而是好素材。重点不是装作一切顺利，而是现场示范怎么高质量纠偏。

错误反馈不要写成“还是不对，你再改改”，而要写成这样：

```text
`summarize` 功能运行失败了。下面是实际报错：

[把终端报错原样贴进去]

请先定位问题原因，并只做与这个问题直接相关的修改。
约束：
- 不要重构整个项目
- 不要改动新增/列表/详情页的行为
- 修复后请重新运行 summarize 验证
```

如果能跑但结果太啰嗦，也可以继续缩小范围：

```text
现在 summarize 能运行，但摘要效果太啰嗦。

请调整摘要提示，使输出更像 Web 工具结果：
- 简洁
- 2 到 4 行
- 保留关键信息
- 不要加寒暄语

只修改 summarize 相关逻辑，不要动其他功能。
```

这一段也很适合直接请观众做判断：“如果它连续三轮都在同一个坑里绕，你会继续让它试，还是先回退一步？” 也可以补一句轻松点的话术：AI 卡住的时候最怕两件事，一个是它嘴硬，一个是你心软。
```

- [ ] **Step 5: 写方法解释，回扣 rewind-not-loop 与 dos-and-donts**

```md
这一步最适合把第五章的两条硬规则讲透。

第一条是《[“及时回退”法则：避免无效迭代](../best-practices/rewind-not-loop.md)》：如果 AI 连续几轮都在同一个坑里打转，就不要陪它一起硬磕；该收缩问题就收缩问题，该回退到上一个稳定点就回退。

第二条是《[高效协作原则](../best-practices/dos-and-donts.md)》：最有效的反馈不是催，而是高信息量。给现象、给期望、给边界、给范围，AI 才更容易朝对的方向修。
```

- [ ] **Step 6: 运行检查，确认 summarize、限制、纠偏和两篇最佳实践链接都在**

Run: `python - <<'PY'
from pathlib import Path
text = Path('vibecoding-tutorial/case-study/build-a-real-project.md').read_text()
checks = [
    'Summarize',
    'OPENAI_API_KEY',
    '../core-concepts/skills-hooks-and-mcp.md',
    '../best-practices/limitations-and-costs.md',
    '../best-practices/rewind-not-loop.md',
    '../best-practices/dos-and-donts.md'
]
for item in checks:
    assert item in text, item
print('summarize section ok')
PY`
Expected: `summarize section ok`

## Task 4: 写实践、小结与全文校对

**Files:**
- Modify: `vibecoding-tutorial/case-study/build-a-real-project.md`
- Reference: `vibecoding-tutorial-outline.md`
- Reference: `docs/superpowers/specs/2026-04-08-claude-code-cli-notes-demo-design.md`

- [ ] **Step 1: 写收尾段，把价值落回“操作流”而不是“工具功能”**

```md
到收尾时，你最好不要只展示“页面跑通了”，而是把视角拉回整场演示真正的主题：项目只是载体，操作流才是重点。

真正值得观众带走的，不是 `Summarize` 这个按钮本身，而是这条节奏：先给意图，再看执行；先让 AI 推进，再用验证和反馈把方向盘握稳。等待时间也不是空档，而是讲清思维模型和最佳实践的黄金窗口。
```

- [ ] **Step 2: 写 `## 实践`，给读者一份可复用的现场演示练习清单**

```md
你可以立刻用同样的方法，给自己设计一场 15 到 30 分钟的小型 Claude Code 演示：

1. 选一个有即时反馈的小 Web 题目
2. 先只定义目标、边界和验收标准
3. 把等待点提前标出来，决定每一段穿插讲什么
4. 为“跑通”和“报错”各准备 1 组反馈模板
5. 最后总结时，不只讲结果，也讲你的判断过程

只要你能把这五步跑顺，你做的就不只是一个 demo，而是一场真正有教学价值的 VibeCoding 演示。
```

- [ ] **Step 3: 写 `## 小结`，用一段话收束第四章与前后章节关系**

```md
第四章的意义，不在于这个 Web 笔记工具本身有多复杂，而在于它把第二章的“怎么想”和第五章的“怎么稳”压缩进了一次真实、紧凑、可复用的现场演示里。

到这里，你应该已经能看出来：VibeCoding 的核心从来不是让 AI 替你工作，而是你如何带着 AI 把一件事稳稳推进到结果。
```

- [ ] **Step 4: 运行章节一致性检查，确认标题、固定结构和关键链接都正确**

Run: `python - <<'PY'
from pathlib import Path
text = Path('vibecoding-tutorial/case-study/build-a-real-project.md').read_text()
required = [
    '# 使用 Claude Code 构建一个带 AI 总结功能的 Web 笔记工具',
    '## 目标', '## 内容', '## 实践', '## 小结',
    '../core-concepts/commander-vs-coder.md',
    '../core-concepts/context-is-all.md',
    '../core-concepts/ai-trust-model.md',
    '../core-concepts/skills-hooks-and-mcp.md',
    '../best-practices/prompt-less-is-more.md',
    '../best-practices/limitations-and-costs.md',
    '../best-practices/rewind-not-loop.md',
    '../best-practices/dos-and-donts.md'
]
for item in required:
    assert item in text, item
print('chapter consistency ok')
PY`
Expected: `chapter consistency ok`

- [ ] **Step 5: 全文通读，确认旧案例主线已完全移除**

Run: `python - <<'PY'
from pathlib import Path
text = Path('vibecoding-tutorial/case-study/build-a-real-project.md').read_text()
for forbidden in ['Prompt / Task 工作台', '本地 Web', '单页 Web 应用']:
    assert forbidden not in text, forbidden
print('old case removed')
PY`
Expected: `old case removed`
