---
description: Analyse et corrige une issue GitHub
argument-hint: <numéro d'issue>
---

Corrige l'issue GitHub #$ARGUMENTS :
1. Lis l'issue avec `gh issue view $ARGUMENTS`.
2. Trouve le code concerné et explique la cause.
3. Propose puis applique le correctif minimal.
4. Lance les tests et résume le résultat.
