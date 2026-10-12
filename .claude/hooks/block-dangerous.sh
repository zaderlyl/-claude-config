#!/bin/bash
# Bloque les commandes Bash dangereuses (exemple de hook PreToolUse).
cmd=$(jq -r '.tool_input.command // ""')
if echo "$cmd" | grep -qE 'rm -rf /|git push (-f|--force)|:\(\)\{'; then
  echo "Commande bloquée par le hook block-dangerous.sh" >&2
  exit 2
fi
exit 0
