# Installtaion:

## Using Helm >

### Add repo

```
helm repo add karpenter https://charts.karpenter.sh/
```

### Update repo
```
helm repo update
```

### Install
```
CLUSTER_NAME="prod-eks"
CLUSTER_ENDPOINT="$(aws eks describe-cluster --name ${CLUSTER_NAME} --query "cluster.endpoint" --output text)"

helm install --namespace karpenter --create-namespace \
  karpenter karpenter/karpenter \
  --set clusterName=${CLUSTER_NAME} \
  --set clusterEndpoint=${CLUSTER_ENDPOINT} \
  --set aws.defaultInstanceProfile=KarpenterNodeInstanceProfile-${CLUSTER_NAME} \
  --wait
```