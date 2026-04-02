# 第五章《最佳实践》Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 完成 `vibecoding-tutorial/best-practices/` 下第五章的 7 篇正文，使读者掌握一套面向 Claude Code 场景的防翻车、可止损、可持续升级的 VibeCoding 最佳实践工作法。

**Architecture:** 本章按“防失控链条”组织为 7 篇独立文章：上下文边界 → 及时回退 → 原子化拆解 → 协作习惯 → Prompt 认知纠偏 → 成本与边界 → 进阶路线。每篇都严格采用“目标 → 内容 → 实践 → 小结”结构，使用 Claude Code 场景示例，并在结尾产出 checklist、判断表或操作规则。

**Tech Stack:** Markdown, GitBook, Claude Code, Superpowers, Hooks, MCP

**Execution Note:** 本计划不包含 git commit 步骤；只有在用户明确要求提交时再执行提交。

---

## File Structure

### Files to create
- `vibecoding-tutorial/best-practices/context-limits.md` — 讲清上下文退化信号、控量原则与收缩上下文的判断表
- `vibecoding-tutorial/best-practices/rewind-not-loop.md` — 讲清死循环信号、回退策略与“何时必须 rewind”规则
- `vibecoding-tutorial/best-practices/epic-to-story.md` — 讲清如何把大需求拆成 AI 可执行的小任务
- `vibecoding-tutorial/best-practices/dos-and-donts.md` — 沉淀高成功率协作动作与高频错误动作
- `vibecoding-tutorial/best-practices/prompt-less-is-more.md` — 纠正 Prompt 崇拜，把重点拉回任务设计
- `vibecoding-tutorial/best-practices/limitations-and-costs.md` — 讲清成本、限制与不适用场景
- `vibecoding-tutorial/best-practices/next-steps.md` — 给出从会用到工作流化的进阶路线图

### Files to reference
- `vibecoding-tutorial-outline.md` — 第五章权威提纲来源
- `vibecoding-tutorial/SUMMARY.md` — 第五章标题与路径基准
- `docs/superpowers/specs/2026-04-02-fifth-chapter-best-practices-design.md` — 已确认的第五章设计文档
- `vibecoding-tutorial/core-concepts/context-is-all.md` — `context-limits.md` 的前置概念链接目标
- `vibecoding-tutorial/practical-skills/how-to-spec-tasks.md` — `epic-to-story.md` 与 `prompt-less-is-more.md` 的回链目标
- `vibecoding-tutorial/core-concepts/skills-hooks-and-mcp.md` — `next-steps.md` 的前置能力链接目标

### Files not expected to change
- `vibecoding-tutorial/SUMMARY.md` — 当前第五章条目与目标文件已对齐，无需改动
- `vibecoding-tutorial/README.md` — 本轮只写正文，不回改首页

## Task 1: 写作第一篇《上下文的“黄金边界”与防退化指南》

**Files:**
- Create: `vibecoding-tutorial/best-practices/context-limits.md`
- Reference: `vibecoding-tutorial/core-concepts/context-is-all.md`
- Reference: `docs/superpowers/specs/2026-04-02-fifth-chapter-best-practices-design.md`

- [ ] **Step 1: 写出文章骨架，明确这是第五章的防失控开篇**

```md
# 上下文的“黄金边界”与防退化指南

## 目标

## 内容

### 为什么 AI 一开始很聪明，后来开始“犯傻”

### 上下文退化有哪些早期信号

### 错误做法：越乱越加料

### 正确做法：控量、聚焦、重开线程

## 实践

## 小结
```

- [ ] **Step 2: 写开场，用“越聊越乱”现象破题**

```md
很多人刚开始用 Claude Code 时，都会经历一个很迷惑的阶段：前几轮还挺聪明，越往后却越容易跑偏。

不是模型突然“变笨”了，而是你的上下文工作台已经开始拥挤、混乱、重点失焦。

第五章就从这里开始：先学会识别 AI 什么时候正在退化，再谈怎么继续高效协作。
```

- [ ] **Step 3: 写退化信号，给出 4 个可观察症状**

```md
常见的上下文退化信号包括：

- 开始重复前面已经说过的话
- 忽略你刚刚明确过的限制条件
- 修好一个地方，又顺手弄坏另一个地方
- 回答越来越完整，但真正命中的问题越来越少

只要出现其中两三个，你就该警觉：这轮对话可能已经接近“边聊边失真”的状态了。
```

