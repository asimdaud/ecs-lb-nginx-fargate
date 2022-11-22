variable "aws_region" {
  description = "Configuring AWS as provider"
  type        = string
  default     = "eu-west-2"
}

variable "vpc" {

  description = "VPC to be used"
  type        = string
  # default     = "vpc-f3e2b09b"
}

variable "subnets" {
  description = "subnets"
  type        = list(string)
  # default     = ["subnet-cd7c5ba4", "subnet-51caaa2b", "subnet-0478ce48"]
}