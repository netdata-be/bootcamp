resource "digitalocean_droplet" "app" {
  count              = 1
  name               = format("bootcamp-%s-app%02d", var.inuits_username, count.index + 1)
  image              = data.digitalocean_image.base.image
  ssh_keys           = [ digitalocean_ssh_key.default.fingerprint ]
  region             = var.do_datacenter
  private_networking = "true"
  vpc_uuid           = digitalocean_vpc.private.id
  size               = var.do_size
}

resource "digitalocean_record" "app" {
  count  = 1
  domain = data.digitalocean_domain.default.name
  type   = "A"
  ttl    = 60
  name   = element(digitalocean_droplet.app.*.name, count.index)
  value  = element(digitalocean_droplet.app.*.ipv4_address, count.index)
}
