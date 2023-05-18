project = "example-nodejs"

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


app "example-nodejs" {
  labels = {
    "service" = "example-nodejs",
    "env"     = "dev"
  }

  build {
    use "pack" {}
    
    registry {
      use "docker" {
        image = image
        tag = tag
        username = registry_username
        password = registry_password
      }
    }
  }

  deploy {
    use "docker" {}
  }
}
