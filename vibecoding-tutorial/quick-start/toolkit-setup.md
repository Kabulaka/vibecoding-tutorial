# Claude Code 安装与开发便捷功能

## 目标

这一篇只做两件事：先把 **Claude Code** 装起来，再简单认识几项常见的开发便捷功能。第一章不展开 MCP、Skills（Superpowers）、Hooks 的细节，那些内容放到第二章再系统讲。

## 内容

### 先把 Claude Code 装起来

对第一章来说，最重要的不是研究一整套扩展玩法，而是先把 Claude Code 这个主工具装好。

最小安装步骤可以写得很直接：

1. 先安装 **Node.js 18+**
2. 执行全局安装命令：`npm install -g @anthropic-ai/claude-code`
3. 进入你的项目目录，运行：`claude`
4. 首次启动时按提示完成登录或授权

到这里，你就已经有了最小可用的起步环境。

### 验证安装是否成功

别停在“应该装好了”。最简单的验证方式，就是进入一个项目目录后运行 `claude`，然后给它一个很小的任务，比如：

> 读取当前项目结构，并告诉我这个项目最适合从哪里开始。

如果它能正常启动、读取目录并给出靠谱建议，说明基础环境已经搭好了。

### 开发便捷功能 1：API 中转服务

装好 Claude Code 之后，有些人很快会关心一个现实问题：怎么更方便地接入模型服务。这里先做认知了解，不把它当成第一章的安装任务。

| 方案 | 适用场景 | GitHub |
|------|----------|--------|
| CLIProxyAPI | 适合希望把多种 CLI / 模型入口统一成兼容 API 服务的人，偏向喜欢自己掌控接入层、同时使用多模型的场景 | https://github.com/router-for-me/CLIProxyAPI |
| claude-relay-service | 适合希望搭一个更偏“中继服务”定位的统一入口，关注 Claude / OpenAI / Gemini 等服务统一接入的人 | https://github.com/Wei-Shaw/claude-relay-service |

这一节先知道它们解决什么问题就够了，不需要现在就安装。

### 开发便捷功能 2：模型切换

如果你后面会频繁在不同模型或不同 CLI 工具之间切换，也可以提前知道这两个常见项目。

| 工具 | 适用场景 | GitHub |
|------|----------|--------|
| cc-switch-cli | 适合命令行工作流，想在终端里统一管理 Claude Code、Codex、Gemini CLI 配置的人 | https://github.com/SaladDay/cc-switch-cli |
| cc-switch | 适合更偏桌面工具体验的人，希望用图形界面管理和切换多种 CLI 配置 | https://github.com/farion1231/cc-switch |

同样，这里先建立认知，不把它变成第一章的安装作业。

### 开发便捷功能 3：Claude Code StatusLine

除了“能用”，很多人还会关心一件事：**Claude Code 现在到底在忙什么？**

这时可以认识 `claude-hud`。这里的 **Plugin** 可以先简单理解成“给 Claude Code 增加额外功能的插件”。这一节不展开插件机制，只保留你真正会用到的安装步骤。

`claude-hud` 的作用，是提供一个更直观的 StatusLine / HUD，让你更容易看到上下文占用、工具状态、agent 运行情况和 todo 进度。

按照 README 的最小安装步骤，可以这样做：

1. 在 Claude Code 中添加 marketplace：`/plugin marketplace add jarrodwatts/claude-hud`
2. 安装插件：`/plugin install claude-hud`
3. 运行设置命令：`/claude-hud:setup`
4. 重启 Claude Code，让新的 statusLine 配置生效

如果你是 Linux 用户，README 还特别提醒：安装前可能需要先用 `TMPDIR=~/.cache/tmp claude` 的方式启动 Claude Code，以避开 `/tmp` 带来的安装问题。

项目地址：https://github.com/jarrodwatts/claude-hud

## 实践

这一篇的实践目标很简单，只做两件事：

1. 按步骤安装 Claude Code，并确认 `claude` 能在项目目录正常启动
2. 如果你很在意 StatusLine 体验，再按 README 安装 `claude-hud`

做到这一步，你就已经具备继续往后学和开始尝试的基础条件了。

## 小结

第一章的工具部分，重点不是“装得越多越好”，而是“先把入口装好，再按需要了解几项常见的便捷功能”。

现在你已经知道 Claude Code 的基本安装方式，也知道 API 中转、模型切换和 StatusLine 增强这些能力各自解决什么问题。先把主工具跑起来，后面的扩展内容我们第二章再展开。