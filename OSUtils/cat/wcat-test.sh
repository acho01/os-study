#! /bin/bash

GREEN='\033[0;32m'
RED='\033[0;31m'
NONE='\033[0m'

run_test () {
    local test_num=$1
    
    CAT_ARGS=""
    for (( i=1; i<=$test_num; i++ ))
    do  
        CAT_ARGS="${CAT_ARGS} test_files/test$i.txt"
    done
    
    CAT_RES="$(cat$CAT_ARGS)"
    WCAT_RES="$(./wcat$CAT_ARGS)"
    if [ "$CAT_RES" = "$WCAT_RES" ]; then
        echo -e "test $test_num: ${GREEN}passed${NONE}"
    else
        echo -e "test $test_num: ${RED}failed${NONE}"
        echo "WCAT: $WCAT_RES"
        echo "CAT: $CAT_RES"
    fi
    
    return 
}

for (( c=1; c<=4; c++ ))
do  
    run_test $c
done
