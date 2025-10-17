packer {
  required_plugins {
    yandex = {
      version = "~> 1"
      source  = "github.com/hashicorp/yandex"
    }
    ansible = {
      version = "~> 1"
      source  = "github.com/hashicorp/ansible"
    }
  }
}

source "yandex" "ubuntu-nginx" {
  folder_id           = "b1gocnsq4cqlrdbf36jc"
  source_image_family = "ubuntu-2204-lts"
  ssh_username        = "ubuntu"
  use_ipv4_nat        = "true"
  image_description   = "my custom ubuntu with nginx"
  image_family        = "ubuntu-2204-lts"
  image_name          = "my-ubuntu-nginx"
  subnet_id           = "fl8k1t5d3j0i37fosjna"
  disk_type           = "network-ssd"
  zone                = "ru-central1-d"
}

build {
  sources = ["source.yandex.ubuntu-nginx"]

  provisioner "ansible" {
    playbook_file = "./ansible/playbook.yml"
  }
}
