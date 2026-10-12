#!/bin/bash
# Installe la config globale : lien de CLAUDE.md, commandes /commit /push /merge,
# et branchement des hooks dans ~/.claude/settings.json. Peut être relancé sans risque.
set -e

repo="$(cd "$(dirname "$0")/.." && pwd)"
claude_dir="$HOME/.claude"
stamp="$(date +%Y%m%d-%H%M%S)"

command -v jq >/dev/null || { echo "jq est requis : brew install jq" >&2; exit 1; }
[ -f "$repo/global/CLAUDE.md" ] || { echo "Introuvable : $repo/global/CLAUDE.md" >&2; exit 1; }

mkdir -p "$claude_dir/commands"

# link <source> <cible> : lien symbolique, sauvegarde de l'existant
link() {
  local src="$1" target="$2"
  if [ -L "$target" ] && [ "$(readlink "$target")" = "$src" ]; then
    echo "Déjà installé : $target"
    return
  fi
  if [ -e "$target" ] || [ -L "$target" ]; then
    mv "$target" "$target.bak.$stamp"
    echo "Ancien fichier sauvegardé : $target.bak.$stamp"
  fi
  ln -s "$src" "$target"
  echo "Installé : $target -> $src"
}

link "$repo/global/CLAUDE.md" "$claude_dir/CLAUDE.md"

for f in "$repo"/global/commands/*.md; do
  link "$f" "$claude_dir/commands/$(basename "$f")"
done

# Hooks : fusion dans settings.json sans écraser le reste
settings="$claude_dir/settings.json"
guard="$repo/global/hooks/git-guard.sh"
allow="$repo/global/hooks/git-allow.sh"
[ -f "$settings" ] || echo '{}' > "$settings"

new="$(jq --arg g "$guard" --arg a "$allow" '
  .hooks //= {} |
  .hooks.PreToolUse = ((.hooks.PreToolUse // []) |
    if any(.[]; .hooks[]?.command == $g) then .
    else . + [{matcher: "Bash", hooks: [{type: "command", command: $g}]}] end) |
  .hooks.UserPromptSubmit = ((.hooks.UserPromptSubmit // []) |
    if any(.[]; .hooks[]?.command == $a) then .
    else . + [{hooks: [{type: "command", command: $a}]}] end)
' "$settings")"

if [ "$new" = "$(jq . "$settings")" ]; then
  echo "Déjà installé : hooks dans $settings"
else
  cp "$settings" "$settings.bak.$stamp"
  echo "$new" > "$settings"
  echo "Hooks ajoutés dans $settings (sauvegarde : $settings.bak.$stamp)"
fi

echo "Terminé. Ouvre une nouvelle session Claude Code pour activer les hooks."