- [ ] **Step 4: 写错误做法，强调“继续堆材料”为什么更糟**

```md
最常见的错误反应，是继续补更多说明、贴更多文件、一次性塞更多背景，试图“把 AI 喂醒”。

问题在于，工作台已经乱了，你再往上堆东西，通常只会让关键材料更难被抓住。

很多翻车，不是因为信息不够，而是因为关键和次要信息已经混在一起了。
```

- [ ] **Step 5: 写正确做法，给出黄金边界规则**

```md
更稳的做法通常是：

1. 只保留当前任务真正相关的文件和约束
2. 把目标、边界、验收标准重新说短说清
3. 必要时直接开新线程，从稳定状态重新开始
4. 在继续前，先让 AI 用一句话复述它当前理解的问题

“黄金边界”不是固定行数，而是：你还能不能一眼看清当前要解决的到底是什么。
```

- [ ] **Step 6: 写实践部分，给出“原线程硬聊 vs 主动收缩上下文”的对比案例**

```md
错误推进：

> 继续看我上面说的那些，再顺便把筛选和排序也一起改了。

正确推进：

> 先只处理 `src/pages/users.tsx` 的搜索输入问题。不要改分页，不要改排序。请先复述你理解的问题和验证方式，我确认后再继续。

差别不在于语气更专业，而在于你主动把任务重新缩回 AI 能稳住的范围内。
```

- [ ] **Step 7: 写小结，产出“是否该收缩上下文”的检查表**

```md
如果你发现 AI 已经开始重复、遗漏、乱改，就别再期待“多聊两轮它会自己想通”。

这时更有效的动作，往往不是继续催，而是收缩上下文、重建边界、必要时直接重开。

可以先用这张检查表判断是否该止损：

- 我们现在讨论的是不是只有一个明确目标？
- 当前对话里是否混进了太多无关尝试？
- AI 最近两轮是否已经忽略过我明确说过的限制？
- 我是否还能用一句话说清当前任务？

如果有两项以上答“否”，就该主动收缩上下文了。
```

- [ ] **Step 8: 通读文件，确认其回链 `../core-concepts/context-is-all.md` 并自然引向 `./rewind-not-loop.md`**

Run: `sed -n '1,280p' vibecoding-tutorial/best-practices/context-limits.md`
Expected: 文章完整说明退化信号、错误做法、黄金边界规则与到下一篇的过渡

## Task 2: 写作第二篇《“及时回退”法则：避免无效迭代》

**Files:**
- Create: `vibecoding-tutorial/best-practices/rewind-not-loop.md`
- Reference: `vibecoding-tutorial/best-practices/context-limits.md`
- Reference: `docs/superpowers/specs/2026-04-02-fifth-chapter-best-practices-design.md`

- [ ] **Step 1: 写出文章骨架，聚焦止损而不是原理复读**

```md
# “及时回退”法则：避免无效迭代

## 目标

## 内容

### 为什么继续催，通常不会让局面自动变好

### AI 死循环的典型信号

### 错误做法：在错误分支上越走越远

### 正确做法：回到稳定点重新定义问题

## 实践

## 小结
```

- [ ] **Step 2: 写开场，提出“3 次无效尝试就回退”总规则**

```md
很多人和 AI 协作翻车，不是输在第一次失败，而是输在失败后还想靠“再试一次”硬磕回来。

问题是，AI 一旦走进错误分支，后面的每一次尝试都可能只是把错误包得更像正确答案。

所以这里给一个很实用的默认规则：同类问题连续 3 次无效尝试，就别再硬聊，优先回退。
```

- [ ] **Step 3: 写死循环信号，给出 4 个常见症状**

```md
典型的死循环信号包括：

- 修复思路在变，结果却没有本质改善
- 解释越来越自信，但验证结果还是失败
- 每次都多带出一点新副作用
- 你们开始讨论“为什么还没好”，而不是“现在该回到哪里”

这些信号出现时，继续推进通常不是勇敢，而是浪费。
```

- [ ] **Step 4: 写错误做法，解释为什么“换个说法继续催”常常无效**

```md
最常见的错误动作，是把同一个问题换个语气、换个措辞、换个顺序再问一遍，期待 AI 能突然开窍。

但如果上下文、错误路径和任务边界都没变，结果通常也不会本质改变。

你以为自己在迭代，实际上只是在同一个坑边上绕圈。
```

