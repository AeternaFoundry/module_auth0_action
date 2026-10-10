resource "auth0_action" "actions" {
  for_each = var.actions

  code               = each.value.code
  name               = each.value.name
  deploy             = each.value.deploy
  runtime            = each.value.runtime
  secrets_wo_version = each.value.secrets_wo_version

  supported_triggers {
    id      = each.value.supported_triggers.id
    version = each.value.supported_triggers.version
  }

  dynamic "dependencies" {
    for_each = each.value.dependencies != null ? each.value.dependencies : []
    content {
      name    = dependencies.value.name
      version = dependencies.value.version
    }
  }

  dynamic "modules" {
    for_each = each.value.modules != null ? each.value.modules : []
    content {
      module_id         = modules.value.module_id
      module_version_id = modules.value.module_version_id
    }
  }

  dynamic "secrets" {
    for_each = each.value.secrets != null ? each.value.secrets : []
    content {
      name  = secrets.value.name
      value = secrets.value.value
    }
  }

  dynamic "secrets_wo" {
    for_each = each.value.secrets_wo != null ? each.value.secrets_wo : []
    content {
      name  = secrets_wo.value.name
      value = secrets_wo.value.value
    }
  }

  dynamic "timeouts" {
    for_each = each.value.timeouts != null ? [each.value.timeouts] : []
    content {
      create = timeouts.value.create
    }
  }
}

