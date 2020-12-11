![GitHub release (latest SemVer)](https://img.shields.io/github/v/release/umotif-public/terraform-aws-eks-fargate-profile?style=social)

# terraform-aws-eks-fargate-profile

Terraform module to configure an EKS Fargate Profile.

## Terraform versions

Terraform 0.12. Pin module version to `~> v1.0`. Submit pull-requests to `master` branch.

## Usage

```hcl
module "eks-fargate-profile" {
  cluster_name = "eks-test"
  subnet_ids   = ["subnet-037c37205ce1cd88c", "subnet-0bb4e7a5c3120bc47", "subnet-07a58a249f38a1f58"]

  namespace = "kube-system"
  labels = {
    infrastructure = "fargate"
  }

  tags = {
    Environment = "test"
  }
}
```

## Assumptions

Module is to be used with Terraform > 0.12.

## Examples

* [ESK Fargate Profile](https://github.com/umotif-public/terraform-aws-eks-fargate-profile/tree/master/examples/core)

## Authors

Module managed by [Marcin Cuber](https://github.com/marcincuber) [LinkedIn](https://www.linkedin.com/in/marcincuber/).

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| terraform | >= 0.12.6 |
| aws | >= 2.41 |

## Providers

| Name | Version |
|------|---------|
| aws | >= 2.41 |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| cluster\_name | The name of the EKS cluster | `string` | n/a | yes |
| description | The description of the IAM Role used by fargate profile. | `string` | `"EKS cluster fargate profile IAM role."` | no |
| enabled | Whether to create the resources. Set to `false` to prevent the module from creating any resources | `bool` | `true` | no |
| fargate\_profile\_name | Name of the EKS Fargate Profile. If not provided, profile will be called `fargate-profile-namespace_name`. | `string` | `""` | no |
| labels | Key-value mapping of Kubernetes labels for selection | `map(string)` | `{}` | no |
| namespace | Kubernetes namespace for which fargate profile will be used. | `string` | `""` | no |
| subnet\_ids | Identifiers of private EC2 Subnets to associate with the EKS Fargate Profile. These subnets must have the following resource tag: kubernetes.io/cluster/cluster\_name. | `list(string)` | n/a | yes |
| tags | Mapping of additional tags. | `map(string)` | `{}` | no |

## Outputs

| Name | Description |
|------|-------------|
| eks\_fargate\_profile\_arn | ARN of the EKS Fargate Profile |
| eks\_fargate\_profile\_id | EKS Cluster name and EKS Fargate Profile name separated by a colon |
| eks\_fargate\_profile\_role\_arn | ARN of the EKS Fargate Profile IAM role |
| eks\_fargate\_profile\_role\_name | Name of the EKS Fargate Profile IAM role |
| eks\_fargate\_profile\_status | Status of the EKS Fargate Profile |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## License

See LICENSE for full details.

## Pre-commit hooks

### Install dependencies

* [`pre-commit`](https://pre-commit.com/#install)
* [`terraform-docs`](https://github.com/segmentio/terraform-docs) required for `terraform_docs` hooks.
* [`TFLint`](https://github.com/terraform-linters/tflint) required for `terraform_tflint` hook.

#### MacOS

```bash
brew install pre-commit terraform-docs tflint

brew tap git-chglog/git-chglog
brew install git-chglog
```
