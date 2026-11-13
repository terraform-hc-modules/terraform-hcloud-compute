# Volume Attachment

Attaches an existing Hetzner Cloud Volume to a server.

Part of [`terraform-hc-modules/compute/hcloud`](../../README.md). Use this submodule when the volume and server are managed separately, for example to move a volume between servers.

## Usage

```hcl
module "volume_attachment" {
  source = "terraform-hc-modules/compute/hcloud//modules/volume-attachment"
  # version = "~> 0.1"

  server_id = 123456
  volume_id = 654321
  automount = true
}
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
| ---- | ------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_hcloud"></a> [hcloud](#requirement\_hcloud) | >= 1.58 |

## Providers

| Name | Version |
| ---- | ------- |
| <a name="provider_hcloud"></a> [hcloud](#provider\_hcloud) | >= 1.58 |

## Modules

No modules.

## Resources

| Name | Type |
| ---- | ---- |
| [hcloud_volume_attachment.this](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/volume_attachment) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_server_id"></a> [server\_id](#input\_server\_id) | Server ID to attach the volume to. | `number` | n/a | yes |
| <a name="input_volume_id"></a> [volume\_id](#input\_volume\_id) | Volume ID to attach. | `number` | n/a | yes |
| <a name="input_automount"></a> [automount](#input\_automount) | Automount the volume on the server. | `bool` | `false` | no |
| <a name="input_create"></a> [create](#input\_create) | Whether to create the volume attachment. | `bool` | `true` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_attachment"></a> [attachment](#output\_attachment) | Volume attachment attributes. |
| <a name="output_attachment_id"></a> [attachment\_id](#output\_attachment\_id) | ID of the volume attachment. |
<!-- END_TF_DOCS -->
