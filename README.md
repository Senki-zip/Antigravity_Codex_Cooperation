# Antigravity + Codex 双模型协同开发技能（`codex-architect`）

本项目提供一套用于 **Antigravity（Neon）** 与本地 **OpenAI Codex CLI（`gpt-6.2-sol`）** 双模型协同开发的全局 Skill 与路由规则。

## 核心协作模式（四阶段闭环）

1. **阶段 1 · 需求拆解与设计对齐（Neon）**：阅读源码上下文，用通俗“人话”明确改动范围、数据流与接口契约、边界兜底、设计取舍以及审查档位；**未经用户确认严禁派发写码**。
2. **阶段 2 · 工程落地执行（Codex CLI）**：将确认后的设计压缩为高密度 Spec，调用 `codex exec -m gpt-6.2-sol -c model_reasoning_effort="high" --dangerously-bypass-approvals-and-sandbox` 编写代码并运行构建/测试验证。
3. **阶段 3 · 独立只读审查（Codex CLI，按档位触发）**：针对算法设计、状态机、并发、多文件核心改造或架构重构任务，另起全新只读会话（`-s read-only`），核对完成度并排查设计冲突，输出 **P0（阻塞级）/ P1（建议级）** 结构化审查报告。
4. **阶段 4 · 交叉复核、冲突讨论与“人话”交付（Neon）**：AGY 亲自逐行审阅 `git diff`（破除同源模型盲区），若存在 P0 完成度缺口或设计冲突则返回与用户讨论拍板后再返工收敛；确认无误后输出清晰简短的交付报告。

## 目录结构

```text
.
├── skills/
│   └── codex-architect/
│       └── SKILL.md      # 核心双模型协同开发技能规范
├── GEMINI.md             # 全局默认开发协作路由规则片段
├── install.sh            # 一键安装到本地 ~/.gemini 配置目录
└── README.md
```

## 快速安装

```bash
chmod +x install.sh
./install.sh
```

脚本将自动完成以下配置：
- 安装技能至 `~/.gemini/config/skills/codex-architect/SKILL.md`
- 若 `~/.gemini/GEMINI.md` 尚未配置 `codex-architect`，自动追加全局路由规则
