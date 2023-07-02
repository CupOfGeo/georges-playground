I want to play with some terraform
Following this [getting started with gcp](https://registry.terraform.io/providers/hashicorp/google/latest/docs/guides/getting_startedz)

[gcp docs](https://cloud.google.com/docs/terraform/get-started-with-terraform)
- Create new gcp project : playground-geo
- Enable API's (compute engine, container registry, storage, ... )
- I made a Terraform service account and gave it basic editor role (not the least permissions' principle, but I'm trying)
- `terraform apply` to creat the tf-bucket that's in backend.tf
- Then I just added this to the top of the file and did `terraform init`.
```
terraform {
 backend "gcs" {
   bucket  = "terraform-state-geo"
   prefix  = "terraform/state"
 }
}
```
- It found the bucket and im now using it as a backend. I'm concerned that I
  1) Hard coded the name
  2) commented out the provider google part
but

- It's ok the name should be hardcoded

# Pre Commit Hooks
https://medium.com/slalom-build/pre-commit-hooks-for-terraform-9356ee6db882 \
TFLint, TFSec, Checkov, Terraform Docs, Terraform Fmt, Terraform Validate \
The .tflint.hcl file hold configs for TFLint

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_google"></a> [google](#provider\_google) | 4.32.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [google_storage_bucket.tf-bucket](https://registry.terraform.io/providers/hashicorp/google/latest/docs/resources/storage_bucket) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gcp_auth_file"></a> [gcp\_auth\_file](#input\_gcp\_auth\_file) | GCP authentication file | `string` | n/a | yes |
| <a name="input_gcp_project"></a> [gcp\_project](#input\_gcp\_project) | GCP project name | `string` | n/a | yes |
| <a name="input_gcp_region"></a> [gcp\_region](#input\_gcp\_region) | GCP region | `string` | n/a | yes |
| <a name="input_storage-class"></a> [storage-class](#input\_storage-class) | The storage class of the Storage Bucket to create | `string` | n/a | yes |
| <a name="input_tf-bucket-name"></a> [tf-bucket-name](#input\_tf-bucket-name) | The name of the Google Storage Bucket to create | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_gcp_bucket"></a> [gcp\_bucket](#output\_gcp\_bucket) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
