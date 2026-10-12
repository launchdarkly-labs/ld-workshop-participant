variable "project_name_prefix" {
  type        = string
  description = "The name prefix of the generated project."
}

variable "environment_name" {
  type        = string
  description = "The name of the environment to create."
}

variable "environment_key" {
  type        = string
  description = "The key of the environment to create."
}

variable "student_email" {
  type        = string
  description = "The email address of the student who will own and work on the workshop project."
}

variable "student_organization_key" {
  type        = string
  description = "The organization key for the student, used as a tag for all resources created by this module."
}

variable "sandbox_dynamodb_table_name" {
  type        = string
  description = "The name of the DynamoDB table name to write the sandbox ID record to."
}

variable "student_dynamodb_table_name" {
  type        = string
  description = "The name of the DynamoDB table name to write the team member record to."
}

variable "create_team_member" {
  type        = bool
  description = "Whether or not to create a new team member with admin access to the project and environment."
  default     = true
}

variable "login_base_url" {
  type        = string
  description = "The base url to use for a magic signin link if creating a team member."
}

variable "expires_after_days" {
  type        = number
  description = "The number of days from creation after which the login links will expire."
  default     = 90
}

variable "email_prefix" {
  type        = string
  description = "The prefix value of the generated login emails."
  default     = "instruqt"
}

variable "email_domain" {
  type        = string
  description = "The email domain of the generated login emails."
  default     = "launchdarkly.com"
}

variable "sandbox_id" {
  type        = string
  description = "The Sandbox ID of the Instruqt VM running the content."
}
