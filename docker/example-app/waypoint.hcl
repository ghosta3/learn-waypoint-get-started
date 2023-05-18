project = "example-nodejs"

app "example-nodejs" {
  labels = {
    "service" = "example-nodejs",
    "env"     = "dev"
  }

  build {
    use "pack" {}
    
    registry {
      use "docker" {
        image = var.image
        tag = var.tag
        username = var.registry_username
        password = var.registry_password
      }
    }
  }

  deploy {
    use "docker" {}
  }
}
