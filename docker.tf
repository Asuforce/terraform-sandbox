provider "docker" {
  host = "unix:///var/run/docker.sock"
}

resource "docker_image" "nginx" {
  name = "nginx:alpine"
}

resource "docker_container" "nginx" {
  name  = "my-nginx"
  image = "${docker_image.nginx.latest}"

  ports {
    internal = 80
    external = 8080
  }
}
