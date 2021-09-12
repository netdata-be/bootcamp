data "digitalocean_domain" "default" {
  name = var.do_domain
}

resource "digitalocean_vpc" "private" {
  name     = "bootcamp-${var.inuits_username}"
  region   = var.do_datacenter
  ip_range = "10.0.0.0/24"
}