project = "example-nodejs"

app "example-nodejs" {
  labels = {
    "service" = "example-nodejs",
    "env"     = "dev"
  }

  build {
    use "pack" {}
  }

  deploy {
    use "docker" {}
  }
  
  runner {
    enabled = true

    data_source "git" {
      url  = "https://github.com/ghosta3/learn-waypoint-get-started.git"
      path = "docker/example-app"
    }
  }
}
