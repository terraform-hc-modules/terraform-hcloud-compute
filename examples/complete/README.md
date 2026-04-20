# Complete Example

This example demonstrates using all compute submodules together: server, volume, SSH key, and placement group.

## Usage

```hcl
module "ssh_key" {
  source = "terraform-hc-modules/compute/hcloud//modules/ssh-key"

  name       = "my-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

module "placement_group" {
  source = "terraform-hc-modules/compute/hcloud//modules/placement-group"

  name = "my-pg"
  type = "spread"
}

module "server" {
  source = "terraform-hc-modules/compute/hcloud//modules/server"

  name               = "my-server"
  server_type        = "cx22"
  image              = "ubuntu-22.04"
  location           = "nbg1"
  ssh_keys           = [module.ssh_key.name]
  placement_group_id = module.placement_group.id
  backups            = true
}

module "volume" {
  source = "terraform-hc-modules/compute/hcloud//modules/volume"

  name      = "my-volume"
  size      = 20
  location  = "nbg1"
  server_id = module.server.id
  automount = true
  format    = "ext4"
}
```

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0 |
| hcloud | >= 1.45 |

## Inputs

| Name | Description | Type | Required |
|------|-------------|------|----------|
| hcloud_token | Hetzner Cloud API token | `string` | yes |
| ssh_public_key | SSH public key content | `string` | yes |

## Outputs

| Name | Description |
|------|-------------|
| ssh_key_id | ID of the SSH key |
| ssh_key_fingerprint | Fingerprint of the SSH key |
| placement_group_id | ID of the placement group |
| placement_group_name | Name of the placement group |
| server_id | ID of the server |
| server_name | Name of the server |
| server_ipv4_address | IPv4 address of the server |
| server_ipv6_address | IPv6 address of the server |
| server_status | Status of the server |
| volume_id | ID of the volume |
| volume_name | Name of the volume |
| volume_linux_device | Linux device path of the volume |
