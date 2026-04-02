# VibeCoding 快速入门教程 - 完整大纲（终版）

> 面向有开发经验但未接触 VibeCoding 的技术人员
> 预计学习时间：2-2.5 小时 | 共 20 个文件

---

## 目录结构

```
vibecoding-tutorial/
├── README.md                          # 教程介绍、什么是"Vibe"
├── SUMMARY.md                         # GitBook 目录（学习路径）
│
├── quick-start/                       # 第一章：快速开始（25分钟）
│   ├── what-is-vibecoding.md          # 什么是 VibeCoding（精简版，快速建立认知）
│   ├── first-vibe.md                  # 你的第一次"甩手掌柜"体验（先爽一把）
│   │                                   # (0代码实现一个小功能)
│   └── toolkit-setup.md               # 补环境：核心工具链与神仙套件
│                                       # (Claude Code, API中转, Superpowers, context7)
│
├── core-concepts/                     # 第二章：核心范式（40分钟）
│   ├── commander-vs-coder.md          # 角色转变：从"开发者"到"总指挥"
│   ├── context-is-all.md              # 上下文管理（如何喂饱 AI 的记忆）
│   ├── ai-trust-model.md              # AI 可信度模型（什么时候该信，什么时候必须验证）
│   ├── test-driven-vibe.md            # 自动化测试：Vibe Coding 的安全带
│   └── skills-hooks-and-mcp.md        # AI 能力扩展三件套
│                                       # (Skills 技能、Hooks 钩子、MCP 外部连接)
│
├── practical-skills/                  # 第三章：实战操纵（30分钟）
│   ├── how-to-spec-tasks.md           # 如何给 AI 下达"可执行任务"
│   │                                   # (任务描述 = 输入/输出/约束/验收标准)
│   ├── big-feature-breakdown.md       # 拆解大需求：从 PRD → 任务列表 → 逐步实现
│   ├── loop-and-debug.md              # 死循环处理：当 AI 陷入反复尝试怎么办
│   ├── code-review-for-ai.md          # 审查 AI 的代码（常见问题 + 检查清单）
│   └── refactor-with-vibe.md          # 老代码重构：让 AI 接管遗留系统
│
├── case-study/                        # 第四章：完整案例（30分钟）
│   └── build-a-real-project.md        # 从 0 → PRD → 拆解 → 实现 → Debug → 重构
│                                       # (贯穿整个 VibeCoding 流程的实战演示)
│
└── best-practices/                    # 第五章：最佳实践（30分钟）
    ├── context-limits.md              # 上下文的"黄金边界"与防退化指南
    ├── rewind-not-loop.md             # "及时回退"法则：避免无效迭代
    ├── epic-to-story.md               # 巨型需求的"原子化"拆解法
    ├── dos-and-donts.md               # 高效协作原则（Do's & Don'ts）
    ├── prompt-less-is-more.md         # 为什么核心不是 Prompt，而是任务设计
    ├── limitations-and-costs.md       # 成本、限制与不适用场景
    └── next-steps.md                  # 进阶：构建自动化 AI 开发工作流
```

---

## 各章节内容简介

### 第一章：快速开始（25分钟）
目标：让读者先完成第一次 VibeCoding 体验，建立直观感受

| 文件 | 核心内容 |
|------|----------|
| what-is-vibecoding.md | 精简版概念介绍：从 Copilot → ChatGPT → Agent 的演进，快速建立认知 |
| first-vibe.md | **先体验，再学习**。手把手完成一个小功能（如生成一个待办列表），全程 0 手写代码，感受"甩手掌柜"的快感 |
| toolkit-setup.md | 补环境课：安装配置 Claude Code、API 中转方案、Superpowers 技能、context7 文档查询 |

### 第二章：核心范式（40分钟）
目标：理解 VibeCoding 的本质和工作原理

| 文件 | 核心内容 |
|------|----------|
| commander-vs-coder.md | Mindset 转变：你负责思考，AI 负责执行；从"写代码的人"变成"指挥写代码的人" |
| context-is-all.md | 上下文构成（文件、对话、工具结果）、窗口限制、优化策略（如何喂饱 AI 的记忆） |
| ai-trust-model.md | AI 可信度评估框架：什么时候可以放心让 AI 自动执行，什么时候必须人工审查 |
| test-driven-vibe.md | 为什么测试是 VibeCoding 的必需品、如何写可验证的需求、测试作为"安全带" |
| skills-hooks-and-mcp.md | 三件套协同：Skills（内置能力）、Hooks（事件触发）、MCP（外部工具连接） |

