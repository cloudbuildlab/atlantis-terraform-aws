package main

import future.keywords.if
import future.keywords.in

# Deny resources without required tags
deny[msg] {
    resource := input.resource_changes[_]
    resource.type != "data"
    not resource.change.after.tags
    msg := sprintf("Resource '%s' of type '%s' is missing required tags", [resource.address, resource.type])
}

# Deny resources with missing Name tag
deny[msg] {
    resource := input.resource_changes[_]
    resource.type != "data"
    resource.change.after.tags
    not resource.change.after.tags.Name
    msg := sprintf("Resource '%s' of type '%s' is missing required 'Name' tag", [resource.address, resource.type])
}

# Deny S3 buckets without encryption
deny[msg] {
    resource := input.resource_changes[_]
    resource.type == "aws_s3_bucket"
    not resource.change.after.server_side_encryption_configuration
    msg := sprintf("S3 bucket '%s' must have server-side encryption enabled", [resource.address])
}

# Deny S3 buckets with versioning disabled
deny[msg] {
    resource := input.resource_changes[_]
    resource.type == "aws_s3_bucket"
    resource.change.after.versioning
    not resource.change.after.versioning[0].enabled
    msg := sprintf("S3 bucket '%s' must have versioning enabled", [resource.address])
}

