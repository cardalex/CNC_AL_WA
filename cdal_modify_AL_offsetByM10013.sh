#!/bin/bash

if [ "$1" != "" ]; then
    echo "Input file : $1"
else
    echo "File Input not given: exit."
    exit;
fi


if test -f "$1"; then
    echo "$1 is going to be parsed."

    echo "Output file is $1\_cdal"
else
    echo "File Input does not exist: exit."
    exit;
fi

sed 's/G31 Z-1 F100/M10013/g' $1 > $1\_cdal_1

sed 's/G0 X0 Y0 Z20/G0 Z20\nG0 X0 Y0/g' $1\_cdal_1 > $1\_cdal_2

sed '/G31 Z-1 F50/,+1d' $1\_cdal_2 > $1\_cdal 


rm $1\_cdal_2 $1\_cdal_1

