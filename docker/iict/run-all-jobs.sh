#!/bin/sh

# https://stackoverflow.com/a/14505622
echo "Will run all fio jobs shortly thereafter..."
cd fio-jobs || exit
echo "Jobs to be executed:"
ls
for i in *.fio; do
    [ -f "$i" ] || break
    # output does not work in job mode: https://www.spinics.net/lists/fio/msg05818.html
    fio "$i" --output "$i"-output --output-format=json
done

echo "All jobs done"
