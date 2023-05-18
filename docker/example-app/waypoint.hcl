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
        image = "example-nodejs"
        tag = "latest"
        local = true
      }
    }
  }

  deploy {
    use "docker" {}
  }
}
