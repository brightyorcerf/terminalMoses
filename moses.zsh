# --- TerminalMoses Config --- 
MOSES_STAFF="green"  
MOSES_PLAGUE="red"    
MOSES_MODE="full"

autoload -Uz add-zsh-hook

_moses_preexec() {
  _MOSES_CMD_RAN=1
  _MOSES_START_TIME=$SECONDS
  if [[ "$MOSES_MODE" == "minimal" ]]; then
    print -P -n "%F{$MOSES_STAFF}┃%f "
    print -r -- "$1"
  else
    print -P "\n%F{$MOSES_STAFF}┏━ %D{%H:%M:%S} ━━━━━━━━━━━━━━━━━━━━━━━%f"
    print -P -n "%F{$MOSES_STAFF}┃%f %F{white}EXECUTING:%f "
    print -r -- "$1"
  fi
}

_moses_precmd() {
  local EXIT_CODE=$?
  [[ -z $_MOSES_CMD_RAN ]] && return
  _MOSES_CMD_RAN=0
  local COL=$MOSES_STAFF
  [[ $EXIT_CODE -ne 0 ]] && COL=$MOSES_PLAGUE
  
  local DURATION=$(( SECONDS - _MOSES_START_TIME ))
  local STATUS_STR="success"
  [[ $EXIT_CODE -ne 0 ]] && STATUS_STR="failed ($EXIT_CODE)"

  if [[ "$MOSES_MODE" == "minimal" ]]; then
    print -P "%F{$COL}┗ $EXIT_CODE%f\n"
  else
    print -P "%F{$COL}┗━ $STATUS_STR (${DURATION}s) [cmd #%h]%f\n"
  fi
}

if [[ -z "$MOSES_LOADED" ]]; then
  export MOSES_LOADED=1
  add-zsh-hook precmd _moses_precmd
  add-zsh-hook preexec _moses_preexec
fi

moses-help() {
  echo "⚓ TerminalMoses Tips:"
  echo "  - Change colors: Edit MOSES_STAFF and MOSES_PLAGUE in ~/moses.zsh"
  echo "  - Minimal mode: Set MOSES_MODE=\"minimal\" in ~/moses.zsh"
  echo "  - Search (Cmd+F) for: ┏━ or ┗━"
}

alias part='moses-help'