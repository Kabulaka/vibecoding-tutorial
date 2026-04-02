# 第二章《核心范式》Implementation Plan

> **For agentic workers:** REQUIRED SUB-SKILL: Use superpowers:subagent-driven-development (recommended) or superpowers:executing-plans to implement this plan task-by-task. Steps use checkbox (`- [ ]`) syntax for tracking.

**Goal:** 完成 `vibecoding-tutorial/core-concepts/` 下第二章的 5 篇正文，使读者完成从“写代码的人”到“指挥 AI 写代码的人”的认知升级。

**Architecture:** 本章严格按提纲落地为 5 篇独立文章，并用“总指挥主线”串联：角色转变 → 上下文供给 → 放权边界 → 测试护栏 → 系统化增强。先逐篇写清目标、内容、实践、小结，再统一校对章节衔接、相对链接、术语口径和与 `SUMMARY.md` 的一致性。

**Tech Stack:** Markdown, GitBook, Claude Code, Superpowers, Hooks, MCP

**Execution Note:** 本计划不包含 git commit 步骤；只有在用户明确要求提交时再执行提交。

---

## File Structure

### Files to create
- `vibecoding-tutorial/core-concepts/commander-vs-coder.md` — 第二章开篇，建立“开发者 → 总指挥”的主线认知
- `vibecoding-tutorial/core-concepts/context-is-all.md` — 解释上下文的构成、窗口限制与优化策略
- `vibecoding-tutorial/core-concepts/ai-trust-model.md` — 给出 AI 放权与人工审查的风险分层框架
- `vibecoding-tutorial/core-concepts/test-driven-vibe.md` — 解释测试与验收标准为何是 VibeCoding 的安全带
- `vibecoding-tutorial/core-concepts/skills-hooks-and-mcp.md` — 收束全章，说明 Skills、Hooks、MCP 的协同价值与推荐清单

### Files to reference
- `vibecoding-tutorial-outline.md` — 第二章权威结构与主题来源
- `vibecoding-tutorial/SUMMARY.md` — 第二章 5 篇标题与路径基准
- `docs/superpowers/specs/2026-04-02-second-chapter-core-paradigms-design.md` — 已确认的第二章设计文档
- `vibecoding-tutorial/quick-start/what-is-vibecoding.md` — 第一章对“协作方式”的铺垫
- `vibecoding-tutorial/quick-start/first-vibe.md` — 第一章对“协作闭环”的铺垫
- `vibecoding-tutorial/quick-start/toolkit-setup.md` — 第一章对工具入口的铺垫

### Files not expected to change
- `vibecoding-tutorial/SUMMARY.md` — 当前第二章条目与目标文件已对齐，无需改动
- `vibecoding-tutorial/README.md` — 本轮只写正文，不回改首页

## Task 1: 写作第一篇《角色转变：从“开发者”到“总指挥”》

**Files:**
- Create: `vibecoding-tutorial/core-concepts/commander-vs-coder.md`
- Reference: `vibecoding-tutorial/quick-start/what-is-vibecoding.md`
- Reference: `docs/superpowers/specs/2026-04-02-second-chapter-core-paradigms-design.md`

- [ ] **Step 1: 写出文章骨架，明确这是第二章开篇立论**

```md
# 角色转变：从“开发者”到“总指挥”

## 目标

## 内容

### 把 AI 当“高级补全”，其实还是旧玩法

### 为什么 VibeCoding 会逼你换角色

### 总指挥到底负责什么

### 甩手不等于放弃判断

## 实践

## 小结
```

- [ ] **Step 2: 写开场破题段，先否定低配用法**

```md
很多人开始用 AI 写代码时，还是沿用老习惯：自己想清楚大部分实现，再把零碎片段丢给 AI 补完。

这种用法当然有帮助，但它更像“更聪明的补全”，还不算真正的 VibeCoding。

VibeCoding 真正改变的，不是你多了一个会写代码的工具，而是你开始重新分配人和 AI 的职责。
```

