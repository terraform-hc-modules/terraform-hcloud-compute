# Applies against a mock provider: checks the inline network block and the
# volume-attachment submodule pass their arguments through.
mock_provider "hcloud" {
  mock_resource "hcloud_server" {
    defaults = {
      id = "1001"
    }
  }

  mock_resource "hcloud_volume_attachment" {
    defaults = {
      id = "3001"
    }
  }
}

run "server_inline_network_block" {
  command = apply

  module {
    source = "./modules/server"
  }

  variables {
    name     = "test-network"
    location = "fsn1"
    network = [{
      network_id = 2001
      ip         = "10.0.1.10"
      alias_ips  = ["10.0.1.11"]
    }]
    networks = [{
      subnet_id = "2002-10.0.2.0/24"
    }]
    timeouts = { create = "30m" }
  }

  assert {
    condition     = one(hcloud_server.this[0].network).network_id == 2001 && one(hcloud_server.this[0].network).ip == "10.0.1.10"
    error_message = "The inline network block must reach the server."
  }

  assert {
    condition     = hcloud_server_network.this["0"].subnet_id == "2002-10.0.2.0/24"
    error_message = "subnet_id must reach hcloud_server_network."
  }

  assert {
    condition     = hcloud_server.this[0].timeouts.create == "30m"
    error_message = "timeouts must reach the server."
  }
}

run "volume_attachment" {
  command = apply

  module {
    source = "./modules/volume-attachment"
  }

  variables {
    server_id = 1001
    volume_id = 4001
    automount = true
  }

  assert {
    condition     = output.attachment.server_id == 1001 && output.attachment.volume_id == 4001 && output.attachment.automount
    error_message = "The volume attachment must use the given server, volume and automount."
  }
}

run "rejects_network_without_id_or_subnet" {
  command = plan

  variables {
    name    = "test"
    network = [{ ip = "10.0.1.10" }]
  }

  expect_failures = [
    var.network,
  ]
}
