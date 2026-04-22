# Snapshot

Manages Hetzner Cloud Server Snapshots.

Part of [`terraform-hc-modules/compute/hcloud`](../../README.md). Prefer the root module for most use cases; use this submodule directly when you need fine-grained control over just snapshot resources.

## Usage

```hcl
module "snapshot" {
  source = "terraform-hc-modules/compute/hcloud//modules/snapshot"
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
| [hcloud_snapshot.this](https://registry.terraform.io/providers/hetznercloud/hcloud/latest/docs/resources/snapshot) | resource |

## Inputs

| Name | Description | Type | Default | Required |
| ---- | ----------- | ---- | ------- | :------: |
| <a name="input_create"></a> [create](#input\_create) | Whether to create the snapshot. | `bool` | `true` | no |
| <a name="input_description"></a> [description](#input\_description) | Description of the snapshot. | `string` | `null` | no |
| <a name="input_labels"></a> [labels](#input\_labels) | Labels to apply to the snapshot. | `map(string)` | `{}` | no |
| <a name="input_server_id"></a> [server\_id](#input\_server\_id) | Server ID to create snapshot from. | `number` | n/a | yes |

## Outputs

| Name | Description |
| ---- | ----------- |
| <a name="output_snapshot"></a> [snapshot](#output\_snapshot) | Snapshot attributes. |
| <a name="output_snapshot_id"></a> [snapshot\_id](#output\_snapshot\_id) | ID of the snapshot. |
<!-- END_TF_DOCS -->
