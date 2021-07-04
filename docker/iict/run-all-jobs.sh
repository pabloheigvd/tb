#!/bin/sh

# https://stackoverflow.com/a/14505622
echo "Will run all fio jobs shortly thereafter..."
cd fio-jobs || exit
fio --version
echo "Jobs to be executed:"
ls

echo "============================================"
echo "tes-raw-options raw-output"
fio --randrepeat=0 --verify=0 --ioengine=libaio --direct=1 --name=read_latency --filename=/data/fiotest --bs=4K --iodepth=4 --size=250G --readwrite=randread --time_based --ramp_time=10s --runtime=30s > "test-raw-options raw-output"

echo "test-raw-options json-output"
fio --randrepeat=0 --verify=0 --ioengine=libaio --direct=1 --name=read_latency --filename=/data/fiotest --bs=4K --iodepth=4 --size=250G --readwrite=randread --time_based --ramp_time=10s --runtime=30s --output="test-raw-options output option" --output-format=json

echo "test-file-options raw-output"
fio "architecting-it-test7-sequential-read" > "test-file-options raw-output"

echo "test-file-options json-output"
fio "architecting-it-test7-sequential-read" --output="test-file-options output option" --output-format=json
echo "============================================"

for i in *; do
    [ -f "$i" ] || break
    echo "Executing job $i..."
    # null latency with json output
    if [  "$i" = "architecting-it-test5-read-latency" ] || [ "$i" = "architecting-it-test6-write-latency" ]; then
      fio "$i" > "$i-output"
    else
      # output does not work in job mode: https://www.spinics.net/lists/fio/msg05818.html
      fio "$i" --output "$i"-output --output-format=json
    fi
done

echo "All jobs done. You can now get all the outputs:"
ls *-output
echo "Now sleeping tight..."
while true; do sleep 30s; done
