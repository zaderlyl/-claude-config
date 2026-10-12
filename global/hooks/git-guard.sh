#!/bin/bash
# Hook PreToolUse (Bash) : bloque les commandes git sensibles lancées par Claude.
# Une autorisation à usage unique (posée par /commit, /push, /merge) les débloque.

TOKEN_DIR="$HOME/.claude/git-ok"
TOKEN_TTL=300

cmd=$(jq -r '.tool_input.command // ""')

# Autorisation valide pour une action (commit, push, merge) ?
token_valid() {
  local f="$TOKEN_DIR/$1"
  [ -f "$f" ] || return 1
  local ts now
  ts=$(cat "$f" 2>/dev/null)
  now=$(date +%s)
  [[ "$ts" =~ ^[0-9]+$ ]] && [ $((now - ts)) -lt "$TOKEN_TTL" ]
}

# Une commande est examinée segment par segment, seul le début compte :
# du texte contenant "git commit" au milieu d'un fichier ne déclenche rien.
git_re='^git( +(-C +[^ ]+|-c +[^ ]+|--[a-z-]+(=[^ ]+)?|-[a-zA-Z]+))* +(add|commit|push|merge|rebase|reset)( |$)'
gh_re='^gh +pr +merge( |$)'

while IFS= read -r segment; do
  seg="${segment#"${segment%%[![:space:]]*}"}"
  seg=$(echo "$seg" | sed -E 's/^([A-Za-z_][A-Za-z0-9_]*=[^ ]* +)+//')

  action=""
  if [[ "$seg" =~ $git_re ]]; then
    action="${BASH_REMATCH[4]}"
  elif [[ "$seg" =~ $gh_re ]]; then
    action="merge"
  else
    continue
  fi

  case "$action" in
    add|commit) needed="commit" ;;
    push)       needed="push" ;;
    merge)      needed="merge" ;;
    *)          needed="" ;;
  esac

  if [ -n "$needed" ] && token_valid "$needed"; then
    # L'autorisation est consommée par l'action principale (pas par add).
    [ "$action" != "add" ] && rm -f "$TOKEN_DIR/$needed"
    continue
  fi

  if [ -n "$needed" ]; then
    echo "Bloqué : git $action. Demande à l'utilisateur de taper /$needed." >&2
  else
    echo "Bloqué : git $action n'est jamais autorisé à Claude. L'utilisateur doit le lancer lui-même." >&2
  fi
  exit 2
done < <(echo "$cmd" | sed -E 's/(&&|\|\||;|\|)/\n/g')

exit 0
