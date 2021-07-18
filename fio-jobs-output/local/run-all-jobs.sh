#!/bin/bash
cd jobs || exit
fio --version
echo "Jobs to be executed:"
ls
for i in *; do
    [ -f "$i" ] || break
    echo "Executing job $i..."
    # output does not work in job mode: https://www.spinics.net/lists/fio/msg05818.html
    fio "$i" --output "$i"-output --output-format=json
done

echo "All jobs done. You can now get all the outputs:"
ls *-output