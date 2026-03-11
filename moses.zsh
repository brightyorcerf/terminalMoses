# --- TerminalMoses Config --- 
MOSES_STAFF="green"  
MOSES_PLAGUE="red"   

preexec() { 
    print -P "\n%F{$MOSES_STAFF}┏━ %D{%H:%M:%S} ━━━━━━━━━━━━━━━━━━━━━━━%f"
    print -P "%F{$MOSES_STAFF}┃%f %F{white}EXECUTING:%f %B$1%b"
}

precmd() {
    local EXIT_CODE=$?
    local COL=$MOSES_STAFF
    [[ $EXIT_CODE -ne 0 ]] && COL=$MOSES_PLAGUE
    print -P "%F{$COL}┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━%f\n"
} 
alias part='echo "Search (Cmd+F) for: ┏━"'