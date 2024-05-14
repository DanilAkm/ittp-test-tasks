resource "yandex_compute_disk" "boot-disk" {
  name     = "boot-disk-1"
  type     = "network-hdd"
  zone     = var.def_zone
  size     = "20"
  image_id = "fd8982cg2ridrq7erf1u"
}

resource "yandex_compute_instance" "default" {
  name        = "test"
  platform_id = "standard-v1"
  zone        = var.def_zone

  resources {
    cores  = 2
    memory = 2
  }

  boot_disk {
    disk_id = yandex_compute_disk.boot-disk.id
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.boy.id
  }

  metadata = {
    ssh-keys = "boy:${file("~/.ssh/id_rsa.pub")}"
  }
}

resource "yandex_vpc_network" "boy" {}

resource "yandex_vpc_subnet" "boy" {
  zone           = var.def_zone
  network_id     = yandex_vpc_network.boy.id
  v4_cidr_blocks = ["10.5.0.0/24"]
}