#!/bin/bash

set -e

kubectl exec -it yb-master-0 -n yugabyte-aws --container yb-master \
 -- /home/yugabyte/bin/yb-admin \
 --master_addresses "yb-masters.yugabyte-aws.svc.cluster.local:7100,yb-masters.yugabyte-azure.svc.cluster.local:7100,yb-masters.yugabyte-gcp.svc.cluster.local:7100,yb-masters.yugabyte-do.svc.cluster.local:7100" setup_redis_table
