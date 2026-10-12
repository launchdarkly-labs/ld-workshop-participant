output "students" {
  value = [for project in module.project : {
    project_id       = project.project_id
    project_key      = project.project_key
    project_name     = project.project_name
    student_email    = project.student_email
    login_email      = project.login_email
    login_expires_at = project.login_expires_at
    login_url        = project.login_url
  }]
}
