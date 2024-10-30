variable "ecr_repository_name" {
  type        = string
  description = "The name of the ECR repository"
  default     = "ci_cd_sim_ecr"  # Default value, or override in your CI/CD pipeline
}
