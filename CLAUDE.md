# claude-config

Dépôt de configuration Claude Code : règles globales, permissions, hooks, agents, commandes, skills et modèles de projet.
Les règles générales (communication, initiative, Git, cycle de travail) sont dans `global/CLAUDE.md`, lié à `~/.claude/CLAUDE.md`.

## Structure
- `global/CLAUDE.md` : règles appliquées à tous les projets.
- `templates/projet/` : modèle de projet et conventions Phaser/JS.
- `scripts/` : scripts utilitaires (détection des projets ouverts dans VS Code…).
- `.claude/` : permissions, hooks, agents et commandes de ce dépôt.

## Conventions du dépôt
- Noms de fichiers et dossiers : kebab-case, minuscules, sans accents.

## À éviter
- Ne pas modifier `.claude/settings.local.json` (réglages propres à la machine).
