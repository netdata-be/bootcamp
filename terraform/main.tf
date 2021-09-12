provider "digitalocean" {
  token = var.do_api_token
}

data "digitalocean_image" "base" {
  name = "base-${var.inuits_username}"
}

resource "digitalocean_ssh_key" "default" {
  name       = "labs-${var.inuits_username}"
  public_key = var.ssh_public_key
}