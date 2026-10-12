resource "launchdarkly_custom_role" "admin" {
  key         = local.admin_role_key
  name        = "${local.project_name} Admin"
  description = "Administrator role for ${local.project_id}."

  policy_statements {
    not_resources = [
      "proj/${local.project_key}"
    ]
    actions = [
      "viewProject"
    ]
    effect = "deny"
  }

  policy_statements {
    resources = [
      "proj/${local.project_key}"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "proj/${local.project_key}:env/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "proj/${local.project_key}:env/*:flag/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "proj/${local.project_key}:env/*:destination/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "proj/${local.project_key}:env/*:experiment/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "proj/${local.project_key}:env/*:segment/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "proj/${local.project_key}:agent-graph/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "proj/${local.project_key}:ai-tool/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "proj/${local.project_key}:env/*:aiconfig/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "proj/${local.project_key}:ai-evaluation/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "proj/${local.project_key}:ai-dataset/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "proj/${local.project_key}:prompt-snippet/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }

  policy_statements {
    resources = [
      "proj/${local.project_key}:metric/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }
  policy_statements {
    resources = [
      "proj/${local.project_key}:alert/*"
    ]
    actions = [
      "*"
    ]
    effect = "allow"
  }
}

resource "launchdarkly_custom_role" "reader" {
  key         = local.reader_role_key
  name        = "${local.project_name} Reader"
  description = "Reader role for ${local.project_id}."

  policy_statements {
    not_resources = [
      "proj/${local.project_key}"
    ]
    actions = [
      "viewProject"
    ]
    effect = "deny"
  }

  policy_statements {
    resources = [
      "proj/${local.project_key}"
    ]
    actions = [
      "viewProject"
    ]
    effect = "allow"
  }
}
