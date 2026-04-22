provider "hcloud" {
  token = "dummy"
}

run "rejects_empty_name" {
  command = plan

  variables {
    name = ""
  }

  expect_failures = [
    var.name,
  ]
}

run "rejects_network_id_zero" {
  command = plan

  variables {
    name     = "test"
    networks = [{ network_id = 0 }]
  }

  expect_failures = [
    var.networks,
  ]
}

run "rejects_missing_public_key_when_creating_ssh_key" {
  command = plan

  variables {
    name           = "test"
    create_ssh_key = true
    public_key     = ""
  }

  expect_failures = [
    var.public_key,
  ]
}
