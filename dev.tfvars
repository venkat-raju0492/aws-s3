region                            = "us-west-2"                                     ## AWS region to deploy service
project                           = "poc"                                           ## name of the project
env                               = "dev"                                           ## name of the environment
cost_category                     = "poc"                                           ## cost category tag

bucket                            = "poc-bucket-dev"                                ## s3 bucket name
acl                               = "private"                                       ## s3 bucket type private/public
versioning                        = {                                               ## whether versioning is enabled or not
                            enabled = true
}

lifecycle_rule = {                                                                  ## enabling lifecylcy policy with 90 days of expiration                                          
    enabled = true
    id = "s3 lifecycle expiration"
    expiration =  {
      expired_object_delete_marker = true
      days = 90
    }
}

logging = {                                                                         ## s3 logging bucket 
    target_bucket = "logging-s3-bucket"
    target_prefix = "logs/poc/"
}

server_side_encryption_configuration = {                                            ## s3 default encription
    rule = {
      apply_server_side_encryption_by_default = {
        sse_algorithm = "AES256"
      }
    }
}

