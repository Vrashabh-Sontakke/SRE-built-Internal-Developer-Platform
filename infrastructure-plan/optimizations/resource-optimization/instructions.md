Install Sosivio using Github Actions :  [sosivio-install.yml](../../../.github/workflows/sosivio-install.yml)

Get OTP form kubernetes secrets:
```
kubectl get secrets/sosivio-admin-otp -n sosivio --template={{.data.password}} | base64 -d
```
The step below is not needed unless you wish to remove Sosivio and stop optimizing resources:

Uninstall Sosivio using Github Actions :  [sosivio-delete.yml](../../../.github/workflows/sosivio-delete.yml)
