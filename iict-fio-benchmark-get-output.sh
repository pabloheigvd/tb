#!/bin/sh

echo "Retrieving all jobs output..."
cd docker/iict/fio-jobs || exit
for i in architecting-it-test*; do
    [ -f "$i" ] || break
    # shellcheck disable=SC2046
    kubectl --namespace=mercado cp \
    $(kubectl get pods --namespace=mercado -o=jsonpath='{.items[0].metadata.name}'):/fio-jobs/"$i"-output \
    ../../../fio-jobs/iict/"$i"-output
done

echo "All jobs output retrieved."
