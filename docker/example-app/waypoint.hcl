project = "example-nodejs"

app "example-nodejs" {
  labels = {
    "service" = "example-nodejs",
    "env"     = "production"
  }

  build {
    use "pack" {}
    
    registry {
      use "docker" {
        image = var.image
        tag = "v20230518v03"
        username = var.registry_username
        password = var.registry_password
      }
    }
  }

  deploy {
    use "docker" {}
  }
}

variable "image" {
  type        = string
}

variable "tag" {
  type        = string
}

variable "registry_username" {
  type        = string
}

variable "registry_password" {
  type        = string
}
