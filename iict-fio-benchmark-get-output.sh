#!/bin/sh

while getopts ":h" option; do
   case $option in
      h) # display Help
         echo "Retrieves output from IICT cluster from singular pod in namespace \"mercado\""
         echo ""
         echo "Usage:"
         echo "  ./iict-fio-benchmark-get-output.sh [-h] <Index of deployment (** format preferred)>"
         exit;;
      *)
   esac
done

if [ "$#" -eq "0" ]; then
    echo "Please, provide the configuration number of the deployment to test on IICT cluster. Exiting..."
    exit 1
fi

mkdir -p "fio-jobs-output/iict/deployment-$1-???"

echo "Retrieving all jobs output..."
cd docker/iict/fio-jobs || exit


kubectl --namespace=mercado cp \
    $(kubectl get pods --namespace=mercado -o=jsonpath='{.items[0].metadata.name}'):fio-jobs/"test-raw-options raw-output" \
    ../../../fio-jobs-output/iict/deployment-$1-???/"test-raw-options raw-output"

kubectl --namespace=mercado cp \
    $(kubectl get pods --namespace=mercado -o=jsonpath='{.items[0].metadata.name}'):fio-jobs/"test-raw-options json-output" \
    ../../../fio-jobs-output/iict/deployment-$1-???/"test-raw-options json-output"

kubectl --namespace=mercado cp \
    $(kubectl get pods --namespace=mercado -o=jsonpath='{.items[0].metadata.name}'):fio-jobs/"test-file-options raw-output" \
    ../../../fio-jobs-output/iict/deployment-$1-???/"test-file-options raw-output"

kubectl --namespace=mercado cp \
    $(kubectl get pods --namespace=mercado -o=jsonpath='{.items[0].metadata.name}'):fio-jobs/"test-file-options json-output" \
    ../../../fio-jobs-output/iict/deployment-$1-???/"test-file-options json-output"

for i in architecting-it-test*; do
    [ -f "$i" ] || break
    # shellcheck disable=SC2046
    kubectl --namespace=mercado cp \
    $(kubectl get pods --namespace=mercado -o=jsonpath='{.items[0].metadata.name}'):fio-jobs/"$i"-output \
    ../../../fio-jobs-output/iict/deployment-$1-???/"$i"-output
    echo "✅ $i-output"
done

echo "All jobs output retrieved."