- [ ] **Step 5: 写正确做法，给出 rewind 操作顺序**

```md
更稳的 rewind 顺序通常是：

1. 回到最后一个确认无误的状态
2. 用一句话重新定义当前唯一目标
3. 明确这次不能动哪些部分
4. 先确认验证方法，再开始下一轮修改

回退不是认输，而是把协作从错误分支拉回可控范围。
```

- [ ] **Step 6: 写实践部分，给出“硬磕修 bug”与“回退重来”的对比案例**

```md
硬磕方式：

> 你再试一次，把状态管理也一起整理下，应该就好了。

回退方式：

> 我们回到上一个搜索输入还没改坏分页的版本。这次只修输入后列表不刷新的问题，不做任何重构。先告诉我你准备怎么验证。

第二种看起来慢一点，实际却更容易真正结束问题。
```

- [ ] **Step 7: 写小结，产出“什么时候必须 rewind”的判断规则**

```md
把“及时回退”变成习惯后，你会少掉很多看似努力、实际无效的长对话。

可以把下面这条规则直接记住：

- 同类问题连续 3 次无效尝试
- 最近一次修改引入了额外副作用
- 你已经说不清现在到底在哪个错误分支上

满足任意两项，就优先 rewind，不要继续硬磕。
```

- [ ] **Step 8: 通读文件，确认其承接 `./context-limits.md` 并引向 `./epic-to-story.md`**

Run: `sed -n '1,280p' vibecoding-tutorial/best-practices/rewind-not-loop.md`
Expected: 文章完整说明死循环信号、rewind 规则与到拆解篇的过渡

## Task 3: 写作第三篇《巨型需求的“原子化”拆解法》

**Files:**
- Create: `vibecoding-tutorial/best-practices/epic-to-story.md`
- Reference: `vibecoding-tutorial/practical-skills/how-to-spec-tasks.md`
- Reference: `docs/superpowers/specs/2026-04-02-fifth-chapter-best-practices-design.md`

- [ ] **Step 1: 写出文章骨架，明确这是任务粒度控制篇**

```md
# 巨型需求的“原子化”拆解法

## 目标

## 内容

### 为什么一句话丢完整需求最容易失控

### Epic 和 Story 的差别到底在哪

### 怎么按模块、流程、风险点拆任务

### 什么样的任务才算“AI 可执行”

## 实践

## 小结
```

- [ ] **Step 2: 写开场，指出“大需求直接丢给 AI”的常见幻觉**

```md
很多人第一次觉得 AI 很强时，最容易产生一个危险错觉：既然它已经能写不少东西，那我干脆把完整需求一次性丢过去。

结果往往不是一步到位，而是它同时开始理解、设计、实现、猜边界、补细节，最后哪件事都做了一点，却没有哪件事真正做稳。

AI 最怕的，不一定是难，而是边界不清。
```

- [ ] **Step 3: 写 Epic 与 Story 的区别，给出一句话判断标准**

```md
一个很实用的区分方法是：

- **Epic**：还需要继续拆，不适合直接交付 AI 一口气完成
- **Story**：边界清楚、完成标准明确、可以独立验证

如果你没法快速说明“这一步做完后我怎么判断它完成了”，那它大概率还不是一个合格的 Story。
```

- [ ] **Step 4: 写拆解方法，给出 3 条主轴**

```md
把大需求拆小，最常用的三条主轴是：

1. **按模块拆**：页面、接口、存储、文档分别处理
2. **按流程拆**：输入、处理、输出、异常分别处理
3. **按风险拆**：低风险部分先做，高风险部分后做并加强验证

拆解的目标不是把任务切碎给人看，而是让每一步都更容易做对、验对、回退。
```

- [ ] **Step 5: 写“原子任务标准”，给出 4 个判断点**

```md
一个适合交给 AI 的原子任务，通常要满足：

- 目标只有一个
- 修改范围可控
- 验收方式明确
- 做错后容易回退

满足这四条，AI 的成功率通常会明显上升。
```

- [ ] **Step 6: 写实践部分，把一个教程或功能需求拆成可执行任务列表示例**

