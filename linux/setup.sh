#Github aliases
while getopts ":g" var; do
    case "${var}" in
        s)
            echo "Enabling  "
            ;;
        *)
            echo "error"
            exit 1;
            ;;
    esac
done

setupGithubAliases() {
    if ! [ -x command -v git]
    then
        printf "Git is not installed on this machine or current user does not have permission to execute."
    else
        git --global alias.ac "!f(){git add -A && git commit -m ${1}};f;"
}