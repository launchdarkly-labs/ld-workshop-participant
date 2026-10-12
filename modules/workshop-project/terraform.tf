terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.31.0"
    }
    launchdarkly = {
      source  = "launchdarkly/launchdarkly"
      version = "~> 2.9.2"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.4.3"
    }
    time = {
      source  = "hashicorp/time"
      version = "~> 0.8.0"
    }
  }
  required_version = ">= 1.3.0"
}
