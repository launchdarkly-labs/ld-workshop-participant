variable "aws_region" {
  description = "The region to create these resources in"
  type        = string
  default     = "us-east-2"
}

variable "project_name_prefix" {
  type        = string
  description = "The name prefix of the generated project."
  default     = "instruqt-workshop"
}

variable "environment_name" {
  type        = string
  description = "The name of the environment to create."
  default     = "Test"
}

variable "environment_key" {
  type        = string
  description = "The key of the environment to create."
  default     = "test"
}

variable "student_emails" {
  type        = set(string)
  description = "The set of student emails to create projects and accounts for."
  default     = ["workshops@launchdarkly.com"]
}

variable "student_organization_key" {
  type        = string
  description = "The organization key used to tag all resources created, for easy identification."
  default     = "workshop-org"
}

variable "expires_after_days" {
  type        = number
  description = "The number of days from creation after which the login links will expire."
  default     = 3
}

variable "sandbox_id" {
  type        = string
  description = "The Sandbox ID of the Instruqt VM running the content."
}