- [ ] **Step 3: 写旧角色与新角色对比，突出职责变化**

```md
过去你更像亲自下场的执行者：自己拆任务、自己查资料、自己逐行实现、自己补细节。

现在你更像总指挥：

- 你定义目标
- 你提供上下文
- 你划定边界
- 你验收结果
- AI 负责草拟、搜索、执行、整理和快速迭代

代码仍然重要，但你的高价值时间会更多花在判断与调度上。
```

- [ ] **Step 4: 写“总指挥负责什么”部分，给出 4 个明确职责**

```md
把自己切换到总指挥视角后，你最核心的工作通常变成 4 件事：

1. 把模糊想法说成可执行目标
2. 把相关文件、约束和背景补充给 AI
3. 判断哪些任务可以放手，哪些必须盯紧
4. 用验收标准和测试确认结果真的可用

这 4 件事，正好也是第二章后面几篇要展开讲的能力。
```

- [ ] **Step 5: 写误区提醒，强调“不是甩手掌柜”**

```md
“总指挥”这个说法最容易让人误解的地方，是以为从此只要发号施令，不用再管过程。

不是这样的。

你可以少写很多机械代码，但不能放弃判断责任。AI 可以代劳，不能代责；可以提速，不能替你上线背锅。
```

- [ ] **Step 6: 写实践部分，给出“普通提问 vs 指挥式提问”对比**

```md
普通提问：

> 帮我给这个页面加个搜索框。

指挥式提问：

> 请在 `src/pages/users.tsx` 的用户列表页增加前端搜索框，只做前端过滤，不改后端接口；保留现有分页；搜索为空时显示全部数据；完成后说明你改了哪些文件，以及我该怎么验证功能正常。

差别不在“语气更高级”，而在你是否把目标、范围、限制和验收一起说清楚。
```

- [ ] **Step 7: 写小结，并挂到后三篇能力地图**

```md
当你意识到自己不再主要负责“逐行实现”，而是负责“定义、提供、判断、验收”，VibeCoding 才算真正开始。

接下来的问题自然就是：既然你是总指挥，你到底靠什么把 AI 指挥好？下一篇，我们先看最基础的一项硬功夫：上下文管理。
```

- [ ] **Step 8: 通读文件，确认其自然链接到 `./context-is-all.md`**

Run: `sed -n '1,260p' vibecoding-tutorial/core-concepts/commander-vs-coder.md`
Expected: 文章完成角色立论、职责分解、实践对比和到下一篇的过渡

## Task 2: 写作第二篇《上下文管理：如何喂饱 AI 的记忆》

**Files:**
- Create: `vibecoding-tutorial/core-concepts/context-is-all.md`
- Reference: `vibecoding-tutorial/core-concepts/commander-vs-coder.md`
- Reference: `docs/superpowers/specs/2026-04-02-second-chapter-core-paradigms-design.md`

- [ ] **Step 1: 写出文章骨架，覆盖构成、限制、优化策略**

```md
# 上下文管理：如何喂饱 AI 的记忆

## 目标

## 内容

### 为什么“帮我改一下这个 bug”经常把 AI 送进沟里

### 上下文到底由什么组成

### 上下文窗口不是无限的

### 怎么喂，才叫喂对

## 实践

## 小结
```

- [ ] **Step 2: 写开场，用错误示例引入上下文问题**

```md
一句“帮我改一下这个 bug”，听起来很自然，对 AI 来说却常常像在玩猜谜。

它不知道相关文件在哪，不知道你刚试过什么，不知道哪些约束不能碰，也不知道“修好”的标准是什么。

很多人以为 AI 发挥不稳定，其实问题往往不是模型心情不好，而是上下文给得太少、太散，或者太乱。
```

- [ ] **Step 3: 写出上下文构成，明确 4 类材料**

