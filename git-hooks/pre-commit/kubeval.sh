#!/bin/bash
set -o errexit
set -o nounset
set -o pipefail 

for yaml in $(find . -name '*.yaml' -o -name '*.yml'| grep -v fleet)
do
        kubeval --skip-kinds Kustomization -s https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master  -v 1.25.11 $yaml || exit 1
done
