module "project" {
  for_each = var.student_emails
  source   = "./modules/workshop-project"

  project_name_prefix         = var.project_name_prefix
  environment_key             = var.environment_key
  environment_name            = var.environment_name
  student_email               = each.key
  expires_after_days          = var.expires_after_days
  student_organization_key    = var.student_organization_key
  sandbox_id                  = var.sandbox_id
  sandbox_dynamodb_table_name = data.terraform_remote_state.infrastructure.outputs.sandbox_table_name
  student_dynamodb_table_name = data.terraform_remote_state.infrastructure.outputs.users_table_name
  login_base_url              = data.terraform_remote_state.infrastructure.outputs.users_login_url
}
