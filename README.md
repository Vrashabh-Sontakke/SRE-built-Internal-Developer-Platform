# SRE-Built Internal Developer Platform Documentation

## Table of Contents
1. [Introduction](#introduction)
   - 1.1 [Project Overview](#project-overview)
   - 1.2 [Project Scope](#project-scope)
   - 1.3 [Project Goals](#project-goals)
   - 1.4 [Project Technologies and Tools](#project-technologies-and-tools)
2. [Infrastructure Plan](#infrastructure-plan)
   - 2.1 [AWS and Terraform](#aws-and-terraform)
   - 2.2 [Kubernetes (EKS)](#kubernetes-eks)
   - 2.3 [ArgoCD](#argocd-1)
   - 2.4 [Kustomize](#kustomize)
   - 2.5 [Cost & Resource Optimization](#cost-resource-optimization)
   - 2.6 [Vault (HA)](#vault-ha)
3. [Cluster Management](#cluster-management)
   - 3.1 [ArgoCD](#argocd-2)
   - 3.2 [Helm](#helm)
   - 3.3 [GitHub Actions](#github-actions)
   - 3.4 [Kubernetes Upgrades](#kubernetes-upgrades)
   - 3.5 [Open Policy Agent (OPA)](#open-policy-agent-opa)
   - 3.6 [Istio Service Mesh](#istio-service-mesh)
   - 3.7 [Karpenter Cluster Autoscaling](#karpenter-cluster-autoscaling)
   - 3.8 [Application Autoscaling (Horizontal / Vertical)](#application-autoscaling)
   - 3.9 [Network Policies](#network-policies)
   - 3.10 [Backups](#backups)
   - 3.11 [Security Scanning](#security-scanning)
   - 3.12 [Monitoring and Observability with DataDog](#monitoring-observability-datadog)
4. [Deployment Workflows](#deployment-workflows)
   - 4.1 [GitHub Actions for Infrastructure Provisioning](#github-actions-infrastructure-provisioning)
   - 4.2 [GitHub Actions for Cluster Management](#github-actions-cluster-management)
5. [Conclusion](#conclusion)

# QuickStart >>> [IDP Manual](./manual.md)

## 1. Introduction <a name="introduction"></a>

### 1.1 Project Overview <a name="project-overview"></a>
The SRE-Built Internal Developer Platform (IDP) is a cutting-edge infrastructure and cluster management platform designed and implemented from the knowledge and perspective of an SRE (Site Reliability Engineer) to empower developers and developer-self-service within an organization. The platform is built with a "git as the only source of truth" concept while also utilizing GitHub itself as the user interface. It enables seamless deployment and management of AWS-based infrastructure, Kubernetes clusters, and various services using a combination of AWS, Terraform, Kubernetes (EKS), Kustomize, ArgoCD, Helm, and other powerful tools and optimizations.

### 1.2 Project Scope <a name="project-scope"></a>
The scope of the SRE-Built Internal Developer Platform spans two main sections: "Infrastructure Plan" and "Cluster Management." The first half of the project focuses on setting up the underlying AWS infrastructure using Terraform and EKS for Kubernetes. The second half concentrates on the management of Kubernetes clusters, application deployments, autoscaling, network policies, security scanning, monitoring, and observability.

### 1.3 Project Goals <a name="project-goals"></a>
The primary objectives of the SRE-Built Internal Developer Platform are:
- Provide a seamless and self-service experience for end-users (e.g. developers) to deploy and manage their applications.
- Ensure infrastructure scalability and cost optimization using best practices.
- Implement robust security measures, including access control and scanning mechanisms.
- Establish reliable monitoring and observability to identify and address issues proactively.
- Enable automated application deployment using GitOps principles.
- Facilitate autoscaling of both infrastructure and applications to handle varying workloads efficiently.

### 1.4 Project Technologies and Tools <a name="project-technologies-and-tools"></a>
The SRE-Built Internal Developer Platform leverages the following technologies and tools to achieve its goals:
- AWS for cloud infrastructure and services
- Terraform for infrastructure provisioning and management
- Kubernetes (EKS) for container orchestration
- Kustomize for customizing Kubernetes resources
- Cost & Resource Optimization techniques to manage expenses effectively
- Vault (HA) for securing and managing secrets
- ArgoCD for GitOps-based application deployment
- Helm for Kubernetes package management
- GitHub Actions for workflow automation and CI/CD
- Kubernetes Upgrades to ensure cluster security and stability
- Open Policy Agent (OPA) for policy enforcement
- Istio Service Mesh for advanced microservices networking and security
- Karpenter Cluster Autoscaling for automatic cluster scaling
- Application Autoscaling for horizontal and vertical scaling of applications
- Network Policies for granular control over communication between services
- Backups for data protection and disaster recovery
- Security Scanning for vulnerability assessment and compliance checks
- DataDog for comprehensive monitoring and observability

## 2. Infrastructure Plan <a name="infrastructure-plan"></a>

### 2.1 AWS and Terraform <a name="aws-and-terraform"></a>
The infrastructure plan involves setting up the required AWS resources using Terraform. It includes provisioning virtual private clouds (VPCs), Private and Public Subnets, Internet Gateways, Route Tables, and other essential infrastructure components.

### 2.2 Kubernetes (EKS) <a name="kubernetes-eks"></a>
Kubernetes is deployed on the AWS cloud using Elastic Kubernetes Service (EKS) to provide a scalable and managed Kubernetes environment for running containerized applications.

### 2.3 ArgoCD <a name="argocd-1"></a>
ArgoCD is the core tool for GitOps-based continuous deployment. It helps to manage applications and configuration changes in the Kubernetes clusters by leveraging Git repositories as the source of truth.

### 2.4 Kustomize <a name="kustomize"></a>
Kustomize is used to customize Kubernetes manifests and configurations to tailor them to specific environments and requirements.

### 2.5 Cost & Resource Optimization <a name="cost-resource-optimization"></a>
To optimize costs and resources, the platform follows best practices like right-sizing instances, leveraging spot instances, and employing auto-scaling policies to adapt to varying workloads efficiently.

### 2.6 Vault (HA) <a name="vault-ha"></a>
Vault is utilized in a highly available (HA) configuration to securely manage and store sensitive information such as credentials, certificates, and tokens.

## 3. Cluster Management <a name="cluster-management"></a>

### 3.1 ArgoCD <a name="argocd-2"></a>
ArgoCD is the core tool for GitOps-based continuous deployment. It helps to manage applications and configuration changes in the Kubernetes clusters by leveraging Git repositories as the source of truth.

### 3.2 Helm <a name="helm"></a>
Helm is used to package, version, and deploy applications on Kubernetes clusters, providing a simple and efficient way to manage application deployments.

### 3.3 GitHub Actions <a name="github-actions"></a>
GitHub Actions are utilized to automate various deployment workflows, including infrastructure provisioning and cluster management tasks.

### 3.4 Kubernetes Upgrades <a name="kubernetes-upgrades"></a>
The platform ensures that Kubernetes clusters are kept up to date by performing regular upgrades to benefit from the latest features, security fixes, and bug patches.

### 3.5 Open Policy Agent (OPA) <a name="open-policy-agent-opa"></a>
OPA is employed to enforce policies on Kubernetes resources, ensuring compliance and security standards are met across the platform.

### 3.6 Istio Service Mesh <a name="istio-service-mesh"></a>
Istio is used along with mTLS   to enhance microservices communication, improve network security, and implement traffic management strategies.

### 3.7 Karpenter Cluster Autoscaling <a name="karpenter-cluster-autoscaling"></a>
Karpenter is used to enable automatic scaling of Kubernetes clusters based on demand, providing optimal resource utilization.

### 3.8 Application Autoscaling (Horizontal / Vertical) <a name="application-autoscaling"></a>
The platform supports both horizontal and vertical application autoscaling, allowing applications to adjust capacity based on varying workloads.

### 3.9 Network Policies <a name="network-policies"></a>
Network policies are implemented to control communication between different services in the cluster, adding an extra layer of security.

### 3.10 Backups <a name="backups"></a>
The platform incorporates data backups to ensure data protection and facilitate disaster recovery.

### 3.11 Security Scanning <a name="security-scanning"></a>
Security scanning tools are utilized to identify vulnerabilities in applications and infrastructure, improving overall security posture.

### 3.12 Monitoring and Observability with DataDog <a name="monitoring-observability-datadog"></a>
DataDog provides comprehensive monitoring and observability solutions, offering insights into system performance, application health, and infrastructure metrics.

## 4. Deployment Workflows <a name="deployment-workflows"></a>

### 4.1 GitHub Actions for Infrastructure Provisioning <a name="github-actions-infrastructure-provisioning"></a>
GitHub Actions are utilized to automate the provisioning of AWS infrastructure using Terraform.

### 4.2 GitHub Actions for Cluster Management <a name="github-actions-cluster-management"></a>
GitHub Actions are employed to automate the deployment and management of Kubernetes clusters and applications using ArgoCD and Helm.

## 5. Conclusion <a name="conclusion"></a>
The SRE-Built Internal Developer Platform is a comprehensive and efficient solution designed to empower developers within the organization to deploy and manage applications seamlessly, ultimately solving the age-old problem that "Devs don't want to do Ops."

The platform's architecture and toolset allow for self-service capabilities, ensuring developers can focus on building and deploying applications without worrying about infrastructure complexities. With robust security measures, cost optimization, and observability in place, the platform promotes reliability, scalability, and efficiency across the entire development lifecycle.

By leveraging the power of GitOps, the platform provides a unified and consistent approach to application deployments, configuration management, and cluster updates. This approach fosters collaboration and enables teams to work more cohesively towards shared goals.

As technology evolves, the SRE-Built Internal Developer Platform will continue to adapt and integrate emerging best practices and tools to remain at the forefront of empowering developers and ensuring smooth and reliable application delivery.

Thank you for using the SRE-Built Internal Developer Platform Documentation! If you have any questions or feedback, please don't hesitate to reach out.