```md
对 VibeCoding 来说，常见的上下文通常由 4 部分组成：

- **文件上下文**：相关代码、配置、报错位置、接口定义
- **对话上下文**：你们前面已经确认过的目标、限制、取舍
- **工具结果**：测试输出、搜索结果、日志、命令反馈
- **约束上下文**：技术栈、代码风格、不能动的边界、验收标准

总指挥的工作，不是把所有东西一股脑倒给 AI，而是把真正关键的材料递到它手边。
```

- [ ] **Step 4: 写窗口限制部分，解释“记忆不是无限”**

```md
AI 的上下文窗口不是无限仓库，更像一张有限大小的工作台。

你往上面堆得越多，不代表越有帮助；如果关键材料被淹没在一堆次要信息里，AI 反而更容易抓错重点。

所以“喂饱 AI”不是疯狂塞料，而是让重要信息足够靠前、足够清晰、足够可执行。
```

- [ ] **Step 5: 写优化策略，给出可操作的喂料原则**

```md
更有效的做法通常是：

1. 先给任务目标和完成标准
2. 再给最相关的文件和报错信息
3. 明确哪些地方不能动
4. 只在需要时补充更多细节

你不是在给 AI 做资料归档，而是在给它搭一个最容易做对事的工作现场。
```

- [ ] **Step 6: 写实践部分，给出“上下文不足 vs 上下文充分”的命令对比**

```md
上下文不足：

> 帮我修一下用户列表页的搜索问题。

上下文充分：

> 请检查 `src/pages/users.tsx` 的前端搜索逻辑。当前问题是输入关键字后结果不会实时刷新。只改前端，不动后端接口；保留现有分页逻辑；如果需要验证，请先告诉我你准备怎么验证。

第二种说法没有更花哨，只是把 AI 真正需要的材料提前摆好了。
```

- [ ] **Step 7: 写小结，并自然引向信任模型**

```md
上下文质量，往往就是 AI 输出质量的上限。

但就算上下文给得再好，也不代表所有任务都能放心放手。下一篇，我们就来建立一套更现实的问题：什么时候可以大胆让 AI 往前跑，什么时候你必须亲自盯着。
```

- [ ] **Step 8: 通读文件，确认其回扣 `./commander-vs-coder.md` 并引到 `./ai-trust-model.md`**

Run: `sed -n '1,280p' vibecoding-tutorial/core-concepts/context-is-all.md`
Expected: 文章完整说明上下文构成、窗口限制、优化方法与下一篇过渡

## Task 3: 写作第三篇《AI 可信度模型》

**Files:**
- Create: `vibecoding-tutorial/core-concepts/ai-trust-model.md`
- Reference: `vibecoding-tutorial/core-concepts/context-is-all.md`
- Reference: `docs/superpowers/specs/2026-04-02-second-chapter-core-paradigms-design.md`

- [ ] **Step 1: 写出文章骨架，围绕风险分层而不是抽象伦理**

```md
# AI 可信度模型

## 目标

## 内容

### 真正危险的不是 AI 出错，而是你没分层

### 三个判断维度：可逆性、影响范围、可验证性

### 哪些任务可以放心让 AI 多跑几步

### 哪些任务必须人工审查

## 实践

## 小结
```

- [ ] **Step 2: 写开场，先把“信不信 AI”改写成“怎么分层放权”**

```md
很多人讨论 AI 时，喜欢问一个太笼统的问题：到底该不该信它？

这个问题其实不够好。

更有用的问法是：面对不同任务，我该把权限放到什么程度？

真正危险的，不是 AI 会出错，而是你把低风险任务和高风险任务用同一种方式处理。
```

- [ ] **Step 3: 写出 3 个判断维度，并给每个维度一句解释**

