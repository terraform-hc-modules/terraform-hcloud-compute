# Server

Manages Hetzner Cloud Servers.

Part of [`terraform-hc-modules/compute/hcloud`](../../README.md). Prefer the root module for most use cases; use this submodule directly when you need fine-grained control over just server resources.

## Usage

```hcl
module "server" {
  source = "terraform-hc-modules/compute/hcloud//modules/server"
  # version = "~> 0.1"

  # See inputs below.
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_hcloud"></a> [hcloud](#requirement\_hcloud) | >= 1.45 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_hcloud"></a> [hcloud](#provider\_hcloud) | >= 1.45 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [hcloud_rdns.this](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/rdns) | resource |
| [hcloud_server.this](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/server) | resource |
| [hcloud_server_network.this](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/server_network) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_allow_deprecated_images"></a> [allow\_deprecated\_images](#input\_allow\_deprecated\_images) | Allow deprecated images. | `bool` | `false` | no |
| <a name="input_backups"></a> [backups](#input\_backups) | Enable backups. | `bool` | `false` | no |
| <a name="input_create"></a> [create](#input\_create) | Whether to create the server. | `bool` | `true` | no |
| <a name="input_datacenter"></a> [datacenter](#input\_datacenter) | Datacenter (alternative to location). | `string` | `null` | no |
| <a name="input_delete_protection"></a> [delete\_protection](#input\_delete\_protection) | Enable delete protection. | `bool` | `false` | no |
| <a name="input_firewall_ids"></a> [firewall\_ids](#input\_firewall\_ids) | List of firewall IDs to attach. | `list(number)` | `[]` | no |
| <a name="input_image"></a> [image](#input\_image) | Image to use for the server. | `string` | `"ubuntu-24.04"` | no |
| <a name="input_keep_disk"></a> [keep\_disk](#input\_keep\_disk) | Keep disk on server downgrade. | `bool` | `false` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | Labels to apply to the server. | `map(string)` | `{}` | no |
| <a name="input_location"></a> [location](#input\_location) | Location of the server. | `string` | `"fsn1"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the server. | `string` | n/a | yes |
| <a name="input_networks"></a> [networks](#input\_networks) | List of networks to attach. | <pre>list(object({<br/>    network_id = number<br/>    ip         = optional(string)<br/>    alias_ips  = optional(list(string), [])<br/>  }))</pre> | `[]` | no |
| <a name="input_placement_group_id"></a> [placement\_group\_id](#input\_placement\_group\_id) | Placement group ID. | `number` | `null` | no |
| <a name="input_public_net"></a> [public\_net](#input\_public\_net) | Public network configuration. | <pre>object({<br/>    ipv4_enabled = optional(bool, true)<br/>    ipv6_enabled = optional(bool, true)<br/>    ipv4         = optional(number)<br/>    ipv6         = optional(number)<br/>  })</pre> | `{}` | no |
| <a name="input_rdns"></a> [rdns](#input\_rdns) | Reverse DNS entries. | <pre>list(object({<br/>    ip_address = string<br/>    dns_ptr    = string<br/>  }))</pre> | `[]` | no |
| <a name="input_rebuild_protection"></a> [rebuild\_protection](#input\_rebuild\_protection) | Enable rebuild protection. | `bool` | `false` | no |
| <a name="input_server_type"></a> [server\_type](#input\_server\_type) | Server type (e.g., cx22, cpx11). | `string` | `"cx22"` | no |
| <a name="input_shutdown_before_deletion"></a> [shutdown\_before\_deletion](#input\_shutdown\_before\_deletion) | Shutdown server before deletion. | `bool` | `false` | no |
| <a name="input_ssh_keys"></a> [ssh\_keys](#input\_ssh\_keys) | List of SSH key IDs or names. | `list(string)` | `[]` | no |
| <a name="input_user_data"></a> [user\_data](#input\_user\_data) | Cloud-init user data. | `string` | `null` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_ipv4_address"></a> [ipv4\_address](#output\_ipv4\_address) | IPv4 address of the server. |
| <a name="output_ipv6_address"></a> [ipv6\_address](#output\_ipv6\_address) | IPv6 address of the server. |
| <a name="output_network_attachments"></a> [network\_attachments](#output\_network\_attachments) | Map of server network attachments keyed by index. |
| <a name="output_network_ips"></a> [network\_ips](#output\_network\_ips) | Map of network IPs. |
| <a name="output_rdns"></a> [rdns](#output\_rdns) | Map of reverse DNS entries keyed by index. |
| <a name="output_server"></a> [server](#output\_server) | Server attributes. |
| <a name="output_server_id"></a> [server\_id](#output\_server\_id) | ID of the server. |
| <a name="output_server_name"></a> [server\_name](#output\_server\_name) | Name of the server. |
| <a name="output_status"></a> [status](#output\_status) | Status of the server. |
<!-- END_TF_DOCS -->
