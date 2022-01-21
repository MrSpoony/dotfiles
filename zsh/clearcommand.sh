#!/bin/bash

NUMBER_OF_COMMANDS=4
RNDNR=$((RANDOM%NUMBER_OF_COMMANDS))

case $RNDNR in

    0)
        colorscript random;
        ;;
    1)
        fastfetch;
        ;;
    2)
        rxfetch;
        ;;
    3)
        pfetch;
        ;;
esac
