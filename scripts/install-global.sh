#!/bin/bash
# Lie ~/.claude/CLAUDE.md à global/CLAUDE.md de ce dépôt (sauvegarde l'existant).
set -e

repo="$(cd "$(dirname "$0")/.." && pwd)"
source_file="$repo/global/CLAUDE.md"
target="$HOME/.claude/CLAUDE.md"

if [ ! -f "$source_file" ]; then
  echo "Introuvable : $source_file" >&2
  exit 1
fi

mkdir -p "$HOME/.claude"

if [ -L "$target" ] && [ "$(readlink "$target")" = "$source_file" ]; then
  echo "Déjà installé : $target -> $source_file"
  exit 0
fi

if [ -e "$target" ] || [ -L "$target" ]; then
  backup="$target.bak.$(date +%Y%m%d-%H%M%S)"
  mv "$target" "$backup"
  echo "Ancien fichier sauvegardé : $backup"
fi

ln -s "$source_file" "$target"
echo "Installé : $target -> $source_file"
