packer {
  required_plugins {
    digitalocean = {
      version = ">= 1.0.0"
      source  = "github.com/hashicorp/digitalocean"
    }
  }
}

source "digitalocean" "base_image" {
  api_token     = var.do_api_token
  image         = var.do_base_image
  region        = var.do_datacenter
  size          = var.do_size
  ssh_username  = "root"  
  droplet_name  = "base-${var.inuits_username}"
  snapshot_name = "base-${var.inuits_username}"
}

build {
  sources = ["source.digitalocean.base_image"]
}