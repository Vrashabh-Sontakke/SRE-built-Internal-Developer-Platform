# SRE-Built Internal Developer Platform Documentation

## Table of Contents
1. Introduction
   - 1.1 Project Overview
   - 1.2 Project Scope
   - 1.3 Project Goals
   - 1.4 Project Technologies and Tools
2. Infrastructure Plan
   - 2.1 AWS and Terraform
   - 2.2 Kubernetes (EKS)
   - 2.3 Kustomize
   - 2.4 Cost & Resource Optimization
   - 2.5 Vault (HA)
3. Cluster Management
   - 3.1 ArgoCD
   - 3.2 Helm
   - 3.3 GitHub Actions
   - 3.4 Kubernetes Upgrades
   - 3.5 Open Policy Agent (OPA)
   - 3.6 Istio Service Mesh
   - 3.7 Karpenter Cluster Autoscaling
   - 3.8 Application Autoscaling (Horizontal / Vertical)
   - 3.9 Network Policies
   - 3.10 Backups
   - 3.11 Security Scanning
   - 3.12 Monitoring and Observability with DataDog
4. Deployment Workflows
   - 4.1 GitHub Actions for Infrastructure Provisioning
   - 4.2 GitHub Actions for Cluster Management
5. Conclusion

## 1. Introduction

### 1.1 Project Overview
The SRE-Built Internal Developer Platform (IDP) is a cutting-edge infrastructure and cluster management platform designed and implemented from the knowledge and perspective of an SRE (Site Reliability Engineer) to empower developers and developer-self-service within an organization. The platform is built with a "git as the only source of truth" concept while also utilizing GitHub itself as the user interface. It enables seamless deployment and management of AWS-based infrastructure, Kubernetes clusters, and various services using a combination of AWS, Terraform, Kubernetes (EKS), Kustomize, ArgoCD, Helm, and other powerful tools and optimizations.

### 1.2 Project Scope
The scope of the SRE-Built Internal Developer Platform spans two main sections: "Infrastructure Plan" and "Cluster Management." The first half of the project focuses on setting up the underlying AWS infrastructure using Terraform and EKS for Kubernetes. The second half concentrates on the management of Kubernetes clusters, application deployments, autoscaling, network policies, security scanning, monitoring, and observability.

### 1.3 Project Goals
The primary objectives of the SRE-Built Internal Developer Platform are:
- Provide a seamless and self-service experience for end-users (e.g. developers) to deploy and manage their applications.
- Ensure infrastructure scalability and cost optimization using best practices.
- Implement robust security measures, including access control and scanning mechanisms.
- Establish reliable monitoring and observability to identify and address issues proactively.
- Enable automated application deployment using GitOps principles.
- Facilitate autoscaling of both infrastructure and applications to handle varying workloads efficiently.

### 1.4 Project Technologies and Tools
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

## 2. Infrastructure Plan

### 2.1 AWS and Terraform
The infrastructure plan involves setting up the required AWS resources using Terraform. It includes provisioning virtual private clouds (VPCs), EC2 instances, load balancers, security groups, and other essential infrastructure components.

### 2.2 Kubernetes (EKS)
Kubernetes is deployed on the AWS cloud using Elastic Kubernetes Service (EKS) to provide a scalable and managed Kubernetes environment for running containerized applications.

### 2.3 Kustomize
Kustomize is used to customize Kubernetes manifests and configurations to tailor them to specific environments and requirements.

### 2.4 Cost & Resource Optimization
To optimize costs and resources, the platform follows best practices like right-sizing instances, leveraging spot instances, and employing auto-scaling policies to adapt to varying workloads efficiently.

### 2.5 Vault (HA)
Vault is utilized in a highly available (HA) configuration to securely manage and store sensitive information such as credentials, certificates, and tokens.

## 3. Cluster Management

### 3.1 ArgoCD
ArgoCD is the core tool for GitOps-based continuous deployment. It helps to manage applications and configuration changes in the Kubernetes clusters by leveraging Git repositories as the source of truth.

### 3.2 Helm
Helm is used to package, version, and deploy applications on Kubernetes clusters, providing a simple and efficient way to manage application deployments.

### 3.3 GitHub Actions
GitHub Actions are utilized to automate various deployment workflows, including infrastructure provisioning and cluster management tasks.

### 3.4 Kubernetes Upgrades
The platform ensures that Kubernetes clusters are kept up to date by performing regular upgrades to benefit from the latest features, security fixes, and bug patches.

### 3.5 Open Policy Agent (OPA)
OPA is employed to enforce policies on Kubernetes resources, ensuring compliance and security standards are met across the platform.

### 3.6 Istio Service Mesh
Istio is used to enhance microservices communication, improve network security, and implement traffic management strategies.

### 3.7 Karpenter Cluster Autoscaling
Karpenter is used to enable automatic scaling of Kubernetes clusters based on demand, providing optimal resource utilization.

### 3.8 Application Autoscaling (Horizontal / Vertical)
The platform supports both horizontal and vertical application autoscaling, allowing applications to adjust capacity based on varying workloads.

### 3.9 Network Policies
Network policies are implemented to control communication between different services in the cluster, adding an extra layer of security.

### 3.10 Backups
The platform incorporates data backups to ensure data protection and facilitate disaster recovery.

### 3.11 Security Scanning
Security scanning tools are utilized to identify vulnerabilities in applications and infrastructure, improving overall security posture.

### 3.12 Monitoring and Observability with DataDog
DataDog provides comprehensive monitoring and observability solutions, offering insights into system performance, application health, and infrastructure metrics.

## 4. Deployment Workflows

### 4.1 GitHub Actions for Infrastructure Provisioning
GitHub Actions are utilized to automate the provisioning of AWS infrastructure using Terraform.

### 4.2 GitHub Actions for Cluster Management
GitHub Actions are employed to automate the deployment and management of Kubernetes clusters and applications using ArgoCD and Helm.

## 5. Conclusion
The SRE-Built Internal Developer Platform is a comprehensive and efficient solution designed to empower developers within the organization to deploy and manage applications seamlessly, ultimately solving the age old problem that "Dev don't want to do Ops".
