# Installtaion:

## Using Helm >

### Repo Add

  

```

helm repo add istio https://istio-release.storage.googleapis.com/charts

```

  

### CRD Install

```

helm install istio-base istio/base \

-n istio-system \

--create-namespace

```

  

### Istio Install

```

helm install istiod istio/istiod \

-n istio-system

```

## OR/ Deploy using ArgoCD / Github Actions :

#### ArgoCD : [istio.yml](./istio.yml)
#### GitHub Actions : [istio-install-argocd.yml](../../../.github/workflows/istio-install-argocd.yml)

# Optional :

### Gateway

```

helm install istio-ingress istio/gateway -n istio-system

```

  

### Mesh The Namespace

  

```

kubectl label namespace sock-shop istio-injection=enabled --overwrite

```

  

### Install Kiali Dashboard

  

```
kubectl apply -f https://raw.githubusercontent.com/istio/istio/release-1.18/samples/addons/kiali.yaml
```