```md
一个实用的判断框架，可以先看 3 个维度：

- **可逆性**：做错了以后，回滚难不难
- **影响范围**：影响的是一个局部页面，还是整条业务链路
- **可验证性**：你能不能快速、明确地确认结果对不对

这 3 个维度越安全，你越可以让 AI 自动推进更多步骤。
```

- [ ] **Step 4: 写低风险任务示例，说明可高授权场景**

```md
像下面这些任务，通常可以让 AI 多跑几步：

- 补充局部文案或简单交互
- 写测试草稿
- 重命名局部变量或整理重复样板代码
- 补一段清晰边界内的前端展示逻辑

因为这类任务通常影响范围小、容易回退，也比较容易验证。
```

- [ ] **Step 5: 写中高风险任务示例，说明必须审查的场景**

```md
而下面这些任务，就不适合一句“你直接改吧”然后放手不管：

- 数据库结构变更
- 权限逻辑调整
- 支付、认证、删除等高后果操作
- 涉及多个模块联动的大范围重构

这类任务不是不能让 AI 参与，而是应该拆步骤、先做计划、逐步授权，并在关键节点人工复核。
```

- [ ] **Step 6: 写实践部分，把连续案例按风险拆层**

```md
同样是“给用户列表加搜索能力”这个案例：

- 让 AI 先补前端输入框和本地过滤逻辑：风险较低
- 让 AI 直接改后端查询接口：风险明显上升
- 让 AI 顺手重构整页状态管理：需要额外警惕

总指挥的判断，不在于“敢不敢用 AI”，而在于“哪一步放多大权限”。
```

- [ ] **Step 7: 写小结，并引到“测试作为安全带”**

```md
当你学会按风险分层放权后，协作已经比“全靠感觉”稳很多了。

但如果想让放权再稳一层，还需要一件更硬的东西：可验证的护栏。下一篇，我们就把这根护栏讲清楚——为什么测试不是额外工作，而是 VibeCoding 的安全带。
```

- [ ] **Step 8: 通读文件，确认其回扣 `./context-is-all.md` 并引到 `./test-driven-vibe.md`**

Run: `sed -n '1,280p' vibecoding-tutorial/core-concepts/ai-trust-model.md`
Expected: 文章提供清晰风险框架、低高风险示例与到测试篇的过渡

## Task 4: 写作第四篇《自动化测试：Vibe Coding 的安全带》

**Files:**
- Create: `vibecoding-tutorial/core-concepts/test-driven-vibe.md`
- Reference: `vibecoding-tutorial/core-concepts/ai-trust-model.md`
- Reference: `docs/superpowers/specs/2026-04-02-second-chapter-core-paradigms-design.md`

- [ ] **Step 1: 写出文章骨架，聚焦“测试在 AI 协作中的控制作用”**

```md
# 自动化测试：Vibe Coding 的安全带

## 目标

## 内容

### 没有测试的快，常常只是更快翻车

### 为什么 AI 会放大验证缺口

### 怎么把模糊需求写成可验证结果

### 先定义成功，再让 AI 开始实现

## 实践

## 小结
```

- [ ] **Step 2: 写开场，用强对比说明“快但不可验证”的危险**

```md
没有测试的 VibeCoding，很像在高速公路上把车开快了，却顺手把安全带解开。

你会先感受到速度，等问题出现时才发现：原来自己根本没有一个稳定的方法确认它真的做对了。

AI 的问题不在于它写得慢，而在于它写得太快时，会把原本就松散的验证习惯放大得更明显。
```

- [ ] **Step 3: 写“为什么测试是必需品”，把测试讲成控制系统**

```md
传统开发里，很多人已经知道测试重要；到了 VibeCoding 里，它的重要性会再上一个台阶。

因为 AI 可以在很短时间内改很多地方、生成很多代码、顺手做很多你没明确授权的“热心发挥”。

如果没有测试和验收标准，你很容易只能凭肉眼判断“好像差不多”，而这正是最危险的状态。
```

