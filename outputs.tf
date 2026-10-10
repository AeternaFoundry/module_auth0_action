output "actions_id" {
  description = "Map of id values across all actions, keyed the same as var.actions except keys with no id are omitted"
  value       = { for k, v in auth0_action.actions : k => v.id if v.id != null && length(v.id) > 0 }
}
output "actions_code" {
  description = "Map of code values across all actions, keyed the same as var.actions except keys with no code are omitted"
  value       = { for k, v in auth0_action.actions : k => v.code if v.code != null && length(v.code) > 0 }
}
output "actions_dependencies" {
  description = "Map of dependencies values across all actions, keyed the same as var.actions except keys with no dependencies are omitted"
  value       = { for k, v in auth0_action.actions : k => v.dependencies if v.dependencies != null && length(v.dependencies) > 0 }
}
output "actions_deploy" {
  description = "Map of deploy values across all actions, keyed the same as var.actions except keys with no deploy are omitted"
  value       = { for k, v in auth0_action.actions : k => v.deploy if v.deploy != null }
}
output "actions_modules" {
  description = "Map of modules values across all actions, keyed the same as var.actions except keys with no modules are omitted"
  value       = { for k, v in auth0_action.actions : k => v.modules if v.modules != null && length(v.modules) > 0 }
}
output "actions_name" {
  description = "Map of name values across all actions, keyed the same as var.actions except keys with no name are omitted"
  value       = { for k, v in auth0_action.actions : k => v.name if v.name != null && length(v.name) > 0 }
}
output "actions_runtime" {
  description = "Map of runtime values across all actions, keyed the same as var.actions except keys with no runtime are omitted"
  value       = { for k, v in auth0_action.actions : k => v.runtime if v.runtime != null && length(v.runtime) > 0 }
}
output "actions_secrets" {
  description = "Map of secrets values across all actions, keyed the same as var.actions except keys with no secrets are omitted"
  value       = { for k, v in auth0_action.actions : k => v.secrets if v.secrets != null && length(v.secrets) > 0 }
  sensitive   = true
}
output "actions_secrets_wo" {
  description = "Map of secrets_wo values across all actions, keyed the same as var.actions except keys with no secrets_wo are omitted"
  value       = { for k, v in auth0_action.actions : k => v.secrets_wo if v.secrets_wo != null && length(v.secrets_wo) > 0 }
  sensitive   = true
}
output "actions_secrets_wo_version" {
  description = "Map of secrets_wo_version values across all actions, keyed the same as var.actions except keys with no secrets_wo_version are omitted"
  value       = { for k, v in auth0_action.actions : k => v.secrets_wo_version if v.secrets_wo_version != null }
}
output "actions_status" {
  description = "Map of status values across all actions, keyed the same as var.actions except keys with no status are omitted"
  value       = { for k, v in auth0_action.actions : k => v.status if v.status != null && length(v.status) > 0 }
}
output "actions_supported_triggers" {
  description = "Map of supported_triggers values across all actions, keyed the same as var.actions except keys with no supported_triggers are omitted"
  value       = { for k, v in auth0_action.actions : k => one(v.supported_triggers) if v.supported_triggers != null && length(v.supported_triggers) > 0 }
}
output "actions_version_id" {
  description = "Map of version_id values across all actions, keyed the same as var.actions except keys with no version_id are omitted"
  value       = { for k, v in auth0_action.actions : k => v.version_id if v.version_id != null && length(v.version_id) > 0 }
}

