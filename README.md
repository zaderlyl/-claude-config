# claude-config

Ma configuration Claude Code versionnée.

## Structure
```
CLAUDE.md            Instructions propres à ce dépôt
global/
  CLAUDE.md          Règles appliquées à tous mes projets
templates/projet/    Modèle de projet et conventions Phaser/JS
scripts/             Scripts utilitaires (VS Code, installation)
.claude/
  settings.json      Permissions et hooks
  hooks/             Scripts exécutés automatiquement
  agents/            Sous-agents spécialisés
  commands/          Slash commands personnalisées
  skills/            Workflows réutilisables
```

## Installation du CLAUDE.md global
Sur chaque machine, depuis la racine du dépôt :
```bash
scripts/install-global.sh
```
Le script lie `~/.claude/CLAUDE.md` à `global/CLAUDE.md` (un fichier existant est sauvegardé en `.bak`). Toute modification de `global/CLAUDE.md` s'applique ensuite à tous les projets.

Les chemins de `global/CLAUDE.md` vers `scripts/` et `templates/` sont absolus : le dépôt doit rester dans `~/Documents/GitHub/claude-config`.
