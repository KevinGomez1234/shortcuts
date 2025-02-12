#!/bin/bash
#Github aliases
setupGithubAliases() {
    if [ -x "$(command -v git)" ]; 
    then        
        printf 'Setting up Github aliases...\n'
        printf "git ac <message> adds all files and commits them.\n"
        git config --global alias.ac '!f() { git add -A && git commit -m "$1"; }; f'
        printf "git editcommit <message> edits the previous commit message. You can also add staged \n"
        git config --global alias.editcommit '!f() { if [ ! -z "$1" ] ; then git commit --amend -m $1; else git commit --amend --no-edit; fi }; f'
    else
        printf 'Git is not installed on this machine or current user [%s] does not have permission to execute...\n' "$(whoami)"
    fi
}
# Remember that aliases are session based. Will need to recreate these in a different session or add to .bashrc.
setupShellAliases() {
    printf "Placeholder.\n";
}
while getopts "gs" var; do
    case "${var}" in
        g)
            setupGithubAliases
            ;;
        s)
            setupShellAliases
            ;;
        *)
            exit 1;
            ;;
    esac
done