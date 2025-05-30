module "eks" {
  source  = "terraform-aws-modules/eks/aws"

  cluster_name    = var.eks_cluster_name
  cluster_version = var.eks_cluster_version
  # EKS Addons
  cluster_addons = {
    coredns                = {}
    eks-pod-identity-agent = {}
    kube-proxy             = {}
    vpc-cni                = {}
  }

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets
  control_plane_subnet_ids = module.vpc.private_subnets

  cluster_endpoint_public_access = true

  enable_cluster_creator_admin_permissions = true

  
  
   
  eks_managed_node_groups = {
    
    eks_nodegroup = {
      ami_type       = "AL2023_x86_64_STANDARD"
      instance_types = ["t3.medium"]
      create_launch_template = false
      use_custom_launch_template =  false
      min_size = 1
      max_size = 2
      desired_size = 1
    }
  }

  tags = {
    name = var.vpc_name
  }
  depends_on = [ module.vpc ]
}