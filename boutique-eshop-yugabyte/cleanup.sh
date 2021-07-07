#!/bin/bash

set -e

kubectl delete ns yugabyte-aws yugabyte-azure yugabyte-gcp yugabyte-do boutique
