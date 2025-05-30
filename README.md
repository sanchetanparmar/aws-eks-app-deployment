# Deploy Simple Webapp on EKS 
APP Home - http://acb07dc5dedde480ca963b9fe2074393-1776350714.eu-north-1.elb.amazonaws.com

health-check endpoin -  http://acb07dc5dedde480ca963b9fe2074393-1776350714.eu-north-1.elb.amazonaws.com/healthz

Guide to deploy webapp on eks. This covers all the required tasks 
# Key Components:

 Infrastructure as Code (Terraform)
 
 Python Application:
 
 Containerization
 
 CI/CD Pipeline
 
 GitHub Actions workflow for automated build and deployment
 
 ECR integration for container registry
 
 Automated Kubernetes deployment ( Helm chart deployment) 

# Repository Structure

 
```├── README.md
├── hello-world
│   ├── Dockerfile
│   ├── helm
│   │   ├── Chart.yaml
│   │   ├── charts
│   │   ├── templates
│   │   │   ├── deployment.yaml
│   │   │   ├── hpa-yaml
│   │   │   └── service.yaml
│   │   └── values.yaml
│   ├── main.py
│   └── requirements.txt
└── terraform
    ├── ecr.tf
    ├── eks.tf
    ├── provider.tf
    ├── s3-bucket.sh
    ├── state.tf
    ├── variables.tf
    ├── vars.tfvars
    └── vpc.tf
```

# How to use 
 Clone repo  - `git clone https://github.com/sanchetanparmar/aws-eks-app-deployment.git`

  Deploy AWS resources using terraform 
 1. `cd terraform`
 2. Create a S3 bcuket and enable versioning for terraform state file. you can cretae from web console or *CLI commnads* - `s3-bucket.sh`
 3. Update terraform variable in `var.tfvars`
 4. Initialize terraform `terraform init`
 5. terraform execution plan   `terraform plan -var-file vars.tfvars`
 6. deploy terraform changes to cerate resources `terraform apply -var-file vars.tfvars`  it will ask for confirmation 

```
 terraform init                            # Initialize terraform
 terraform plan -var-file vars.tfvars      # terraform execution plan
 terraform apply -var-file vars.tfvars     # deploy terraform changes to cerate resources. It will ask for confirmation. 

```
# Install Hellword app on EKS 
1. Create Docker image `docker build -t sp-hello-world-app .`
2. Login to ECR - `aws ecr get-login-password --region us-west-2 | docker login --username AWS --password-stdin 708646111713.dkr.ecr.us-west-2.amazonaws.com`
3. Tag Docker image `docker tag sp-hello-world-app:latest 708646111713.dkr.ecr.us-west-2.amazonaws.com/sp-hello-world-app:latest`
4. Push docker image to ECR - `docker push 708646111713.dkr.ecr.us-west-2.amazonaws.com/sp-hello-world-app:latest`
5. deploy kubernetes deployment and service `cd ../k8s`
6. Create a deployment `kubectl apply -f deployment.yaml`
7. Create a service `kubectl apply -f servive.yaml`





