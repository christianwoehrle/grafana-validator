#!/usr/bin/env sh
#docker run -it --rm christianwoehrle/postgres-validator -env URL_MASTER=ce-postgres -env URL_REPLICA=ce-postgres-repl

export POSTGRES_DB_NAME="${POSTGRES_DB_NAME:-ce-postgres}"
NAMESPACE="${NAMESPACE:-microservice-ce}"

envsubst < test.yaml  | kubectl delete -n ${NAMESPACE} -f -
#   2> /dev/null
envsubst < test.yaml  | kubectl apply  -n ${NAMESPACE} -f -

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
kubectl logs -f -ljob-name=postgres-test-${POSTGRES_DB_NAME} --all-containers=true


