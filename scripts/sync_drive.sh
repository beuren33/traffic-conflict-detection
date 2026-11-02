#!/usr/bin/env bash
# Sincroniza o projeto com a pasta do Drive via rclone (incremental).
# Uso: scripts/sync_drive.sh push|pull [--apply] [-- extra rclone flags]
# Padrão é dry-run; --apply executa de verdade. Configurar antes: `rclone config`.
set -euo pipefail

REMOTE="${RCLONE_REMOTE:-gdrive}"
DRIVE_DIR="${DRIVE_DIR:-deteccao_acidente}"
LOCAL_DIR="$(cd "$(dirname "$0")/.." && pwd)"

mode="${1:-}"
shift || true
apply=0
extra=()
for a in "$@"; do
  case "$a" in
    --apply) apply=1 ;;
    --dry-run) ;;
    *) extra+=("$a") ;;
  esac
done

flags=(--progress --exclude ".git/**" --exclude "__pycache__/**" --exclude ".venv/**")
[ "$apply" -eq 0 ] && flags+=(--dry-run)

case "$mode" in
  push) rclone copy "$LOCAL_DIR" "$REMOTE:$DRIVE_DIR" "${flags[@]}" "${extra[@]}" ;;
  pull) rclone copy "$REMOTE:$DRIVE_DIR" "$LOCAL_DIR" "${flags[@]}" "${extra[@]}" ;;
  *) echo "uso: $0 push|pull [--apply]" >&2; exit 1 ;;
esac