```md
比如“把用户列表页做成可搜索、可排序、可分页”这个需求，不要一次性交给 AI。

更稳的拆法是：

1. 先只加搜索输入框和本地过滤
2. 再确认搜索为空时的恢复行为
3. 然后补排序逻辑
4. 最后检查排序与分页是否互相影响

每一步都能独立验证，也都能独立回退。
```

- [ ] **Step 7: 写小结，产出“一个好任务的原子性检查表”**

```md
当你开始按原子任务和 AI 协作时，很多“它怎么又做歪了”的问题会自然减少。

可以用这张检查表快速自测：

- 这个任务是否只有一个主要目标？
- 这一步是否能独立验收？
- 如果失败，是否容易回退？
- AI 是否需要跨太多文件或太多概念才能完成它？

只要有两项答“不确定”，就继续拆。
```

- [ ] **Step 8: 通读文件，确认其回链 `../practical-skills/how-to-spec-tasks.md` 并引向 `./dos-and-donts.md`**

Run: `sed -n '1,280p' vibecoding-tutorial/best-practices/epic-to-story.md`
Expected: 文章完整说明 Epic/Story 区别、拆解主轴、原子任务标准与到协作习惯篇的过渡

## Task 4: 写作第四篇《高效协作原则》

**Files:**
- Create: `vibecoding-tutorial/best-practices/dos-and-donts.md`
- Reference: `vibecoding-tutorial/best-practices/rewind-not-loop.md`
- Reference: `vibecoding-tutorial/best-practices/epic-to-story.md`
- Reference: `docs/superpowers/specs/2026-04-02-fifth-chapter-best-practices-design.md`

- [ ] **Step 1: 写出文章骨架，采用 Do / Don't 对照结构**

```md
# 高效协作原则

## 目标

## 内容

### 为什么人与 AI 协作，常常败在“动作”而不是“能力”

### Do：让成功率上升的协作动作

### Don't：最容易把事情带歪的习惯

### 怎么把协作节奏掌握在自己手里

## 实践

## 小结
```

- [ ] **Step 2: 写开场，指出“会不会问”比“会不会写神 Prompt”更重要**

```md
很多人与 AI 协作不顺，不是因为模型不够强，而是因为协作动作本身就很容易把事情带歪。

比如目标没说清就开做、刚跑通一点就继续叠需求、明明已经跑偏还不打断——这些问题看上去不大，叠起来却很致命。

所以这一篇不讲神奇技巧，只讲那些真正会影响成功率的高频动作。
```

- [ ] **Step 3: 写 Do 列表，给出 5 条具体动作**

```md
Do 列表可以明确写成：

- 先给目标，再给范围，再给验收
- 一次只推进一个明确目标
- 当结果跑偏时及时打断
- 在关键节点让 AI 先复述理解
- 每完成一小步就确认是否满足预期

这些动作看起来普通，但它们几乎都是“少翻车”的基础动作。
```

- [ ] **Step 4: 写 Don't 列表，给出 5 条高频错误动作**

```md
Don't 列表可以明确写成：

- 不要一句话塞完整项目
- 不要连续追加新要求而不重新收束任务
- 不要看到命令跑通就默认结果正确
- 不要在已经失控的线程里继续扩大修改范围
- 不要把“AI 很积极”误当成“AI 很可靠”

很多坑不是高级错误，而是这些日常小动作反复累积出来的。
```

- [ ] **Step 5: 写“如何掌握节奏”，强调打断、确认与分段推进**

```md
高效协作不是让 AI 一路自己跑，而是你始终掌握节奏：

- 该快的时候快，比如低风险、小范围、好验证的任务
- 该停的时候停，比如开始重复、开始乱改、开始越权时
- 该确认的时候确认，比如进入下一步前先看当前这步是否真的完成

你不是被 AI 带着走，而是在调度它的速度和范围。
```

- [ ] **Step 6: 写实践部分，给出“低质量对话 vs 高质量对话”的并排案例**

```md
低质量对话：

> 帮我把这个页面都优化一下，顺便把交互也整理下。

高质量对话：

> 先只优化用户列表页的搜索体验。不要动 API，不要改样式系统。完成后告诉我改了哪些文件、怎么验证，以及有没有潜在副作用。

第二种并不更长多少，但边界、节奏和验收都更清楚。
```

- [ ] **Step 7: 写小结，产出“一页协作清单”**

