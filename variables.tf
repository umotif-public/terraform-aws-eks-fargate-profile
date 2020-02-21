variable "enabled" {
  type        = bool
  description = "Whether to create the resources. Set to `false` to prevent the module from creating any resources"
  default     = true
}

variable "cluster_name" {
  type        = string
  description = "The name of the EKS cluster"
}

variable "namespace" {
  type        = string
  description = "Kubernetes namespace for which fargate profile will be used."
  default     = ""
}

variable "labels" {
  type        = map(string)
  description = "Key-value mapping of Kubernetes labels for selection"
  default     = {}
}

variable "description" {
  type        = string
  default     = "EKS cluster fargate profile IAM role."
  description = "The description of the IAM Role used by fargate profile."
}

variable "tags" {
  type        = map(string)
  default     = {}
  description = "Mapping of additional tags."
}

variable "subnet_ids" {
  description = "Identifiers of private EC2 Subnets to associate with the EKS Fargate Profile. These subnets must have the following resource tag: kubernetes.io/cluster/cluster_name."
  type        = list(string)
}

variable "fargate_profile_name" {
  type        = string
  description = "Name of the EKS Fargate Profile. If not provided, profile will be called `fargate-profile-namespace_name`."
  default     = ""
}

