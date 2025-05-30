resource "aws_ecr_repository" "main" {
  name                 = var.aws_ecr_repository_name
  image_tag_mutability = "MUTABLE"
  image_scanning_configuration {
    scan_on_push = true
  }
  tags = {
    appname  = var.aws_ecr_repository_name
  }
  lifecycle {
    prevent_destroy = false
  }
}