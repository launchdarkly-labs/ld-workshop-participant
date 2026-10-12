output "project_id" {
    description = "The identifier of the workshop project."
    value = local.project_id
}

output "project_key" {
    description = "The key of the workshop project."
    value = local.project_key
}

output "project_name" {
    description = "The name of the workshop project."
    value = local.project_name
}

output "student_email" {
    description = "The email address of the student the project is associated to."
    value = local.student_email
}

output "login_email" {
    description = "The login email address that this workshop project is associated to."
    value = var.create_team_member ? local.login_email : ""
}

output "login_url" {
    value = var.create_team_member ? local.login_url : ""
}

output "login_expires_at" {
    value = var.create_team_member ? time_offset.login_expires_at.rfc3339 : ""
}

output "admin_role_key" {
    description = "The administrator role key for the workshop project."
    value = local.admin_role_key
}

output "reader_role_key" {
    description = "The reader role key for the workshop project."
    value = local.reader_role_key
}