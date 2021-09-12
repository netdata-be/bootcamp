resource "digitalocean_droplet" "web" {
  count              = 2
  name               = format("bootcamp-%s-web%02d", var.inuits_username, count.index + 1)
  image              = data.digitalocean_image.base.image
  ssh_keys           = [ digitalocean_ssh_key.default.fingerprint ]
  region             = var.do_datacenter
  private_networking = "true"
  vpc_uuid           = digitalocean_vpc.private.id
  size               = var.do_size
}

resource "digitalocean_record" "web" {
  count  = 2
  domain = data.digitalocean_domain.default.name
  type   = "A"
  ttl    = 60
  name   = element(digitalocean_droplet.web.*.name, count.index)
  value  = element(digitalocean_droplet.web.*.ipv4_address, count.index)
}
