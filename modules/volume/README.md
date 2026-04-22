# Volume

Manages Hetzner Cloud Volumes and server attachments.

Part of [`terraform-hc-modules/compute/hcloud`](../../README.md). Prefer the root module for most use cases; use this submodule directly when you need fine-grained control over just volume resources.

## Usage

```hcl
module "volume" {
  source = "terraform-hc-modules/compute/hcloud//modules/volume"
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
| [hcloud_volume.this](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/volume) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_automount"></a> [automount](#input\_automount) | Automount the volume. | `bool` | `false` | no |
| <a name="input_create"></a> [create](#input\_create) | Whether to create the volume. | `bool` | `true` | no |
| <a name="input_delete_protection"></a> [delete\_protection](#input\_delete\_protection) | Enable delete protection. | `bool` | `false` | no |
| <a name="input_format"></a> [format](#input\_format) | Format of the volume (ext4 or xfs). | `string` | `null` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | Labels to apply to the volume. | `map(string)` | `{}` | no |
| <a name="input_location"></a> [location](#input\_location) | Location of the volume. | `string` | `"fsn1"` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the volume. | `string` | n/a | yes |
| <a name="input_server_id"></a> [server\_id](#input\_server\_id) | Server ID to attach the volume to. | `number` | `null` | no |
| <a name="input_size"></a> [size](#input\_size) | Size of the volume in GB. | `number` | `10` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_linux_device"></a> [linux\_device](#output\_linux\_device) | Linux device path. |
| <a name="output_size"></a> [size](#output\_size) | Size of the volume in GB. |
| <a name="output_volume"></a> [volume](#output\_volume) | Volume attributes. |
| <a name="output_volume_id"></a> [volume\_id](#output\_volume\_id) | ID of the volume. |
| <a name="output_volume_name"></a> [volume\_name](#output\_volume\_name) | Name of the volume. |
<!-- END_TF_DOCS -->
