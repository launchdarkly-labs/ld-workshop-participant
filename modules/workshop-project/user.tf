resource "launchdarkly_team_member" "this" {
    count = var.create_team_member ? 1 : 0
    email = local.login_email
    first_name = local.project_id
    last_name = "Student"

    custom_roles = [
        launchdarkly_custom_role.admin.key
    ]
    
    lifecycle {
        ignore_changes = [
            email,
            first_name, 
            last_name
        ]
    }
}