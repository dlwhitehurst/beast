#!/bin/bash
# A Kubernetes Namespace finalizer 
###################################

if [[ "$1" == "--help" ]]; then
    cat <<'ENDHELP'
Usage: finalizer.sh <namespace>

ENDHELP
  exit
fi

###################################


( set -e
  namespace=$1
  kubectl get namespace "$1" -o json   | tr -d "\n" | sed "s/\"finalizers\": \[[^]]\+\]/\"finalizers\": []/"   | kubectl replace --raw /api/v1/namespaces/$1/finalize -f -
  echo "Namespace $1 has now been finalized."

)
