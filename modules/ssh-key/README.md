# Ssh Key

Manages Hetzner Cloud SSH Keys.

Part of [`terraform-hc-modules/compute/hcloud`](../../README.md). Prefer the root module for most use cases; use this submodule directly when you need fine-grained control over just ssh-key resources.

## Usage

```hcl
module "ssh-key" {
  source = "terraform-hc-modules/compute/hcloud//modules/ssh-key"
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
| [hcloud_ssh_key.this](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/ssh_key) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_create"></a> [create](#input\_create) | Whether to create the SSH key. | `bool` | `true` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | Labels to apply to the SSH key. | `map(string)` | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the SSH key. | `string` | n/a | yes |
| <a name="input_public_key"></a> [public\_key](#input\_public\_key) | The public key content. | `string` | n/a | yes |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_fingerprint"></a> [fingerprint](#output\_fingerprint) | Fingerprint of the SSH key. |
| <a name="output_ssh_key"></a> [ssh\_key](#output\_ssh\_key) | SSH key attributes. |
| <a name="output_ssh_key_id"></a> [ssh\_key\_id](#output\_ssh\_key\_id) | ID of the SSH key. |
| <a name="output_ssh_key_name"></a> [ssh\_key\_name](#output\_ssh\_key\_name) | Name of the SSH key. |
<!-- END_TF_DOCS -->
