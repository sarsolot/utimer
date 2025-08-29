# Bash completion for utimer
#
# Copyright 2025 Artur Ladka <arturladka@gmail.com>
#
# This file is part of uTimer.
#
# uTimer is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

_utimer_completions()
{
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    # All available options
    opts="--timer --countdown --stopwatch --clock --verbose --quiet --quit-with-success --limits --version --help --debug"

    # Short options
    short_opts="-t -c -s -k -v -q -L -d -h"

    case ${prev} in
        --timer|-t|--countdown|-c)
            # For timer and countdown options, suggest common time patterns
            COMPREPLY=( $(compgen -W "1s 5s 10s 30s 1m 2m 5m 10m 30m 1h 2h" -- ${cur}) )
            return 0
            ;;
        --help|-h|--version|--limits|-L|--stopwatch|-s|--clock|-k|--verbose|-v|--quiet|-q|--quit-with-success|--debug|-d)
            # These options don't take arguments, so no completion
            return 0
            ;;
        *)
            ;;
    esac

    # Complete long and short options
    if [[ ${cur} == -* ]] ; then
        COMPREPLY=( $(compgen -W "${opts} ${short_opts}" -- ${cur}) )
        return 0
    fi

    # If no option context, suggest all options
    COMPREPLY=( $(compgen -W "${opts} ${short_opts}" -- ${cur}) )
}

# Register completion function
complete -F _utimer_completions utimer
