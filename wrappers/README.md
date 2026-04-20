# Wrappers Module

This wrapper module allows creating multiple compute resources using a single module block with `for_each`.

## Usage

```hcl
module "compute" {
  source = "terraform-hc-modules/compute/hcloud//wrappers"

  items = {
    web-1 = {
      server_type = "cx22"
      image       = "ubuntu-22.04"
      location    = "nbg1"
      backups     = true
      labels = {
        role = "web"
      }
    }
    web-2 = {
      server_type = "cx22"
      image       = "ubuntu-22.04"
      location    = "fsn1"
      backups     = true
      labels = {
        role = "web"
      }
    }
    db-1 = {
      server_type   = "cx32"
      image         = "ubuntu-22.04"
      location      = "nbg1"
      create_volume = true
      volume_size   = 100
      volume_format = "ext4"
      labels = {
        role = "database"
      }
    }
  }
}
```

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0 |
| hcloud | >= 1.45 |

## Inputs

| Name | Description | Type | Default |
|------|-------------|------|---------|
| items | Map of compute configurations to create | `any` | `{}` |

## Outputs

| Name | Description |
|------|-------------|
| wrapper | Map of all created compute resources |