```md
真正拉开协作效果差距的，往往不是模型版本，而是你有没有形成稳定动作。

这一页清单可以直接记住：

- 先目标，后执行
- 先边界，后改动
- 先小步，后扩展
- 先验证，后继续
- 一跑偏就打断，一失控就回退
```

- [ ] **Step 8: 通读文件，确认其承接 `./rewind-not-loop.md`、`./epic-to-story.md` 并引向 `./prompt-less-is-more.md`**

Run: `sed -n '1,280p' vibecoding-tutorial/best-practices/dos-and-donts.md`
Expected: 文章完整给出 Do / Don't 列表、协作节奏规则与到 Prompt 认知篇的过渡

## Task 5: 写作第五篇《为什么核心不是 Prompt，而是任务设计》

**Files:**
- Create: `vibecoding-tutorial/best-practices/prompt-less-is-more.md`
- Reference: `vibecoding-tutorial/practical-skills/how-to-spec-tasks.md`
- Reference: `docs/superpowers/specs/2026-04-02-fifth-chapter-best-practices-design.md`

- [ ] **Step 1: 写出文章骨架，明确这是认知纠偏篇**

```md
# 为什么核心不是 Prompt，而是任务设计

## 目标

## 内容

### Prompt 崇拜为什么这么容易出现

### 华丽措辞为什么救不了模糊任务

### 真正决定结果质量的四件事

### 把注意力从 wording 拉回任务定义

## 实践

## 小结
```

- [ ] **Step 2: 写开场，先点破“神 Prompt 幻觉”**

```md
一提到 AI，很多人第一反应就是去找 Prompt 模板、收藏提示词大全、研究有没有一段能“百试百灵”的咒语。

这种冲动可以理解，但它很容易把注意力带偏。

因为在多数真实协作里，决定结果质量的往往不是你措辞够不够华丽，而是任务本身有没有定义清楚。
```

- [ ] **Step 3: 写“华丽措辞救不了模糊任务”，给出反例**

```md
如果任务本身是模糊的，哪怕你把 prompt 写得再像咒语，AI 还是只能边猜边做。

比如“请以专家级工程思维、最佳实践和优雅架构方式优化这个页面”，听起来很高级，但它并没有说明：

- 到底要优化什么
- 哪些地方不能动
- 什么结果算完成

措辞可以润色表达，不能替代任务定义。
```

- [ ] **Step 4: 写“四件真正关键的事”，明确判断框架**

```md
在真实工作里，更决定结果质量的通常是这四件事：

1. 输入是否具体
2. 输出是否明确
3. 约束是否清楚
4. 验收标准是否可验证

这四件事说清楚了，prompt 不需要很花，也常常能得到比“华丽咒语”更稳定的结果。
```

- [ ] **Step 5: 写“把注意力拉回任务定义”，强调任务设计优先级**

```md
真正该花力气打磨的，通常不是 prompt 的文学性，而是任务设计的结构性。

你要先想清楚：

- 我要它做什么
- 不要它做什么
- 做完后我怎么验
- 如果它做错了，我怎么及时发现

这些问题想清楚后，很多 prompt 自然会变短，结果反而更稳。
```

- [ ] **Step 6: 写实践部分，对比“华丽 Prompt”与“清晰任务说明”**

```md
华丽 Prompt：

> 请以资深架构师视角，遵循行业最佳实践，优雅地优化用户列表交互体验。

清晰任务说明：

> 请只优化用户列表页的搜索交互：输入后实时过滤当前页数据；清空输入时恢复全部列表；不要改后端接口，不要改分页逻辑。完成后告诉我修改文件和验证方式。

第二种通常没有第一种“像高手”，但更容易真的做对。
```

- [ ] **Step 7: 写小结，产出“任务定义优先于措辞”的提醒清单**

```md
与其花很多时间研究一句话怎么写得更玄，不如先把任务结构搭稳。

可以把下面这条提醒清单直接记住：

- 先定义任务，再润色表达
- 先写约束，再谈风格
- 先写验收，再让 AI 开始做
- prompt 可以优化，但不能代替思考
```

- [ ] **Step 8: 通读文件，确认其回链 `../practical-skills/how-to-spec-tasks.md` 并引向 `./limitations-and-costs.md`**

Run: `sed -n '1,280p' vibecoding-tutorial/best-practices/prompt-less-is-more.md`
Expected: 文章完整完成 Prompt 认知纠偏，并自然过渡到成本与边界篇

