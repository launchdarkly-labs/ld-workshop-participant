resource "aws_dynamodb_table_item" "this" {
  count      = var.create_team_member ? "1" : 0
  table_name = var.student_dynamodb_table_name
  hash_key   = "ProjectId"

  item = <<ITEM
{
    "ProjectId": { 
        "S": "${local.project_id}"
    },
    "ProjectKey": { 
        "S": "${local.project_key}" 
    },
    "ProjectName": { 
        "S": "${local.project_name}"
    },
    "LoginEmail": { 
        "S": "${local.login_email}" 
    },
    "LoginSecret": { 
        "S": "${random_password.login_secret.result}" 
    },
    "LoginExpiresAt": {
        "N": "${time_offset.login_expires_at.unix}"
    },
    "StudentEmail": {
        "S": "${local.student_email}"
    },
    "StudentOrganizationKey": { 
        "S": "${var.student_organization_key}" 
    }
}
ITEM
}

resource "aws_dynamodb_table_item" "second" {
  count      = var.create_team_member ? "1" : 0
  table_name = var.sandbox_dynamodb_table_name
  hash_key   = "SandboxId"

  item = <<ITEM
{
    "SandboxId": {
        "S": "${var.sandbox_id}"
    },
    "LoginUrl": {
        "S": "${local.login_url}"
    },
    "ProjectId": { 
        "S": "${local.project_id}"
    }
}
ITEM
}