- [ ] **Step 4: 写“可验证需求”部分，给出 3 类标准**

```md
把模糊愿望变成可验证需求，至少要补 3 类东西：

- **成功条件**：什么行为出现，算完成
- **边界条件**：哪些旧行为不能被破坏
- **失败条件**：哪些情况出现，就算没做对

写到这一步，你其实已经不是在“许愿”，而是在给 AI 画验收线。
```

- [ ] **Step 5: 写“先定义成功，再让 AI 实现”部分，给出示例 prompt**

```md
比起直接说“帮我把搜索功能做出来”，更稳的说法是：

> 先帮我把这个需求整理成验收条件和测试点：用户在用户列表页输入关键字后，应实时过滤当前页数据；清空输入后恢复全部列表；分页逻辑不变；不存在结果时显示空状态提示。确认后再开始实现。

这样做的关键，不是多了一步流程，而是先把“什么叫做对”说死，再让 AI 开始跑。
```

- [ ] **Step 6: 写实践部分，把连续案例写成“先验收、后实现”的闭环**

```md
在连续案例里，更稳的推进顺序是：

1. 先列验收条件
2. 再让 AI 给出实现方案
3. 然后让 AI 修改代码
4. 最后用测试或手动验证确认结果

快并不是目标本身；“快而可验证”才是。
```

- [ ] **Step 7: 写小结，并引向最后一篇系统化增强**

```md
当你学会先定义成功标准，再让 AI 开始实现，你就已经给高速协作装上了安全带。

接下来还有最后一步：把这些方法从“临场发挥”升级成“系统能力”。下一篇，我们把 Skills、Hooks、MCP 这三件套串起来。
```

- [ ] **Step 8: 通读文件，确认其回扣 `./ai-trust-model.md` 并引到 `./skills-hooks-and-mcp.md`**

Run: `sed -n '1,300p' vibecoding-tutorial/core-concepts/test-driven-vibe.md`
Expected: 文章清楚说明测试的控制作用、可验证需求写法与下一篇过渡

## Task 5: 写作第五篇《AI 能力扩展三件套》

**Files:**
- Create: `vibecoding-tutorial/core-concepts/skills-hooks-and-mcp.md`
- Reference: `vibecoding-tutorial/core-concepts/test-driven-vibe.md`
- Reference: `docs/superpowers/specs/2026-04-02-second-chapter-core-paradigms-design.md`

- [ ] **Step 1: 写出文章骨架，确保先讲作用再讲推荐清单**

```md
# AI 能力扩展三件套

## 目标

## 内容

### 只靠临场聊天，为什么协作会越来越不稳

### Skills：把好做法固化成可复用套路

### Hooks：把关键检查变成自动触发

### MCP：把外部能力接进工作流

### 这份推荐清单为什么值得装

## 实践

## 小结
```

- [ ] **Step 2: 写开场，说明“从单次对话到系统调度”的升级**

```md
如果前面几篇解决的是“你应该怎样指挥 AI”，这一篇要解决的就是：怎么让这些好习惯不只靠你临场发挥。

只靠一轮轮聊天推进工作，协作质量会高度依赖你当下有没有想全、有没有记住、有没有及时补充。

而 Skills、Hooks、MCP 的价值，就是把零散经验变成更稳定的工作流。
```

- [ ] **Step 3: 写 Skills 部分，并点名推荐 superpowers**

```md
**Skills** 的作用，是把常见流程固化成可以重复调用的套路。

比如 brainstorming、writing-plans、debugging、code-review 这类能力，一旦做成 Skill，你就不需要每次都从零描述“这次该怎么合作”。

如果你要装一个最值得优先体验的技能包，这里明确推荐 [superpowers](https://github.com/obra/superpowers)。
```

- [ ] **Step 4: 写 Hooks 部分，强调自动执行规则的价值**

