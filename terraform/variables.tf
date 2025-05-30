variable "vpc_name" {
   description = "VPC Name"
   type = string
   default = "test"
  
}

variable "aws_region" {
    description = "AWS region name"
    type = string
    default = "us-east-1"
}

variable "vpc_cidr" {
    description = "VPC CIDR"
}

variable "public_subnets_cidr" {
    description = "public subnets cidr"
    type = list(string)
  
}

variable "private_subnets_cidr" {
    description = "private subnets cidr"
    type = list(string)
  
}

variable "eks_cluster_name" {
    description = "EKS cluster name"
    type = string
    default = "test"
  
}

variable "eks_cluster_version" {
    description = "EKS clusre kubernets version"
    type = string
    default = "1.32"
  
}

variable "aws_ecr_repository_name" {
    description = "ECR repo name"
    type = string
    default = "test"
  
}
