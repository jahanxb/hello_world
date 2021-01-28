provider "google" {
  version = "3.5.0"

  credentials = file("conf/universalvpn-a09c5d3ba0bf.json")
  #note that credential file is not included so please add your credential file for GCP
  project = "universalvpn"
  region  = "us-central1"
  zone    = "us-central1-a"
}
resource "google_compute_global_address" "default" {
  name = "global-appserver-ip"
}
resource "google_compute_network" "default" {
  name = "my-network"
}

resource "google_compute_subnetwork" "default" {
  name          = "my-subnet"
  ip_cidr_range = "10.0.0.0/16"
  region        = "us-central1"
  network       = google_compute_network.default.id
}

resource "google_compute_address" "internal_with_subnet_and_address" {
  name         = "my-internal-address"
  subnetwork   = google_compute_subnetwork.default.id
  address_type = "INTERNAL"
  address      = "10.0.42.42"
  region       = "us-central1"
}
resource "google_compute_address" "static" {
  name = "ipv4-address"
}
resource "google_compute_firewall" "allow_http" {
  name = "allow-http-rule"
  network = "default"
  allow {
    ports = [
      "80",
      "8080",
      "1000-9999"]
    protocol = "tcp"
  }
  target_tags = [
    "allow-http"]
  priority = 1000
}



resource "google_compute_instance" "hello_app_server" {
  name = "wiredcraft-terraform-server"
  machine_type = "n1-standard-4"
  min_cpu_platform = "Intel Haswell"
  tags = ["http-server","https-server"]
  provisioner "file" {
    source      = "conf/install.sh"
    destination = "/home/jahan/install.sh"
    connection {
    type     = "ssh"
    user     = "jahan"
    host     = google_compute_address.static.address
    private_key = file("conf/private_key")
      timeout     = "2m"
      agent       = false
  }
  }


  provisioner "remote-exec" {
    inline = [
      "ls",
      "sudo chmod +x /home/jahan/install.sh",
      "sed -i -e 's/\r$//'  /home/jahan/install.sh",
      "sudo /home/jahan/install.sh",
    ]
    connection {
    type     = "ssh"
    user     = "jahan"
    host     = google_compute_address.static.address
    private_key = file("conf/private_key")
      timeout     = "1m"
      agent       = false
  }
  }

  boot_disk {
    initialize_params {
      image = "ubuntu-os-cloud/ubuntu-1604-lts"
    }
  }
  network_interface {
    network = "default"
    access_config {
      nat_ip = google_compute_address.static.address
    }
  }


}