```md
**Hooks** 像是你给协作流程加上的自动检查点。

它可以在某些关键事件发生时自动提醒、自动检查，甚至自动触发特定动作，让很多“本来容易忘”的规则变成默认执行。

对总指挥来说，这意味着你不必每次都靠记忆维持纪律。
```

- [ ] **Step 5: 写 MCP 部分，并明确推荐工具清单与各自职责**

```md
**MCP** 的作用，是把 AI 从“只会基于当前对话思考”扩展成“能接外部工具和知识源工作”。

这一类能力里，本文明确建议安装：

- `chrome-devtools-mcp`：浏览器调试
- `context7`：文档检索
- `memory`：长期记忆
- `sequential-thinking`：分步推理
- `spec-workflow`：规格驱动流程
- `tavily`：联网搜索
- `context-mode`：上下文治理

它们不是装得越多越厉害，而是分别补上不同的工作能力缺口。
```

- [ ] **Step 6: 写“推荐清单如何协同”部分，收束成工作流视角**

```md
把它们放在一起看，你会更容易理解这三件套为什么重要：

- Skills 固化套路
- Hooks 固化纪律
- MCP 扩展能力

前者解决“怎么做更稳”，中者解决“怎么让规则自动执行”，后者解决“怎么让 AI 看得更多、做得更多”。

当这三类能力开始协同，你管理的就不再只是单次对话，而是一整套可复用的协作系统。
```

- [ ] **Step 7: 写实践部分，用连续案例收束到“系统化增强”**

```md
还是回到前面的连续案例。

如果类似的“小功能 + 上下文补充 + 风险判断 + 验收检查”会反复出现，那么最好的做法就不再是每次都手写同样的说明，而是：

- 用 Skills 固化流程
- 用 Hooks 自动插入检查
- 用 MCP 接入外部工具和知识

这样，经验才会从“这次做对了”升级成“下次也更容易做对”。
```

- [ ] **Step 8: 写全章小结，结束第二章并为第三章实战操纵铺路**

```md
到这里，第二章真正想建立的东西就完整了：

- 你知道自己为什么要从开发者转向总指挥
- 你知道该如何喂上下文
- 你知道怎么按风险放权
- 你知道怎么用测试兜底
- 你也知道怎样把这些方法升级成系统能力

下一章，我们就从“理解范式”正式进入“如何在日常开发里把这些范式用起来”。
```

- [ ] **Step 9: 通读文件，确认其自然承接第二章并引向第三章**

Run: `sed -n '1,320p' vibecoding-tutorial/core-concepts/skills-hooks-and-mcp.md`
Expected: 文章完整说明三件套作用、推荐清单、协同关系与全章收束

## Task 6: 统一校对第二章的衔接、链接与口径

**Files:**
- Modify: `vibecoding-tutorial/core-concepts/commander-vs-coder.md`
- Modify: `vibecoding-tutorial/core-concepts/context-is-all.md`
- Modify: `vibecoding-tutorial/core-concepts/ai-trust-model.md`
- Modify: `vibecoding-tutorial/core-concepts/test-driven-vibe.md`
- Modify: `vibecoding-tutorial/core-concepts/skills-hooks-and-mcp.md`
- Reference: `vibecoding-tutorial/SUMMARY.md`

- [ ] **Step 1: 检查 5 篇是否都保留统一节奏“目标 → 内容 → 实践 → 小结”**

