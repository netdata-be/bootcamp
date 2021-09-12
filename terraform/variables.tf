variable "do_api_token" {
  type =  string
  sensitive = true
}

variable "inuits_username" {
  type = string
}

variable "do_datacenter" {
  type = string
  default = "ams3"
}

variable "do_size" {
  type = string
  default = "s-1vcpu-1gb-amd"
}

variable "ssh_public_key" {
  type = string
}

variable "do_domain" {
  type = string
  default = "bootcamp.inuits.dev"
}