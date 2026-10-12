#!/bin/bash
# Liste les dossiers actuellement ouverts dans VS Code (le premier = fenêtre active).
f="$HOME/Library/Application Support/Code/User/globalStorage/storage.json"
python3 -I - "$f" <<'PY'
import json, sys, urllib.parse
w = json.load(open(sys.argv[1])).get("windowsState", {})
wins = [w.get("lastActiveWindow", {})] + w.get("openedWindows", [])
seen = []
for x in wins:
    p = x.get("folder")
    if p and p not in seen:
        seen.append(p)
        print(urllib.parse.unquote(p.replace("file://", "")))
PY
