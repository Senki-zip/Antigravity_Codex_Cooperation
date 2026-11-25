#!/usr/bin/env bash
set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
SKILL_SRC="$SCRIPT_DIR/skills/codex-architect/SKILL.md"
RULE_SRC="$SCRIPT_DIR/GEMINI.md"

SKILL_DST="$HOME/.gemini/config/skills/codex-architect/SKILL.md"
RULE_DST="$HOME/.gemini/GEMINI.md"

mkdir -p "$(dirname "$SKILL_DST")"
cp "$SKILL_SRC" "$SKILL_DST"

touch "$RULE_DST"
if ! grep -q "codex-architect" "$RULE_DST"; then
  printf '\n' >> "$RULE_DST"
  cat "$RULE_SRC" >> "$RULE_DST"
  echo "✅ 已写入全局规则至 $RULE_DST"
else
  echo "ℹ️  $RULE_DST 已包含 codex-architect 规则，跳过追加（如需更新请手动同步 $RULE_SRC）"
fi

echo "✅ 安装完成：$SKILL_DST 已就绪。"
