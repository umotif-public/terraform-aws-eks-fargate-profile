locals {
  tags = merge(
    var.tags,
    {
      Namespace = var.namespace
    },
    {
      "kubernetes.io/cluster/${var.cluster_name}" = "owned"
    }
  )
}

resource "aws_iam_role" "main" {
  count = var.enabled ? 1 : 0

  name        = format("%s-fargate-profile-%s", var.cluster_name, var.namespace)
  description = var.description

  assume_role_policy = jsonencode({
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Principal = {
          Service = "eks-fargate-pods.amazonaws.com"
        }
      }
    ]
    Version = "2012-10-17"
  })

  tags = local.tags
}

resource "aws_iam_role_policy_attachment" "main" {
  count = var.enabled ? 1 : 0

  policy_arn = "arn:aws:iam::aws:policy/AmazonEKSFargatePodExecutionRolePolicy"
  role       = join("", aws_iam_role.main.*.name)
}

resource "aws_eks_fargate_profile" "main" {
  count = var.enabled ? 1 : 0

  cluster_name           = var.cluster_name
  fargate_profile_name   = var.fargate_profile_name != "" ? var.fargate_profile_name : format("fargate-profile-%s", var.namespace)
  pod_execution_role_arn = join("", aws_iam_role.main.*.arn)
  subnet_ids             = var.subnet_ids
  tags                   = local.tags

  selector {
    namespace = var.namespace
    labels    = var.labels
  }
}
