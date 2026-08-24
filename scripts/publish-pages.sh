#!/usr/bin/env bash
# Copy HEAD:web onto the gh-pages branch (repo root) and push.
# GitHub Pages is: Deploy from a branch → gh-pages → /(root).
# Pushing main alone does not update https://florentinhortopan.github.io/Kanarin/
set -euo pipefail

root="$(git rev-parse --show-toplevel)"
cd "$root"

if ! git show-ref --verify --quiet refs/heads/gh-pages && \
   ! git show-ref --verify --quiet refs/remotes/origin/gh-pages; then
  echo "No gh-pages branch. Create it once, then re-run." >&2
  exit 1
fi

git fetch origin gh-pages 2>/dev/null || true

work="$(mktemp -d)"
cleanup() {
  git -C "$root" worktree remove --force "$work" 2>/dev/null || rm -rf "$work"
}
trap cleanup EXIT

git worktree add "$work" gh-pages
find "$work" -mindepth 1 -maxdepth 1 ! -name .git -exec rm -rf {} +
git archive HEAD:web | tar -x -C "$work"

git -C "$work" add -A
if git -C "$work" diff --cached --quiet; then
  echo "gh-pages already matches web/ at $(git rev-parse --short HEAD)."
  exit 0
fi

msg="$(git log -1 --format=%s)"
git -C "$work" commit -m "$msg"
git -C "$work" push origin gh-pages
echo "Published web/ to gh-pages ($(git -C "$work" rev-parse --short HEAD))."
echo "https://florentinhortopan.github.io/Kanarin/"
