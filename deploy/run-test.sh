#!/usr/bin/env sh
#docker run -it --rm christianwoehrle/postgres-validator -env URL_MASTER=ce-postgres -env URL_REPLICA=ce-postgres-repl

NAMESPACE="${NAMESPACE:-monitoring}"

kubectl delete -n ${NAMESPACE} -f test.yaml 2> /dev/null
kubectl apply  -n ${NAMESPACE} -f test.yaml

echo "echo show logs in a second, exist with ctrl-c"
sleep 1
echo "."
sleep 1
echo "."
sleep 1
echo "."
sleep 1
echo "."
sleep 1
echo "."
sleep 1
echo "=================="
kubectl logs -f -ljob-name=grafnaostgres-test-${POSTGRES_DB_NAME} --all-containers=true


