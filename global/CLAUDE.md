# Règles globales

## Communication
- Réponds en français, de façon concise et directe.
- Recommande une option plutôt que de lister toutes les possibilités.
- Dis clairement quand quelque chose a échoué ou n'a pas été vérifié.
- Économie de tokens : réponses courtes, pas de récapitulatif inutile, ne relance pas d'exploration déjà faite, une phrase plutôt qu'un tableau quand ça suffit.

## Initiative
- Ne prends aucune initiative : fais uniquement ce que je demande, quand je le demande. Pas d'extras, de refactos ou de fichiers non demandés ; propose en une ligne et attends mon accord.
- Si la demande est ambiguë, pose UNE question courte avant de produire. Vise la bonne réponse dès le premier prompt.

## Projets
- Quand je cherche ou j'ouvre un projet, exécute d'abord `/Users/liliancornet/Documents/GitHub/claude-config/scripts/vscode-open.sh` (dossiers ouverts dans VS Code, le premier est la fenêtre active) et privilégie ces dossiers.
- Utilise la même structure de projet que `/Users/liliancornet/Documents/GitHub/claude-config/templates/projet/CLAUDE.md` (src/, assets/, README.md). Ne réorganise pas un projet existant sans demander.
- À la fin de chaque travail qui crée ou modifie un projet, termine par la commande exacte pour le lancer, dans un bloc ```bash, avec l'URL. Garde la section « Lancer le projet » du CLAUDE.md du projet à jour.

## Cycle de travail d'une fonctionnalité
1. **Réflexion d'abord** : on discute de toute la fonctionnalité par questions/réponses, avant d'écrire du code.
2. **Plan d'attaque** : étapes courtes, validées par moi.
3. **Une étape = un commit.** On avance étape par étape.
4. **Fin** : on merge dans `main`, puis on recommence pour la fonctionnalité suivante.
Une branche par fonctionnalité ; jamais de code directement sur `main`.

## Git
- Au début d'un travail et avant toute opération git, lance `git branch --show-current` et dis-moi la branche. Rappelle-la dans le message final. Ne change jamais de branche sans me le dire.
- Ne lance jamais `git commit`, `git push`, `git add` ni `git merge` sans ma bénédiction explicite pour cette action précise.
- Par défaut, donne uniquement le titre du commit (une ligne, sans corps de message) ; c'est moi qui commit.
- N'ajoute jamais de mention « Co-Authored-By », « Generated with Claude » ou autre signature Claude dans les commits, merges ou PR.
- Ne lance pas de commandes destructrices (suppression récursive, push forcé) sans demander.

### Branches
| Préfixe | Usage | Exemple |
|---|---|---|
| `main` | Toujours jouable, on n'y code jamais directement | |
| `feature/<nom>` | Une fonctionnalité | `feature/deplacement-joueur` |
| `fix/<nom>` | Correction d'un bug | `fix/collision-miroir` |
| `assets/<nom>` | Sprites, sons, maps | `assets/sprites-monde-3` |
| `refactor/<nom>` | Réorganiser sans changer le comportement | `refactor/constantes` |
| `docs/<nom>` | Documentation, GDD, journal, conventions | `docs/audit-conventions` |

### Commits
Format : `type: Message en français` (type collé au `:`, pas d'espace avant, un espace après).

| Type | Usage | Exemple |
|---|---|---|
| `feat` | Nouvelle fonctionnalité | `feat: Ajoute la téléportation par les miroirs` |
| `fix` | Correction d'un bug (quelque chose était cassé) | `fix: Corrige le joueur bloqué dans les murs` |
| `assets` | Sprites, sons, maps | `assets: Ajoute les sprites du joueur 1` |
| `docs` | Documentation, GDD, journal | `docs: Met à jour le journal du jour` |
| `refactor` | Réorganiser sans changer le comportement | `refactor: Déplace les touches dans InputManager` |
| `style` | Mise en forme uniquement | `style: Corrige l'indentation de HubScene` |
| `chore` | Configuration, outillage | `chore: Ajoute la config VS Code` |

- Le type correspond au préfixe de la branche : `feature/` → `feat:`, `fix/` → `fix:`, `assets/` → `assets:`, `refactor/` → `refactor:`, `docs/` → `docs:`.
- `fix` sert uniquement à corriger un bug ; ajouter du nouveau, c'est `feat`.
- Un commit = une idée, message précis (jamais « modifs » ou « fix »).
- Ne jamais committer de clés API, tokens ou chemins personnels sensibles.
