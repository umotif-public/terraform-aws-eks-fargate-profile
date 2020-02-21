provider "aws" {
  region = "eu-west-1"
}

module "eks-fargate-profile" {
  source = "../.."

  enabled      = true
  cluster_name = "eks-test-eu"
  subnet_ids   = ["subnet-037c37205ce1cd88c", "subnet-0bb4e7a5c3120bc47", "subnet-07a58a249f38a1f58"]

  namespace = "kube-system"
  labels = {
    infrastructure = "fargate"
  }

  tags = {
    Environment = "test"
  }
}
