# Common aliases
alias ll='ls -lh'
alias la='ls -lha'
alias l='ls -CF'
alias em='emacs -nw'
alias dd='dd status=progress'
alias _='sudo'
alias _i='sudo -i'

# Convienence 
alias rev='nc -lvp 9001'
alias http='python3 -m http.server 8000'

# Crack Map Exec Backwards Compatibility
crackmapexec_alias_func() {
    cme "$@"
}

alias crackmapexec='crackmapexec_alias_func'

# Help people find 7z2john
7z2john_alias_func() {
    7z2john.pl "$@"
}

alias 7z2john='7z2john_alias_func'

# Help people find enum4linux-ng
enum4linux_ng_alias_func() {
    enum4linux-ng "$@"
}

alias enum4linux='enum4linux_ng_alias_func'

# Help people find things
find_string_alias_func() {
    if [ -z "$1" ]; then
        echo "Searches for a string in all files in a directory"
        echo "Usage: find_string <directory> <string>"
        return
    fi
    find $1 -name '*' -exec grep -i "$2" {} \; -print 2>/dev/null
}

alias find_string='find_string_alias_func'

# --- Custom Functions  ---
mkproject() {
    if [ -z "$1" ]; then
        echo "Usage: mkproject <project_name>"
        return 1
    fi

    mkdir -p "$1" && cd "$1" || return
    mkdir -p ./logs ./scans ./scope ./tools ./evidence/{credentials,data,screenshots}
    echo "Project '$1' created and ready!"
}

gqsave() {
    local msg
    local timestamp
    timestamp="$(date '+%Y-%m-%d %H:%M:%S')"

    if [ $# -gt 0 ]; then
        msg="quick save: $* :$timestamp"
    else
        msg="quick save: $timestamp"
    fi

    git add -A &&
    git commit -m "$msg" &&
    git push -u origin
}

cpprofile () {
	
	cp ~/.bash_aliases /Users/karthish/Desktop/Repos/Private/dot_files/.bash_aliases
	cp ~/.zshrc /Users/karthish/Desktop/Repos/Private/dot_files/.zshrc
}


#  --- NON ZSH updates ---
#git config --global alias.qsave '!git add -A && git commit -m "quick save: $(date '+%Y-%m-%d %H:%M:%S')" && git push -u origin main'
