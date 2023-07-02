# Run Tests
`pytest my-python-app/tests`


[comment]: <> (# <s> Build, Tag and Push to gcr* </s>)
[comment]: <> (docker build -t sample-flask-app .)
[comment]: <> (docker tag sample-flask-app gcr.io/playground-geo/sample-flask-app)
[comment]: <> (docker push gcr.io/playground-geo/sample-flask-app)

# Build, Tag and Push to Artifact Registry

We don't want to push to container registry we want to push to artifact registry I set up a repo in the console.
Along with a service account with Artifact Registry Admin

[Terraform?]: Use terraform to make the repo? \
[For Future?]: Restrict permissions more on the service account I don't want to dive into IAM shit right now.
Docs say to not even use a service account [From gcp docs](https://cloud.google.com/artifact-registry/docs/docker/authentication)
but it works.


```
docker build -t us-central1-docker.pkg.dev/playground-geo/test-flask-app-images/sample-flask-app .
docker push us-central1-docker.pkg.dev/playground-geo/test-flask-app-images/sample-flask-app
```
repo: us-central1-docker.pkg.dev/playground-geo/test-flask-app-images
artifact-registry@playground-geo.iam.gserviceaccount.com

Having so much fun with service accounts some commands
`gcloud auth list`

`gcloud auth activate-service-account artifact-registry@playground-geo.iam.gserviceaccount.com --key-file=secret/artifact-registry.json`

getting this error
```
denied: Permission "artifactregistry.repositories.downloadArtifacts" denied on resource "projects/playground-geo/locations/us-central1/repositories/test-flask-app-images" (or it may not exist)
```

trying this its working for both my account and the artifact-registry service account
```
gcloud auth configure-docker us-central1-docker.pkg.dev
```


# SECRETS shh
Added gcp <s>artifact-registry</s> test-service service account json to github secrets
it has these roles (permissions?)

    Cloud Run
      roles/run.admin
      roles/iam.serviceAccountUser     (to act as the Cloud Run runtime service account)

    Artifact Registry
      roles/artifactregistry.admin     (project or repository level)
