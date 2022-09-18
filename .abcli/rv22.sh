#! /usr/bin/env bash

function rv22() {
    RAW_Vancouver_PORTAL_2022 $@
}

function RAW_Vancouver_PORTAL_2022() {
    local task=$(abcli_unpack_keyword $1 help)

    if [ $task == "help" ] ; then
        abcli_show_usage "rv22 task_1" \
            "run rv22 task_1."

        if [ "$(abcli_keyword_is $2 verbose)" == true ] ; then
            python3 -m rv22 --help
        fi

        return
    fi

    if [ "$task" == "task_1" ] ; then
        python3 -m rv22 \
            task_1 \
            ${@:2}
        return
    fi

    abcli_log_error "-rv22: $task: command not found."
}