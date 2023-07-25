Install Sosivio using Github Actions :  [sosivio-install.yml](../../../.github/workflows/sosivio-install.yml)

OR/ Install Sosivio using Helm:
```
helm repo add sosivio https://helm.sosiv.io
```
```
helm install -n sosivio \
sosivio sosivio/sosivio \
--set platform=eks \
--create-namespace
```
Get Login Screen URL:
```
kubectl get svc -n sosivio dashboard-lb -o jsonpath='{.status.loadBalancer.ingress[0].hostname}'
```
Get OTP from kubernetes secrets:
```
kubectl get secrets/sosivio-admin-otp -n sosivio --template={{.data.password}} | base64 -d
```
The step below is not needed unless you wish to remove Sosivio and stop optimizing resources:

Uninstall Sosivio using Github Actions :  [sosivio-delete.yml](../../../.github/workflows/sosivio-delete.yml)
