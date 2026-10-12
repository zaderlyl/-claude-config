#!/bin/bash
# Hook UserPromptSubmit : un message de l'utilisateur qui commence par /commit, /push
# ou /merge pose une autorisation à usage unique (lue par git-guard.sh).
# Seuls les messages de l'utilisateur déclenchent ce hook : Claude ne peut pas le simuler.

TOKEN_DIR="$HOME/.claude/git-ok"

prompt=$(jq -r '.prompt // ""')

if [[ "$prompt" =~ ^[[:space:]]*/(commit|push|merge)([[:space:]]|$) ]]; then
  mkdir -p "$TOKEN_DIR"
  date +%s > "$TOKEN_DIR/${BASH_REMATCH[1]}"
fi

exit 0
