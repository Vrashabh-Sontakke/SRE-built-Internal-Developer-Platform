1. Sign-Up for Cast.ai: https://cast.ai
2. Obtain the Authorization Token
3. Install Cast.ai in EKS:

`curl -H "Authorization: Token [enter the token here without brackets that you got after sign-up] "https://api.cast.ai/v1/agent.yaml?provider=eks" | kubectl apply -f -`

5. Log into Cast.ai and you'll see the dashboard.
