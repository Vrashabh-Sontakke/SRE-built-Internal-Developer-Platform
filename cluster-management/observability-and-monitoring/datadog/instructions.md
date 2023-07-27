# Installtaion:

## Using Helm >

### Add repo

```
helm repo add datadog https://helm.datadoghq.com
```

### Update repo
```
helm repo update
```

### Install
```
CLUSTER_NAME='prodEKS'
API_KEY=''

helm install datadog -n datadog \
--set datadog.site='datadoghq.com' \
--set datadog.clusterName=$CLUSTER_NAME \
--set datadog.clusterAgent.replicas='2' \
--set datadog.clusterAgent.createPodDisruptionBudget='true' \
--set datadog.kubeStateMetricsEnabled=true \
--set datadog.kubeStateMetricsCore.enabled=true \
--set datadog.logs.enabled=true \
--set datadog.logs.containerCollectAll=true \
--set datadog.apiKey=$API_KEY \
--set datadog.processAgent.enabled=true \
--set targetSystem='linux' \
datadog/datadog --create-namespace
```