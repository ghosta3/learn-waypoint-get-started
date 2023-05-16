variable "registry_username" {
  type = string
  default = ""
  env = ["REGISTRY_USERNAME"]
}

variable "registry_password" {
  type = string
  sensitive = true
  default = ""
  env = ["REGISTRY_PASSWORD"]
}

project = "nomad-nodejs"

app "nomad-nodejs-web" {
  build {
    use "pack" {}
    registry {
      use "docker" {
        image = "${var.registry_username}/nomad-nodejs-web"
        tag   = "1"
        local = false
        auth {
          username = var.registry_username
          password = var.registry_password
        }
      }
    }
  }

  deploy {
    use "nomad" {
      datacenter = "dc1"
      namespace  = "default"
      service_provider = "nomad"
    }
  }
}