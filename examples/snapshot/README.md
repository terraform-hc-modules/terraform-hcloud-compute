# Snapshot Example

This example creates a server and a snapshot of it.

## Usage

```hcl
module "server" {
  source = "terraform-hc-modules/compute/hcloud//modules/server"

  name        = "my-server"
  server_type = "cx22"
  image       = "ubuntu-22.04"
  location    = "nbg1"
}

module "snapshot" {
  source = "terraform-hc-modules/compute/hcloud//modules/snapshot"

  server_id   = module.server.id
  description = "Snapshot of my-server"
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

## Outputs

| Name | Description |
|------|-------------|
| server_id | ID of the server |
| server_name | Name of the server |
| server_ipv4_address | IPv4 address of the server |
| snapshot_id | ID of the snapshot |
| snapshot_description | Description of the snapshot |
