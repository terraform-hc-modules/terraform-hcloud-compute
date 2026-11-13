## [0.6.0](https://github.com/terraform-hc-modules/terraform-hcloud-compute/compare/v0.5.0...v0.6.0) (2026-11-13)

### Breaking changes

* `modules/server` drops the `datacenter` input (removed from the Hetzner API on 2026-07-01 and from hcloud provider v1.67.0); `location` is always passed
* hcloud provider floor raised to `>= 1.58`

### Features

* `modules/server`, root and wrapper: `network` (inline network block with `network_id` or `subnet_id`, `ip`, `alias_ips`), `iso`, `rescue`, `ignore_remote_firewall_ids`, `timeouts` (`server_timeouts` on the root)
* `networks` gains `subnet_id`; `network_id` is optional when `subnet_id` is set
* `modules/snapshot`: `timeouts`
* new `modules/volume-attachment` for `hcloud_volume_attachment`

[#10](https://github.com/terraform-hc-modules/terraform-hcloud-compute/pull/10), [#11](https://github.com/terraform-hc-modules/terraform-hcloud-compute/pull/11), closes [#9](https://github.com/terraform-hc-modules/terraform-hcloud-compute/issues/9)

## [0.3.1](https://github.com/terraform-hc-modules/terraform-hcloud-compute/compare/v0.3.0...v0.3.1) (2026-04-20)


### Bug Fixes

* make terraform tests pass in CI ([1eb33fe](https://github.com/terraform-hc-modules/terraform-hcloud-compute/commit/1eb33fe06e8228e60d2cc325f73abc8c9175f639))

# [0.3.0](https://github.com/terraform-hc-modules/terraform-hcloud-compute/compare/v0.2.1...v0.3.0) (2026-04-20)


### Features

* add validations, richer outputs, docs, examples and tests ([f680da6](https://github.com/terraform-hc-modules/terraform-hcloud-compute/commit/f680da6500344a7d99bd231cebd9cff819275578))

## [0.2.1](https://github.com/terraform-hc-modules/terraform-hcloud-compute/compare/v0.2.0...v0.2.1) (2026-04-20)


### Bug Fixes

* examples now use root module with source = ../../ ([8abb3f1](https://github.com/terraform-hc-modules/terraform-hcloud-compute/commit/8abb3f125b1927776ac06d6938a8268b3759357e))

# [0.2.0](https://github.com/terraform-hc-modules/terraform-hcloud-compute/compare/v0.1.0...v0.2.0) (2026-04-20)


### Features

* add pre-commit, semantic-release, and improve examples ([062e365](https://github.com/terraform-hc-modules/terraform-hcloud-compute/commit/062e365494a97f3276b4189dd505621c62be2980))

# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [0.1.0] - 2026-04-20

### Added

- Initial release
- Core module functionality
- Basic and complete examples
- CI/CD with terraform validation, tflint, tfsec, checkov
- Wrappers for for_each usage

[0.1.0]: https://github.com/terraform-hc-modules/terraform-hcloud-compute/releases/tag/v0.1.0
