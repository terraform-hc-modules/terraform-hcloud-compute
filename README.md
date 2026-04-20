# Hetzner Cloud Compute Module

[![Terraform](https://img.shields.io/badge/Terraform-%3E%3D1.0-blueviolet)](https://www.terraform.io/)
[![License: MPL-2.0](https://img.shields.io/badge/License-MPL--2.0-blue.svg)](https://opensource.org/licenses/MPL-2.0)
[![CI](https://github.com/terraform-hc-modules/terraform-hcloud-compute/actions/workflows/ci.yml/badge.svg)](https://github.com/terraform-hc-modules/terraform-hcloud-compute/actions/workflows/ci.yml)
[![Release](https://img.shields.io/github/v/release/terraform-hc-modules/terraform-hcloud-compute)](https://github.com/terraform-hc-modules/terraform-hcloud-compute/releases)


Terraform module for compute resources on Hetzner Cloud including Server, Volume, SSH Key, Placement Group, and Snapshot.

## Usage

### Complete Example

```hcl
module "compute" {
  source  = "terraform-hc-modules/compute/hcloud"
  version = "~> 0.1"

  name        = "my-server"
  server_type = "cx22"
  image       = "ubuntu-24.04"
  location    = "fsn1"

  create_ssh_key = true
  public_key     = file("~/.ssh/id_rsa.pub")

  create_volume   = true
  volume_size     = 50
  volume_format   = "ext4"
  volume_automount = true

  create_placement_group = true

  labels = {
    Environment = "production"
  }
}
```

### Using Submodules Individually

```hcl
# Server only
module "server" {
  source  = "terraform-hc-modules/compute/hcloud//modules/server"
  version = "~> 0.1"

  name        = "my-server"
  server_type = "cx22"
  image       = "ubuntu-24.04"
}

# SSH Key only
module "ssh_key" {
  source  = "terraform-hc-modules/compute/hcloud//modules/ssh-key"
  version = "~> 0.1"

  name       = "my-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

# Volume only
module "volume" {
  source  = "terraform-hc-modules/compute/hcloud//modules/volume"
  version = "~> 0.1"

  name     = "my-volume"
  size     = 50
  location = "fsn1"
}
```

## Submodules

| Module | Description |
|--------|-------------|
| [server](modules/server) | Server with network attachments and rDNS |
| [volume](modules/volume) | Block storage volumes |
| [ssh-key](modules/ssh-key) | SSH keys |
| [placement-group](modules/placement-group) | Anti-affinity groups |
| [snapshot](modules/snapshot) | Server snapshots |

## Examples

- [Simple](examples/simple) - Server only
- [Complete](examples/complete) - Server + Volume + SSH Key + Placement Group
- [Snapshot](examples/snapshot) - Server with snapshot

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_hcloud"></a> [hcloud](#requirement\_hcloud) | >= 1.45 |

## Providers

No providers.

## Modules

| Name | Source | Version |
| ---- | ------ | ------- |
| <a name="module_placement_group"></a> [placement\_group](#module\_placement\_group) | ./modules/placement-group | n/a |
| <a name="module_server"></a> [server](#module\_server) | ./modules/server | n/a |
| <a name="module_ssh_key"></a> [ssh\_key](#module\_ssh\_key) | ./modules/ssh-key | n/a |
| <a name="module_volume"></a> [volume](#module\_volume) | ./modules/volume | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_name"></a> [name](#input\_name) | Name of the server. | `string` | n/a | yes |
| <a name="input_backups"></a> [backups](#input\_backups) | Enable backups. | `bool` | `false` | no |
| <a name="input_create_placement_group"></a> [create\_placement\_group](#input\_create\_placement\_group) | Whether to create a placement group. | `bool` | `false` | no |
| <a name="input_create_server"></a> [create\_server](#input\_create\_server) | Whether to create the server. | `bool` | `true` | no |
| <a name="input_create_ssh_key"></a> [create\_ssh\_key](#input\_create\_ssh\_key) | Whether to create an SSH key. | `bool` | `false` | no |
| <a name="input_create_volume"></a> [create\_volume](#input\_create\_volume) | Whether to create a volume. | `bool` | `false` | no |
| <a name="input_firewall_ids"></a> [firewall\_ids](#input\_firewall\_ids) | Firewall IDs to attach. | `list(number)` | `[]` | no |
| <a name="input_image"></a> [image](#input\_image) | Image to use. | `string` | `"ubuntu-24.04"` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | Labels to apply. | `map(string)` | `{}` | no |
| <a name="input_location"></a> [location](#input\_location) | Location. | `string` | `"fsn1"` | no |
| <a name="input_networks"></a> [networks](#input\_networks) | Networks to attach. | <pre>list(object({<br/>    network_id = number<br/>    ip         = optional(string)<br/>    alias_ips  = optional(list(string), [])<br/>  }))</pre> | `[]` | no |
| <a name="input_placement_group_name"></a> [placement\_group\_name](#input\_placement\_group\_name) | Name of the placement group. | `string` | `null` | no |
| <a name="input_placement_group_type"></a> [placement\_group\_type](#input\_placement\_group\_type) | Type of the placement group. | `string` | `"spread"` | no |
| <a name="input_public_key"></a> [public\_key](#input\_public\_key) | Public key content. | `string` | `""` | no |
| <a name="input_server_type"></a> [server\_type](#input\_server\_type) | Server type. | `string` | `"cx22"` | no |
| <a name="input_ssh_key_name"></a> [ssh\_key\_name](#input\_ssh\_key\_name) | Name of the SSH key. | `string` | `null` | no |
| <a name="input_ssh_keys"></a> [ssh\_keys](#input\_ssh\_keys) | SSH key IDs or names. | `list(string)` | `[]` | no |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | Cloud-init user data. | `string` | `null` | no |
| <a name="input_volume_automount"></a> [volume\_automount](#input\_volume\_automount) | Automount the volume. | `bool` | `false` | no |
| <a name="input_volume_format"></a> [volume\_format](#input\_volume\_format) | Format of the volume. | `string` | `null` | no |
| <a name="input_volume_name"></a> [volume\_name](#input\_volume\_name) | Name of the volume. | `string` | `null` | no |
| <a name="input_volume_size"></a> [volume\_size](#input\_volume\_size) | Size of the volume in GB. | `number` | `10` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_ipv4_address"></a> [ipv4\_address](#output\_ipv4\_address) | IPv4 address of the server. |
| <a name="output_ipv6_address"></a> [ipv6\_address](#output\_ipv6\_address) | IPv6 address of the server. |
| <a name="output_placement_group"></a> [placement\_group](#output\_placement\_group) | Placement group attributes. |
| <a name="output_placement_group_id"></a> [placement\_group\_id](#output\_placement\_group\_id) | ID of the placement group. |
| <a name="output_server"></a> [server](#output\_server) | Server attributes. |
| <a name="output_server_id"></a> [server\_id](#output\_server\_id) | ID of the server. |
| <a name="output_server_name"></a> [server\_name](#output\_server\_name) | Name of the server. |
| <a name="output_server_network_attachments"></a> [server\_network\_attachments](#output\_server\_network\_attachments) | Map of server network attachments keyed by index. |
| <a name="output_server_rdns"></a> [server\_rdns](#output\_server\_rdns) | Map of server reverse DNS entries keyed by index. |
| <a name="output_ssh_key"></a> [ssh\_key](#output\_ssh\_key) | SSH key attributes. |
| <a name="output_ssh_key_fingerprint"></a> [ssh\_key\_fingerprint](#output\_ssh\_key\_fingerprint) | Fingerprint of the SSH key. |
| <a name="output_ssh_key_id"></a> [ssh\_key\_id](#output\_ssh\_key\_id) | ID of the SSH key. |
| <a name="output_volume"></a> [volume](#output\_volume) | Volume attributes. |
| <a name="output_volume_id"></a> [volume\_id](#output\_volume\_id) | ID of the volume. |
| <a name="output_volume_linux_device"></a> [volume\_linux\_device](#output\_volume\_linux\_device) | Linux device path of the volume. |
<!-- END_TF_DOCS -->

## License

Mozilla Public License 2.0 - see [LICENSE](LICENSE)
