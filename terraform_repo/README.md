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