```md
检查点：
- 每篇都有 `## 目标`
- 每篇都有 `## 内容`
- 每篇都有 `## 实践`
- 每篇都有 `## 小结`
```

- [ ] **Step 2: 补齐必要相对链接，形成递进链条**

```md
需要出现的相对链接：
- `commander-vs-coder.md` → `./context-is-all.md`
- `context-is-all.md` → `./commander-vs-coder.md`、`./ai-trust-model.md`
- `ai-trust-model.md` → `./context-is-all.md`、`./test-driven-vibe.md`
- `test-driven-vibe.md` → `./ai-trust-model.md`、`./skills-hooks-and-mcp.md`
- `skills-hooks-and-mcp.md` → `../practical-skills/how-to-spec-tasks.md`
```

- [ ] **Step 3: 统一“总指挥”主线口径，避免某篇跑偏成纯工具文或纯测试文**

```md
统一要求：
- 每篇都要回到“开发者职责如何变化”
- 每篇都要解释“这会怎样改变你和 AI 的分工”
- 不把任何一篇写成 API 手册或传统课程讲义
```

- [ ] **Step 4: 统一连续案例，让五篇都围绕同一类小功能扩展任务**

```md
连续案例基线：
- 场景：给已有小项目补一项新功能，并确保不破坏原有行为
- 允许各篇切不同切面，但不要换成完全无关的新案例
```

- [ ] **Step 5: 统一推荐清单口径，确保 `skills-hooks-and-mcp.md` 既明确推荐又不写成安装手册**

```md
必须点名推荐：
- superpowers
- chrome-devtools-mcp
- context7
- memory
- sequential-thinking
- spec-workflow
- tavily
- context-mode

写法约束：
- 说明“建议安装”和“各自价值”
- 不展开逐步安装教程
```

- [ ] **Step 6: 逐篇快速通读，确认语气统一为“亲切、实用、略带幽默”**

Run: `for f in vibecoding-tutorial/core-concepts/*.md; do echo "===== $f ====="; sed -n '1,320p' "$f"; done`
Expected: 五篇结构统一、主线清晰、链接正确、案例一致、工具清单口径一致

## Task 7: 最终验证第二章与目录、提纲和设计的一致性

**Files:**
- Reference: `vibecoding-tutorial/SUMMARY.md`
- Reference: `vibecoding-tutorial-outline.md`
- Reference: `docs/superpowers/specs/2026-04-02-second-chapter-core-paradigms-design.md`
- Reference: `vibecoding-tutorial/core-concepts/commander-vs-coder.md`
- Reference: `vibecoding-tutorial/core-concepts/context-is-all.md`
- Reference: `vibecoding-tutorial/core-concepts/ai-trust-model.md`
- Reference: `vibecoding-tutorial/core-concepts/test-driven-vibe.md`
- Reference: `vibecoding-tutorial/core-concepts/skills-hooks-and-mcp.md`

- [ ] **Step 1: 确认 5 个文件名与 `SUMMARY.md` 条目完全一致**

```md
应一致的文件：
- core-concepts/commander-vs-coder.md
- core-concepts/context-is-all.md
- core-concepts/ai-trust-model.md
- core-concepts/test-driven-vibe.md
- core-concepts/skills-hooks-and-mcp.md
```

- [ ] **Step 2: 对照提纲，确认 5 篇主题没有跑偏**

```md
提纲核对点：
- `commander-vs-coder.md`：角色转变与人机分工
- `context-is-all.md`：上下文构成、窗口限制、优化策略
- `ai-trust-model.md`：可信度评估与人工审查边界
- `test-driven-vibe.md`：测试、可验证需求、安全带
- `skills-hooks-and-mcp.md`：Skills / Hooks / MCP 三件套协同
```

- [ ] **Step 3: 对照设计文档，确认这些要求已全部落地**

```md
设计核对点：
- 强主线：从“开发者”到“总指挥”
- 写法：平衡型，先讲清概念再接实操场景
- 示例：混合型，命令片段 + 连续小案例
- 收束：最后一篇明确推荐工具清单并解释协同价值
```

- [ ] **Step 4: 最终人工通读第二章 5 篇内容**

Run: `for f in vibecoding-tutorial/core-concepts/*.md; do echo "===== $f ====="; sed -n '1,320p' "$f"; done`
Expected: 第二章五篇既可单独阅读，也能按顺序组成完整的“总指挥范式”升级路径
