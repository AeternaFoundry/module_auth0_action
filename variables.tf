variable "actions" {
  description = <<EOT
Map of actions, attributes below
Required:
    - code
    - name
    - supported_triggers (block):
        - id (required)
        - version (required)
Optional:
    - deploy
    - runtime
    - secrets_wo_version
    - dependencies (block):
        - name (required)
        - version (required)
    - modules (block):
        - module_id (required)
        - module_version_id (required)
    - secrets (block):
        - name (required)
        - value (required)
    - secrets_wo (block):
        - name (required)
        - value (required)
    - timeouts (block):
        - create (optional)
EOT

  type = map(object({
    code               = string
    name               = string
    deploy             = optional(bool)
    runtime            = optional(string)
    secrets_wo_version = optional(number)
    supported_triggers = object({
      id      = string
      version = string
    })
    dependencies = optional(list(object({
      name    = string
      version = string
    })))
    modules = optional(list(object({
      module_id         = string
      module_version_id = string
    })))
    secrets = optional(list(object({
      name  = string
      value = string
    })))
    secrets_wo = optional(list(object({
      name  = string
      value = string
    })))
    timeouts = optional(object({
      create = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.actions : (
        v.runtime == null || (contains(["node12", "node16", "node18", "node22"], v.runtime))
      )
    ])
    error_message = "must be one of: \"node12\", \"node16\", \"node18\", \"node22\""
  }
}