## Task 6: 写作第六篇《成本、限制与不适用场景》

**Files:**
- Create: `vibecoding-tutorial/best-practices/limitations-and-costs.md`
- Reference: `vibecoding-tutorial/best-practices/context-limits.md`
- Reference: `docs/superpowers/specs/2026-04-02-fifth-chapter-best-practices-design.md`

- [ ] **Step 1: 写出文章骨架，确保基调是现实而非唱衰**

```md
# 成本、限制与不适用场景

## 目标

## 内容

### 为什么强大不等于零成本

### 你真正要付出的几类成本

### AI 协作的天然限制在哪里

### 哪些场景不该贸然交给 AI 先做

## 实践

## 小结
```

- [ ] **Step 2: 写开场，先确立“诚实面对边界”基调**

```md
VibeCoding 很强，这件事是真的；但如果因此以为它零成本、零风险、全场景通吃，那就很容易在现实里翻车。

成熟的使用者，不是更乐观，而是更知道边界在哪里。

这一篇不是泼冷水，而是帮你少交学费。
```

- [ ] **Step 3: 写成本部分，给出 4 类现实成本**

```md
在真实工作里，你为 AI 协作付出的成本通常不只是一笔 token 账单，还包括：

- **等待成本**：生成、修改、验证都要时间
- **返工成本**：做歪了以后要重来
- **审查成本**：结果看起来像对，不代表真的对
- **沟通成本**：任务越模糊，来回越多

很多人只算 API 价格，却漏掉了这些更隐形的成本。
```

- [ ] **Step 4: 写限制部分，明确 4 个天然边界**

```md
AI 协作最常见的天然限制包括：

- 上下文永远有限，不可能无限记住所有背景
- 对外部系统的理解依赖你提供的信息和工具接入
- 幻觉不会因为“说得很像真的”就自动消失
- 验证责任始终不会从你身上转移出去

它能帮你提速，但不能替你承担最终判断。
```

- [ ] **Step 5: 写“不适合场景”，给出明确负面清单**

```md
下面这些场景，就不适合一上来就“先让 AI 干了再说”：

- 高风险生产变更
- 涉及权限、支付、删除等高后果操作
- 需求本身还没定义清楚
- 完全没有测试、日志或其他验证手段

不是 AI 完全不能参与，而是你不能用低风险任务的心态去放权。
```

- [ ] **Step 6: 写实践部分，给出“适合交给 AI”与“不适合先交给 AI”的对比案例**

```md
适合先交给 AI：

> 补一篇教程文档、整理局部重复代码、生成测试草稿。

不适合先交给 AI：

> 直接修改线上支付逻辑、批量删除关键数据、在没有验证机制的前提下大范围重构。

关键区别不在任务听起来酷不酷，而在后果、可逆性和可验证性。
```

- [ ] **Step 7: 写小结，产出“这件事该不该先交给 AI”的判断表**

```md
真正成熟的协作方式，不是“凡事都用 AI”，而是知道什么时候该用、怎么用、用到什么程度。

可以先用这张判断表自测：

- 这件事做错后容易回退吗？
- 结果能快速验证吗？
- 影响范围小吗？
- 当前需求已经定义清楚了吗？

如果有两项以上答“否”，就不要直接放手让 AI 先跑到底。
```

- [ ] **Step 8: 通读文件，确认其与前文风险讨论一致，并引向 `./next-steps.md`**

Run: `sed -n '1,280p' vibecoding-tutorial/best-practices/limitations-and-costs.md`
Expected: 文章完整说明成本、限制、不适用场景，并自然过渡到进阶篇

## Task 7: 写作第七篇《进阶：构建自动化 AI 开发工作流》

**Files:**
- Create: `vibecoding-tutorial/best-practices/next-steps.md`
- Reference: `vibecoding-tutorial/core-concepts/skills-hooks-and-mcp.md`
- Reference: `docs/superpowers/specs/2026-04-02-fifth-chapter-best-practices-design.md`

- [ ] **Step 1: 写出文章骨架，定位为全章收束与进阶出口**

```md
# 进阶：构建自动化 AI 开发工作流

## 目标

## 内容

### 为什么真正的提升来自工作流，而不是更勤奋地聊天

### 从“会用”到“可复用”要跨过哪几步

### Skills、Hooks、MCP、测试怎么逐步接起来

### 不要一口气搭整套系统

## 实践

## 小结
```

