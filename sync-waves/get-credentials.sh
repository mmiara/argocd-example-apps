#!/bin/bash

NAMESPACE=sync-waves

while getopts "i" flag
do
    case "${flag}" in
        i) default="${NAMESPACE}" && printf "Enter the namespace in which ${NAMESPACE} is installed [${NAMESPACE}]: " && read -r NAMESPACE && : ${NAMESPACE:=$default};;
    esac
done

function sep {
  printf "=%.0s" {1..80} && printf "\n$1\n"
}

function indent {
  printf  " %.0s" {1..2} && echo "$1"
}

SYNCWAVES_URL=$(kubectl get ingress -n ${NAMESPACE} sync-waves --no-headers=true -o=custom-columns=URL:.spec.rules[0].host)

clear

# No ingress defined - testing through CLI get-credentials
sep "Sync-Waves:"
indent "URL: https://${SYNCWAVES_URL}"
indent "No Login Information Available for SyncWaves"
sep
