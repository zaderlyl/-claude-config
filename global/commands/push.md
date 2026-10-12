---
description: Autorise Claude à pousser la branche courante (usage unique)
---

L'utilisateur autorise UN push.

1. Lance `git branch --show-current`.
2. Pousse la branche courante vers `origin` (avec `-u` si elle n'a pas encore de branche distante). Jamais de push forcé.
3. Termine par la branche poussée et le résultat. Ne merge rien.
