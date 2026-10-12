resource "random_pet" "project_id" {
    keepers = {
        student_email = var.student_email
    }
}

resource "random_password" "login_secret" {
    length = 32
    special = false
}

resource "time_offset" "login_expires_at" {
    offset_days = var.expires_after_days
}

data "external" "signature" {
  program = ["node", "${path.module}/sign.js"]
  query = {
    id = random_pet.project_id.id
    expires = time_offset.login_expires_at.unix
    secret = random_password.login_secret.result
  }
}

locals {
    project_id = random_pet.project_id.id
    project_key = "${local.project_id}"
    project_name = "${var.project_name_prefix} - ${local.project_id}"
    student_email = random_pet.project_id.keepers.student_email
    login_email = "${var.email_prefix}+${local.project_id}@${var.email_domain}"
    login_url = "${var.login_base_url}?id=${data.external.signature.result.id}&expires=${data.external.signature.result.expires}&token=${data.external.signature.result.token}"
    admin_role_key = "${local.project_key}-admin"
    reader_role_key = "${local.project_key}-reader"
}