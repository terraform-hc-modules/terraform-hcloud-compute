# Applies against a mock provider: checks the protection flags reach the server.
mock_provider "hcloud" {
  mock_resource "hcloud_server" {
    defaults = {
      id = "1001"
    }
  }
}

variables {
  name               = "test-protected"
  server_type        = "cx22"
  image              = "ubuntu-24.04"
  location           = "fsn1"
  delete_protection  = true
  rebuild_protection = true
}

run "protection_reaches_the_server" {
  command = apply

  assert {
    condition     = output.server.delete_protection && output.server.rebuild_protection
    error_message = "delete_protection and rebuild_protection must reach the server."
  }
}
