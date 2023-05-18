project = "example-nodejs"

app "example-nodejs" {
  labels = {
    "service" = "example-nodejs",
    "env"     = "dev"
  }

  build {
    use "pack" {}
    
    registry {
      use "docker" {}
    }
  }

  deploy {
    use "docker" {}
  }
}
