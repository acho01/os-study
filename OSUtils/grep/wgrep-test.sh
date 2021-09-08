#! /bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NONE='\033[0m'

run_test () {
    local test_num=$1
    local search_word=$2
    GREP_ARGS=" $search_word"
    for (( i=1; i<=$test_num; i++ ))
    do  
        GREP_ARGS="${GREP_ARGS} test_files/test$i.txt"
    done
    GREP_RES="$(grep$GREP_ARGS)"
    WGREP_RES="$(./wgrep$GREP_ARGS)"

    if [ "$GREP_RES" = "$WGREP_RES" ]; then
        echo -e "test $test_num: ${GREEN}passed${NONE}"
    else
        echo -e "test $test_num: ${RED}failed${NONE}"
        echo "WGREP: $WGREP_RES"
        echo "GREP: $GREP_RES"
    fi
    
    return 
}

words=("bla" "ss" "d")
for (( c=1; c<=3; c++ ))
do  
    run_test $c "${words[c-1]}"
done
