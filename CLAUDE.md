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

## Règles de travail (priorité haute)
- **Comprendre avant d'agir** : si la demande est ambiguë, pose UNE question courte avant de produire. Vise la bonne réponse dès le premier prompt.
- **Économie de tokens** : réponses courtes, pas de récapitulatif inutile, ne relis pas ce que tu viens d'écrire, ne relance pas d'exploration déjà faite, pas de tableau ou de liste quand une phrase suffit.
- **Projets** : quand je cherche ou j'ouvre un projet, exécute d'abord `scripts/vscode-open.sh` (dossiers ouverts dans VS Code, le premier est la fenêtre active) et privilégie ces dossiers.
- **Branche** : au début d'un travail et avant toute opération git, lance `git branch --show-current` et dis-moi la branche. Rappelle-la dans le message final. Ne change jamais de branche sans me le dire.
- **Lancement** : à la fin de chaque travail qui crée ou modifie un projet, termine le message par la commande exacte pour le lancer, dans un bloc ```bash, avec l'URL. Garde aussi cette section « Lancer le projet » à jour dans le CLAUDE.md du projet.
- **Organisation** : utilise toujours la même structure de projet que `templates/projet/CLAUDE.md` (src/, assets/, README.md). Ne réorganise pas un projet existant sans demander.
- **Attribution** : n'ajoute jamais de mention « Co-Authored-By », « Generated with Claude » ou autre signature Claude dans les commits, merges ou PR.

## Initiative
- Ne prends aucune initiative : fais uniquement ce que je demande, quand je le demande. Pas d'extras, de refactos ou de fichiers non demandés ; propose en une ligne et attends mon accord.

## Git
- Ne lance jamais `git commit`, `git push` ou `git add` sans ma bénédiction explicite pour cette action précise.
- Par défaut, donne uniquement le titre du commit (une ligne, sans corps de message) ; c'est l'utilisateur qui commit.

## Commandes
<!-- À compléter selon le projet : build, test, lint -->
- Test : `...`
- Lint : `...`

## À éviter
- Ne pas modifier `.claude/settings.local.json` (réglages propres à la machine).
- Ne pas lancer de commandes destructrices (`rm -rf`, `git push --force`) sans demander.
