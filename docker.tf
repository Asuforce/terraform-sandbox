provider "docker" {
  host = "unix:///var/run/docker.sock"
}

variable "name" {
  default = "nginx"
}

resource "docker_image" "nginx" {
  name = "${var.name}:alpine"
}

resource "docker_container" "nginx" {
  name  = "my-${var.name}"
  image = "${docker_image.nginx.latest}"

  ports {
    internal = 80
    external = 8080
  }
}
