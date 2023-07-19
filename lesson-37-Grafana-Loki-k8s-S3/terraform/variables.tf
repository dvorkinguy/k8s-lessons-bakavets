variable "aws_region" {
  description = "AWS Region."
  default     = "us-west-2"
}

variable "default_tags" {
  type        = map(string)
  description = "Default tags for AWS that will be attached to each resource."
  default = {
    "TerminationDate" = "Permanent",
    "Environment"     = "Development",
    "Team"            = "DevOps",
    "DeployedBy"      = "Terraform",
    "OwnerEmail"      = "notjustdevops@gmail.com"
  }
}

variable "deployment_prefix" {
  description = "Prefix of the deployment."
  type        = string
  default     = "njd37b"
}
