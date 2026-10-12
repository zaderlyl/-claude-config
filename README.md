# claude-config

Ma configuration Claude Code versionnée.

## Structure
```
CLAUDE.md            Instructions propres à ce dépôt
global/
  CLAUDE.md          Règles appliquées à tous mes projets
  commands/          /commit, /push, /merge
  hooks/             git-guard.sh, git-allow.sh
templates/projet/    Modèle de projet et conventions Phaser/JS
scripts/             Scripts utilitaires (VS Code, installation)
.claude/
  settings.json      Permissions et hooks de ce dépôt
  hooks/             Scripts exécutés automatiquement
  agents/            Sous-agents spécialisés
  commands/          Slash commands personnalisées
  skills/            Workflows réutilisables
```

## Installation globale
Sur chaque machine, depuis la racine du dépôt :
```bash
scripts/install-global.sh
```
Le script (relançable sans risque, il sauvegarde en `.bak` ce qu'il remplace) :
- lie `~/.claude/CLAUDE.md` à `global/CLAUDE.md` ;
- lie les commandes `/commit`, `/push`, `/merge` dans `~/.claude/commands/` ;
- ajoute les deux hooks dans `~/.claude/settings.json`.

Ouvrir ensuite une nouvelle session Claude Code pour activer les hooks. Pré-requis : `jq`.

Les chemins de `global/CLAUDE.md` et des hooks sont absolus : le dépôt doit rester dans `~/Documents/GitHub/claude-config`.

## Blocage des commandes git
Claude ne peut pas lancer `git add`, `commit`, `push`, `merge`, `rebase` ni `reset` de lui-même (`global/hooks/git-guard.sh`). La création de branche reste libre.

Pour l'autoriser une fois, écrire sous son message :

| Message | Débloque (une seule fois, 5 minutes) |
|---|---|
| `/commit` | `git add` + `git commit` |
| `/push` | `git push` |
| `/merge <branche>` | `git merge` |

Le hook `global/hooks/git-allow.sh` pose l'autorisation uniquement à la réception d'un message de l'utilisateur, donc Claude ne peut pas se l'accorder. `rebase` et `reset` restent toujours bloqués : les lancer soi-même dans un terminal.

Le blocage ne s'applique qu'aux appels de Claude, pas aux commandes tapées dans un terminal.
