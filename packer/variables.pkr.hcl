variable "do_api_token" {
  type =  string
  sensitive = true
}

variable "do_base_image" {
  type = string
  default = "centos-stream-8-x64"
}

variable "do_size" {
  type = string
  default = "s-1vcpu-1gb-amd"
}

variable "inuits_username" {
  type = string
}

variable "do_datacenter" {
  type = string
  default = "ams3"
}