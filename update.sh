#!/bin/bash

helm package charts/dup-backup

helm repo index --url "https://timdawson264.github.io/helm-charts" --merge index.yaml .
