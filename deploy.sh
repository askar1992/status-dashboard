#!/usr/bin/env bash
set -e
cd "$(dirname "$0")"

if [[ ! -f index.local.html ]]; then
  echo "ERROR: index.local.html не найден"
  exit 1
fi

# Вариант B: публичная версия = копия мастера (роль определяется по hostname в JS).
# Заморозка contenteditable больше не нужна — шеф редактирует все ячейки.
cp index.local.html index.html

# Commit and push
git add index.html
if git diff --cached --quiet; then
  echo "Нет изменений в index.html — пушить нечего"
  exit 0
fi
git commit -m "Update status: $(date +%F)"
git push
echo "✓ Pushed. Деплой ~30-60с: https://askar1992.github.io/status-dashboard/"