- [ ] **Step 2: 写开场，明确“进阶不是更卷聊天”**

```md
学完前面这些内容后，很多人会进入下一个阶段：Claude Code 已经能帮上很多忙，但协作质量还是有点看状态。

这时候真正该升级的，往往不是你聊得更勤，而是把经验慢慢沉淀成流程。

入门之后，决定上限的通常不是“会不会用”，而是“能不能稳定复用”。
```

- [ ] **Step 3: 写进阶路径，给出从基础到工作流化的 4 步路线**

```md
一个比较稳的进阶路线通常是：

1. 先把任务定义和验收标准写清楚
2. 再把高频流程固化成可复用套路
3. 然后给关键节点加自动检查
4. 最后再把外部工具和多代理协作接进来

顺序很重要。别一上来就想搭“全自动 AI 团队”，那通常只会把复杂度提前引进来。
```

- [ ] **Step 4: 写能力拼图，说明 Skills、Hooks、MCP、测试各自位置**

```md
可以把这几块能力理解成一张逐步拼起来的图：

- **测试**：保证你知道什么叫做“做对”
- **Skills**：把高频合作套路固化下来
- **Hooks**：把关键纪律变成自动触发
- **MCP**：把外部工具、知识和系统接进来

它们不是并列装饰，而是一层层把协作从临场发挥升级成工作流。
```

- [ ] **Step 5: 写“不要一口气搭整套系统”，强调小步升级原则**

```md
最容易失败的进阶方式，就是一次性装太多、接太多、改太多，然后协作复杂度一下暴涨。

更稳的做法是每次只升级一小块：

- 先把一个常用流程写成 Skill
- 再给一个关键节点加 Hook
- 再接一个最常用的 MCP 工具

让系统跟着需求长，而不是为了“看起来高级”提前堆满配置。
```

- [ ] **Step 6: 写实践部分，给出“个人 AI 工作流升级路线图”示例**

```md
一个现实可行的升级路线可以是：

- 第 1 阶段：先把任务说明和验收标准写规范
- 第 2 阶段：把常用写作或改代码流程沉淀成 Skill
- 第 3 阶段：给测试、检查、提醒加 Hooks
- 第 4 阶段：接入文档检索、搜索、记忆等 MCP
- 第 5 阶段：再考虑让多个 agent 分工协作

这样升级，复杂度和收益会更匹配。
```

- [ ] **Step 7: 写小结，作为第五章和全书的收束**

```md
到这里，这本教程真正想帮你完成的转变就闭环了：

你不再只是“会和 AI 聊几句”，而是开始具备把 AI 协作稳定纳入工作流的能力。

下一步不需要追求更神秘的 prompt，也不需要一次搭完所有自动化。先从一个最常用、最容易验证的小流程开始，把它固化下来，你的 AI 工作流就已经正式启动了。
```

- [ ] **Step 8: 通读文件，确认其回链 `../core-concepts/skills-hooks-and-mcp.md` 并完成全章收束**

Run: `sed -n '1,280p' vibecoding-tutorial/best-practices/next-steps.md`
Expected: 文章完整给出进阶路线、能力拼图、小步升级原则，并成为第五章收束

## Task 8: 统一校对第五章的衔接、链接与语气

**Files:**
- Modify: `vibecoding-tutorial/best-practices/context-limits.md`
- Modify: `vibecoding-tutorial/best-practices/rewind-not-loop.md`
- Modify: `vibecoding-tutorial/best-practices/epic-to-story.md`
- Modify: `vibecoding-tutorial/best-practices/dos-and-donts.md`
- Modify: `vibecoding-tutorial/best-practices/prompt-less-is-more.md`
- Modify: `vibecoding-tutorial/best-practices/limitations-and-costs.md`
- Modify: `vibecoding-tutorial/best-practices/next-steps.md`
- Reference: `vibecoding-tutorial/SUMMARY.md`

- [ ] **Step 1: 检查 7 篇是否都保留统一节奏“目标 → 内容 → 实践 → 小结”**

