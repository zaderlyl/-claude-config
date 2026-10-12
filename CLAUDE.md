# Contexte du projet

Dépôt de configuration Claude Code : instructions, permissions, hooks, agents, commandes et skills réutilisables.

## Préférences de communication
- Réponds en français, de façon concise et directe.
- Recommande une option plutôt que de lister toutes les possibilités.
- Dis clairement quand quelque chose a échoué ou n'a pas été vérifié.

## Conventions
- Noms de fichiers et dossiers : kebab-case, minuscules, sans accents.
- Commits courts, à l'impératif (ex. `Ajoute le hook de formatage`).
- Ne jamais committer de clés API, tokens ou chemins personnels sensibles.

## Git
- Ne jamais lancer `git commit`, `git push` ou `git add` toi-même.
- Quand des changements sont prêts, donne uniquement le titre du commit (une ligne, sans corps de message) ; c'est l'utilisateur qui commit.

## Commandes
<!-- À compléter selon le projet : build, test, lint -->
- Test : `...`
- Lint : `...`

## À éviter
- Ne pas modifier `.claude/settings.local.json` (réglages propres à la machine).
- Ne pas lancer de commandes destructrices (`rm -rf`, `git push --force`) sans demander.
