---
description: Autorise Claude à committer l'étape en cours (usage unique)
argument-hint: [titre du commit, sinon celui déjà proposé]
---

L'utilisateur autorise UN commit.

1. Lance `git branch --show-current` et `git status -sb`.
2. Ajoute uniquement les fichiers de l'étape en cours (jamais de fichiers non liés).
3. Commite avec le titre : `$ARGUMENTS` s'il est fourni, sinon le dernier titre de commit que tu as proposé dans la conversation. Une seule ligne, pas de corps, aucune signature.
4. Termine par la branche et le hash du commit. Ne pousse pas.

Si aucun titre n'est disponible, demande-le au lieu d'en inventer un.
