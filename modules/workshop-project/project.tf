resource "launchdarkly_project" "this" {
    key  = local.project_key
    name = local.project_name

    default_client_side_availability {
        using_environment_id = true
        using_mobile_key = true
    }
    
    tags = [
        var.student_organization_key,
        "terraform"
    ]

    environments {
        key = var.environment_key
        name = var.environment_name
        color = format("%06x", random_integer.environment_color.result)
        require_comments = false
        confirm_changes = false

        tags  = [
            var.student_organization_key,
            "terraform"
        ]
    }
}

resource "random_integer" "environment_color" {
    min = 0
    max = 16777215
}