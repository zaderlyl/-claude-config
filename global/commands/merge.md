---
description: Autorise Claude à merger une branche dans la branche courante (usage unique)
argument-hint: <branche à merger>
---

L'utilisateur autorise UN merge.

1. Lance `git branch --show-current` et dis-moi dans quelle branche le merge va se faire.
2. Merge la branche `$ARGUMENTS` dans la branche courante. Si aucun argument n'est fourni, demande quelle branche merger au lieu de deviner.
3. En cas de conflit, arrête-toi et explique-le sans le résoudre sans mon accord.
4. Termine par la branche courante et le résultat. Ne pousse pas.
