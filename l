#!/usr/bin/env bash
# Avorah: make Codex visible to Sesame Link on this PC. Safe to run twice.
set -u
say(){ printf '\n== %s\n' "$*"; }

# 1) Node + npm in user space if missing (no sudo needed)
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
if ! command -v npm >/dev/null 2>&1; then
  say "Installing Node (one time)"
  curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.1/install.sh | bash >/dev/null 2>&1
  . "$NVM_DIR/nvm.sh"
  nvm install --lts >/dev/null 2>&1
fi

# 2) Codex CLI inside Ubuntu (Windows Codex app is invisible to Sesame Link)
mkdir -p "$HOME/.local/bin"
export PATH="$HOME/.local/bin:$PATH"
grep -q 'local/bin' "$HOME/.profile" 2>/dev/null || echo 'export PATH="$HOME/.local/bin:$PATH"' >> "$HOME/.profile"
CX=$(command -v codex || true)
case "$CX" in /mnt/*|"") CX="";; esac
if [ -z "$CX" ]; then
  say "Installing Codex in Ubuntu"
  if [ -n "${NVM_BIN:-}" ]; then npm install -g @openai/codex >/dev/null 2>&1
  else npm install -g --prefix "$HOME/.local" @openai/codex >/dev/null 2>&1; fi
  hash -r
fi
if ! command -v codex >/dev/null 2>&1; then say "STUCK: Codex didn't install. Tell Maya 'stuck at codex install'."; exit 1; fi
ln -sf "$(command -v codex)" "$HOME/.local/bin/codex" 2>/dev/null || true

# 3) Sign in if needed (device code works from your phone too)
if ! codex login status >/dev/null 2>&1; then
  say "Sign in to Codex: open the link below (phone is fine) and enter the code"
  codex login --device-auth || codex login
fi

# 4) Restart Sesame Link so it sees Codex
say "Restarting Sesame Link"
sesame-link stop >/dev/null 2>&1 || pkill -f sesame-link >/dev/null 2>&1 || true
sleep 2
sesame-link start
say "DONE. Leave this window open. Maya checks from her side; no need to send her anything."
