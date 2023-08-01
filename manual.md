# SRE-built-IDP Manual

### Prerequisites

 - AWS Account: You should have access to an AWS account with the necessary permissions to create resources like VPCs, EC2 instances, and EKS clusters.
 - AWS S3 Bucket: Create an S3 bucket which will be used to store Terraform State files.
 - GitHub Account: You need a GitHub account with repository creation privileges to clone the project and host the platform's configuration and application code.
 - Terraform (Optional): Ensure you have Terraform installed on your local machine to provision the infrastructure.
 - AWS (Optional): Install AWS CLI and configure it with your AWS credentials to interact with your AWS account programmatically.
 - kubectl (Optional): Install kubectl, the Kubernetes command-line tool, to manage Kubernetes clusters.
- GitHub CLI (Optional): GitHub CLI (gh) is optional but recommended for smoother interactions with GitHub from the command-line.

### Project Repository

 - There are three branches, namely `development`, `staging` and `production` used for development, staging and production environments respectively.
 - Developers are recommended to work with the `development` branch while DevOps / SRE professional are recommended to work with the `production` branch.
 - You must clone your desired branch and must use it as your `main` branch for the `.github/workflow` files to be detected by GitHub-Actions.

###  Setup AWS Access Key in GitHub Repository

 1. Create a new Access Key in your AWS account and get the "access key id" and "secret access key".
 2. On your project repository, go to `Settings`>`Secretes and variables`>`Actions`>`New repository secret`
 3. Enter name `AWS_ACCESS_KEY_ID` and paste the "access key id" in the box below.
 4. Create another New repository secret, Enter name `AWS_SECRET_ACCESS_KEY` and paste the "secret access key" in the box below.
 5. There two more Repository Secrets you may need to setup but those are optional and we will take a look at those in a later part of the Manual.
 
#### " There is a GitHub Actions workflow file already setup for almost all of the operational functionalities of the IDP "

## [infrastructure-plan](./infrastructure-plan)
### 
