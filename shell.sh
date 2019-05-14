#!/bin/sh
# -*- mode: sh; -*-
# vim: set filetype=sh :
set -u # no uninitialized
set -e # exit on error ( use "|| true" or wrap in "set +e" "set -e" to block )
set -o pipefail # also exit if error in piped command -- must disable for acceptable errors
IFS=$(printf '\n\t') # spaces don't split items
bindir=$(cd $(dirname "$0") && pwd)

usage () {
    cat <<_USAGE
This program does ...

_USAGE
}

onexit () {
    : # necessary cleanup steps
}
trap onexit EXIT

main() {
    # option parsing
    while getopts "h" opt; do
        case $opt in
            h)
                usage >&2
                exit 0
            ;;
        esac
    done
    shift $((OPTIND-1))


    # iterate through all command-line parameters
    if [ -z "$1" ]; then
        files='-'
    else
        files="$*"
    fi

    for f in $files; do
        [ '-' = "$f" ] && f=/dev/stdin  # substitute stdin for missing args or -
        :  # process files here
    done
}

main "$@"