```md
检查点：
- 每篇都有 `## 目标`
- 每篇都有 `## 内容`
- 每篇都有 `## 实践`
- 每篇都有 `## 小结`
```

- [ ] **Step 2: 补齐必要相对链接，形成第五章内部递进链条**

```md
需要出现的相对链接：
- `context-limits.md` → `../core-concepts/context-is-all.md`、`./rewind-not-loop.md`
- `rewind-not-loop.md` → `./context-limits.md`、`./epic-to-story.md`
- `epic-to-story.md` → `../practical-skills/how-to-spec-tasks.md`、`./dos-and-donts.md`
- `dos-and-donts.md` → `./rewind-not-loop.md`、`./epic-to-story.md`、`./prompt-less-is-more.md`
- `prompt-less-is-more.md` → `../practical-skills/how-to-spec-tasks.md`、`./limitations-and-costs.md`
- `limitations-and-costs.md` → `./next-steps.md`
- `next-steps.md` → `../core-concepts/skills-hooks-and-mcp.md`
```

- [ ] **Step 3: 统一案例主线，让 7 篇都围绕 Claude Code 常见任务场景**

```md
连续案例基线：
- 场景：给现有项目补小功能、改文档、修交互或拆任务
- 允许各篇切不同切面，但不要突然换成完全无关的领域案例
```

- [ ] **Step 4: 统一第五章气质，确保都像“踩坑避雷指南”而不是纯理论总结**

```md
统一要求：
- 每篇开头尽快抛出翻车风险
- 每篇都写错误做法 vs 正确做法
- 每篇结尾都产出 checklist、判断表或操作规则
```

- [ ] **Step 5: 逐篇快速通读，确认语气统一为“亲切、实用、略带幽默”**

Run: `for f in vibecoding-tutorial/best-practices/*.md; do echo "===== $f ====="; sed -n '1,320p' "$f"; done`
Expected: 七篇结构统一、递进自然、案例一致、链接正确、语气统一

## Task 9: 最终验证第五章与目录、提纲和设计的一致性

**Files:**
- Reference: `vibecoding-tutorial/SUMMARY.md`
- Reference: `vibecoding-tutorial-outline.md`
- Reference: `docs/superpowers/specs/2026-04-02-fifth-chapter-best-practices-design.md`
- Reference: `vibecoding-tutorial/best-practices/context-limits.md`
- Reference: `vibecoding-tutorial/best-practices/rewind-not-loop.md`
- Reference: `vibecoding-tutorial/best-practices/epic-to-story.md`
- Reference: `vibecoding-tutorial/best-practices/dos-and-donts.md`
- Reference: `vibecoding-tutorial/best-practices/prompt-less-is-more.md`
- Reference: `vibecoding-tutorial/best-practices/limitations-and-costs.md`
- Reference: `vibecoding-tutorial/best-practices/next-steps.md`

- [ ] **Step 1: 确认 7 个文件名与 `SUMMARY.md` 条目完全一致**

```md
应一致的文件：
- best-practices/context-limits.md
- best-practices/rewind-not-loop.md
- best-practices/epic-to-story.md
- best-practices/dos-and-donts.md
- best-practices/prompt-less-is-more.md
- best-practices/limitations-and-costs.md
- best-practices/next-steps.md
```

- [ ] **Step 2: 对照提纲，确认 7 篇主题没有跑偏**

```md
提纲核对点：
- `context-limits.md`：黄金边界、上下文退化、防变傻
- `rewind-not-loop.md`：及时回退、避免无效迭代
- `epic-to-story.md`：巨型需求拆分、原子化任务
- `dos-and-donts.md`：高效协作原则
- `prompt-less-is-more.md`：Prompt 不是核心，任务设计才是核心
- `limitations-and-costs.md`：成本、限制、不适用场景
- `next-steps.md`：构建自动化 AI 开发工作流
```

- [ ] **Step 3: 对照设计文档，确认这些要求已全部落地**

```md
设计核对点：
- 写法：操作手册型
- 篇幅：每篇约 1000-1500 字
- 场景：Claude Code 教程场景为主
- 气质：踩坑避雷指南
- 结构：目标 → 内容 → 实践 → 小结
- 收束：第五章整体像一套连续工作法，而不是 7 篇孤立文章
```

- [ ] **Step 4: 最终人工通读第五章 7 篇内容**

Run: `for f in vibecoding-tutorial/best-practices/*.md; do echo "===== $f ====="; sed -n '1,320p' "$f"; done`
Expected: 第五章七篇既可单独阅读，也能按顺序组成完整的“防翻车 + 可升级”工作法