### 第三章：实战操纵（30分钟）
目标：掌握日常开发中的具体技巧

| 文件 | 核心内容 |
|------|----------|
| how-to-spec-tasks.md | 任务描述的标准格式：输入/输出/约束/验收标准，让 AI 一次做对 |
| big-feature-breakdown.md | 需求拆解方法：从 PRD → 任务列表 → 逐步实现，大需求的拆分策略 |
| loop-and-debug.md | 识别 AI 死循环的信号、如何打断和引导、常见陷阱及破解方法 |
| code-review-for-ai.md | AI 代码的典型问题（过度设计、遗漏边界、幻觉 API）、审查清单 |
| refactor-with-vibe.md | 让 AI 接手老项目的策略：先理解 → 再测试 → 后重构 |

### 第四章：完整案例（30分钟）
目标：通过一个完整项目串联所有知识点

| 文件 | 核心内容 |
|------|----------|
| build-a-real-project.md | 端到端实战：从需求描述 → 生成 PRD → 拆解任务 → AI 实现 → 调试修复 → 代码审查 → 最终交付。完整展示 VibeCoding 工作流 |

### 第五章：最佳实践（30分钟）
目标：避免踩坑，建立长期高效的工作流

| 文件 | 核心内容 |
|------|----------|
| context-limits.md | 黄金边界法则：文件数量、代码行数、对话轮数的经验值，防止 AI"变傻" |
| rewind-not-loop.md | 何时该回退：3 次尝试失败后重置比硬磕更有效，"及时止损"原则 |
| epic-to-story.md | 史诗级需求的拆分策略：横向（模块）+ 纵向（流程），原子化任务设计 |
| dos-and-donts.md | 高效协作原则：保持对话流畅、适时打断、给予反馈、氛围感工作法 |
| prompt-less-is-more.md | 反直觉真相：不需要学习 Prompt Engineering，需要学习任务拆解和任务设计 |
| limitations-and-costs.md | 诚实面对限制：API 成本、响应延迟、不适合的场景、认知盲区 |
| next-steps.md | 进阶方向：自定义 Skills、Multi-Agent 协作、自动化工作流、打造 AI 团队 |

---

## 学习路径时间线

```
0:00  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
      │ 第一章：快速开始                                    │ 25分钟
      │  what-is-vibecoding → first-vibe → toolkit-setup    │
0:25  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
      │ 第二章：核心范式                                    │ 40分钟
      │  commander-vs-coder → context-is-all                │
      │  → ai-trust-model → test-driven-vibe                │
      │  → skills-hooks-and-mcp                             │
1:05  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
      │ 第三章：实战操纵                                    │ 30分钟
      │  how-to-spec-tasks → big-feature-breakdown          │
      │  → loop-and-debug → code-review-for-ai              │
      │  → refactor-with-vibe                               │
1:35  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
      │ 第四章：完整案例                                    │ 30分钟
      │  build-a-real-project（端到端实战演示）               │
2:05  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
      │ 第五章：最佳实践                                    │ 30分钟
      │  context-limits → rewind-not-loop → epic-to-story   │
      │  → dos-and-donts → prompt-less-is-more              │
      │  → limitations-and-costs → next-steps               │
2:35  ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━
```

---

## 文件命名规范

- 全部小写，单词用连字符 `-` 分隔
- 避免特殊字符（如 `'`、`!`、`?`、`/`）
- 保持简洁，文件名控制在 3-5 个单词
- 语义清晰，文件名即内容概括

---

## 内容风格指南

- **语言**：简体中文，技术术语保留英文
- **语气**：亲切、实用、略带幽默（如"甩手掌柜"、"神仙套件"）
- **代码**：提供可运行的示例，注释详细
- **结构**：每篇文章包含：目标 → 内容 → 实践 → 小结
- **跨文件引用**：使用相对路径链接，如 `../core-concepts/context-is-all.md`
