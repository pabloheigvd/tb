#!/bin/bash

# https://stackoverflow.com/a/14505622
cd fio-jobs || exit
for i in *.fio; do
    [ -f "$i" ] || break
    # output does not work in job mode: https://www.spinics.net/lists/fio/msg05818.html
    fio "$i" --output "$i"-output --output-format=json
done
