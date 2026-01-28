package main

# Simple test policy - allows all resources to pass
# This is a minimal policy that will always pass to test the policy_check integration
# Replace with actual policies once the integration is working

# Example: Deny null_resource usage
deny[msg] {
    resource := input.resource_changes[_]
    resource.type == "null_resource"
    msg := sprintf("Resource '%s' uses null_resource which is not allowed", [resource.address])
}

