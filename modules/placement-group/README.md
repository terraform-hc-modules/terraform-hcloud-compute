# Placement Group

Manages Hetzner Cloud Placement Groups.

Part of [`terraform-hc-modules/compute/hcloud`](../../README.md). Prefer the root module for most use cases; use this submodule directly when you need fine-grained control over just placement-group resources.

## Usage

```hcl
module "placement-group" {
  source = "terraform-hc-modules/compute/hcloud//modules/placement-group"
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
| [hcloud_placement_group.this](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/placement_group) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_create"></a> [create](#input\_create) | Whether to create the placement group. | `bool` | `true` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | Labels to apply to the placement group. | `map(string)` | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | Name of the placement group. | `string` | n/a | yes |
| <a name="input_type"></a> [type](#input\_type) | Type of the placement group (spread). | `string` | `"spread"` | no |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_placement_group"></a> [placement\_group](#output\_placement\_group) | Placement group attributes. |
| <a name="output_placement_group_id"></a> [placement\_group\_id](#output\_placement\_group\_id) | ID of the placement group. |
| <a name="output_placement_group_name"></a> [placement\_group\_name](#output\_placement\_group\_name) | Name of the placement group. |
<!-- END_TF_DOCS -->
