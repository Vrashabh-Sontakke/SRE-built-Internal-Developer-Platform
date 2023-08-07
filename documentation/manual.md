# SRE-built-IDP Manual

### Prerequisites

 - AWS Account: You should have access to an AWS account with the necessary permissions to create resources like VPCs, EC2 instances, and EKS clusters.
 - AWS S3 Bucket: Create an S3 bucket which will be used to store Terraform State files.
 - GitHub Account: You need a GitHub account with repository creation privileges to clone the project and host the platform's configuration and application code.
 - AWS Acces Key: Create a new Access Key in your AWS IAM settings and get the "access key id" and "secret access key".
 - Terraform (Optional): Ensure you have Terraform installed on your local machine to provision the infrastructure.
 - AWS (Optional): Install AWS CLI and configure it with your AWS credentials to interact with your AWS account programmatically.
 - kubectl (Optional): Install kubectl, the Kubernetes command-line tool, to manage Kubernetes clusters.
- GitHub CLI (Optional): GitHub CLI (gh) is optional but recommended for smoother interactions with GitHub from the command-line.

###  GitHub Repository and Environment Setup

 1. Clone the project repository.
 2. Create Environment: On the project repository, go to `Settings`>`Secretes and variables`>`Actions`>`Manage environments`>`New environment`, enter Name as either `development` or `production` depending on the team you belong to.
 3. Configure environment: On the project repository, go to `Settings`>`Secretes and variables`>`Actions`>`Manage environments` and click on the newly created environment. Here, you have to add two environment Secrets and two environment Variables.
    - Add Secret > Name - `AWS_ACCESS_KEY_ID`, enter the "AWS access key ID" below and click on Add Secret.
    - Add Secret > Name - `AWS_SECRET_ACCESS_KEY`, enter the "AWS secret access key" below and click on Add Secret.
    - Add Variable > Name - `AWS_REGION`, enter "us-east-1" (not customizable yet) and click on Add Variable.
    - Add Variable > Name - `AWS_S3_BUCKET`, enter the name of your AWS S3 Bucket and click on Add Varaiable.
 4. Set Environment: On your project repository, go to `Settings`>`Secretes and variables`>`Actions`>`Variables`>`New repository variable` , enter Name as `ENVIRONMENT` and set it's value to be exactly same as the environment name you chose when creating environment in step 2, which should be either `development` or `production`.
 
#### "There is a GitHub Actions workflow file already setup for almost all of the operational functionalities and features of the IDP"

## [infrastructure-plan](./infrastructure-plan)

### 1. Create AWS VPC
A VPC with two Public Subnets, two Private Subnets, an Internet Gateway and a Route Table.
- **Actions workflow:** `VPC Apply Terraform` || `VPC Destroy Terraform`

### 2. Create AWS EKS Cluster
An EKS Cluster with IAM Role and Policy attachment, Worker Nodes, Node Group and Amazon EBS CSI Driver Add-on.
- **Actions workflow:** `EKS Apply Terraform` || `EKS Destroy Terraform`

### 3. Setup ArgoCD
- **Actions workflow:** `ArgoCD Install on EKS` || `ArgoCD Uninstall from EKS`
