#!/bin/bash

mkdir -p "fio-jobs-output/aws/"

echo "Retrieving all jobs output..."
cd docker/iict/fio-jobs || exit
for i in architecting-it-test*; do
    [ -f "$i" ] || break
    # shellcheck disable=SC2046
    kubectl cp \
    $(kubectl get pods -o=jsonpath='{.items[0].metadata.name}'):fio-jobs/"$i"-output \
    ../../../fio-jobs-output/aws/"$i"-output
    echo "✅ $i-output"
done

echo "All jobs output retrieved."