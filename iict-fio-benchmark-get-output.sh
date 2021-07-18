#!/bin/bash

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
DEPLOYMENT_NAME=""
cd deployments || exit
for i in *; do
  [ -f "$i" ] || break
  if [[ $i == *"$1"* ]]; then
    DEPLOYMENT_NAME=$(echo "$i" | cut --delimiter=. -f1)
    echo "$DEPLOYMENT_NAME"
  fi
done
cd ..
mkdir -p "fio-jobs-output/iict/$DEPLOYMENT_NAME"

echo "Retrieving all jobs output..."
cd docker/iict/fio-jobs || exit
for i in architecting-it-test*; do
    [ -f "$i" ] || break
    # shellcheck disable=SC2046
    kubectl --namespace=mercado cp \
    $(kubectl get pods --namespace=mercado -o=jsonpath='{.items[0].metadata.name}'):fio-jobs/"$i"-output \
    ../../../fio-jobs-output/iict/"$DEPLOYMENT_NAME"/"$i"-output
    echo "✅ $i-output"
done

echo "All jobs output retrieved."