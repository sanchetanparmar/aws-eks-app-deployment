# End to end aws-eks-app-deployment
guide to deployed webapp on eks. This covers all the required tasks 
Key Components:

# Infrastructure as Code (Terraform):
 Complete EKS cluster setup with VPC, subnets, and security groups
 
 ECR repository for container images
 
 S3 bucket for Terraform state management
 
 ACM for SSL 
 
 Route53 for DNS 


# Python Application:

 Simple "Hello World" web app with /healthz endpoint


# Containerization:
  Dockerfile
  Health checks


# Kubernetes Manifests:

 Deployment with resource limits and health checks
 
 LoadBalancer service for external access
 
 HPA configuration for auto-scaling
 

# CI/CD Pipeline:
 GitHub Actions workflow for automated build and deployment
 
 ECR integration for container registry
 
 Automated Kubernetes deployment
 
```├── alb-ingress-
├── helloworld-app -  sample python app
│   ├── Dockerfile 
│   ├── main.py
│   └── requirements.txt
├── helm-tf
├── k8s - kubernetes resources
│   ├── deployment.yaml  -   Deployment 
│   ├── sanjay-ing.yaml  -   Ingress 
│   ├── sanjay-svc.yaml  -   service 
│   └── servive.yaml
└── terraform
    ├── acm.tf - create ssl certificate 
    ├── ecr.tf - Setup ECR repo
    ├── eks.tf - Setup EKS cluster with node 
    ├── iam-policy.json - IAM policy for worker node to setup AWS ALB ingress
    ├── ingress-alb-policy.tf  - Attched policy to worker node 
    ├── modules - Module for ACM 
    │   └── acm
    │       ├── main.tf      - main acm file to create ssl certificate 
    │       ├── output.tf    - Output ARN for ACM 
    │       ├── route53.tf   - Create Route53 to validate ACM by DNS
    │       └── variables.tf  - Variable file
    ├── s3-bucket.sh  - CLI commands to create S3 for terraform state file ( remote state ) 
    ├── state.tf      - Terraform state configuration 
    ├── var.tfvars    - Variable value file 
    ├── variables.tf  - variable file 
    ├── provider.tf   - terraform provider
    └── vpc.tf        - VPC 
```





