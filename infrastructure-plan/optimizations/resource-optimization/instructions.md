Install Sosivio using Github Actions :  [sosivio-install.yml](../../../.github/workflows/sosivio-install.yml)

Get OTP form kubernetes secrets: 'kubectl get secrets/sosivio-admin-otp -n sosivio --template={{.data.password}} | base64 -d'

Uninstall Sosivio using Github Actions :  [sosivio-delete.yml](../../../.github/workflows/sosivio-delete.yml)