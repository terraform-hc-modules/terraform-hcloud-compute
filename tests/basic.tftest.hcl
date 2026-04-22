provider "hcloud" {
  token = "dummy"
}

variables {
  name        = "test-compute"
  server_type = "cx22"
  image       = "ubuntu-24.04"
  location    = "fsn1"

  labels = {
    test = "true"
  }

  create_ssh_key = false
  create_volume  = true
  volume_size    = 20
  volume_format  = "ext4"
}

run "plan_offline" {
  command = plan

  plan_options {
    refresh = false
  }
}
