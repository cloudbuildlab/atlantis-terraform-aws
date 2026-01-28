package main

# Deny null_resource usage - common policy example
deny contains msg if {
    resource := input.resource_changes[_]
    resource.type == "null_resource"
    msg := sprintf("Resource '%s' uses null_resource which is not allowed. Use proper Terraform resources instead.", [resource.address])
}

