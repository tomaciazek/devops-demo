#!/bin/bash
mkdir -p k8s/.ignore
cat k8s/values.yaml | envsubst  > "k8s/.ignore/values.yaml"
