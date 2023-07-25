## Installation ##

Using GitHub Actions:  [gatekeeper-install-eks.yml](../../../../.github/workflows/gatekeeper-install-eks.yml)

Using Helm: 
```
helm repo add gatekeeper https://open-policy-agent.github.io/gatekeeper/charts
```
```
helm install gatekeeper/gatekeeper --name-template=gatekeeper --namespace gatekeeper-system --create-namespace
```