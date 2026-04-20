# Simple Server Example

This example creates a basic Hetzner Cloud server.

## Usage

```hcl
module "server" {
  source = "terraform-hc-modules/compute/hcloud//modules/server"

  name        = "simple-server"
  server_type = "cx22"
  image       = "ubuntu-22.04"
  location    = "nbg1"

  labels = {
    environment = "dev"
    managed_by  = "terraform"
  }
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
| server_ipv6_address | IPv6 address of the server |
| server_status | Status of the server |
