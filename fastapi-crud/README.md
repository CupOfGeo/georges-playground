This is a fastapi template im building that would be able to do basic crud operations

any and all code goes in the src folder. From there we have api which is the fast api itself. db for database and tests for tests....

This is all assuming you are in the crud-fastapi folder.


# run Locally
```sh
# start up the database
docker run --name postgres-test -e POSTGRES_PASSWORD=pass -e POSTGRES_USER=crud_fastapi_app -e POSTGRES_DB=crud_fastapi_db -p 5432:5432 -d postgres:15.3

# Then locally run flyway migrations
flyway -url=jdbc:postgresql://localhost:5432/crud_fastapi_db -user=crud_fastapi_app -password=pass -locations=filesystem:/Users/georgemazzeo/Code/georges-playground/crud-fastapi/migrations migrate

# Then build and run the app
docker build --target prod -t crud-fastapi:latest .
docker run --name api --restart always --env-file .env -p 8080:8080 crud-fastapi:latest
```

you can also run the app locally with
```sh
python -m src
```

# Dev / Staging
Staging environment will be a tiny CloudSQL Postgres database. Staging really should be a direct copy of prod which it kinda is but just much smaller machine size.

# Prod
:shrug:


# Tests
For running tests on your local machine.
- Run the unit tests pytest.
```sh
pytest -vv /tests/unit
```

- Run all with *you need to start a database for the integration tests.*
```sh
pytest -vv .
```
---
### My docker compose is extremely bugged right now might need to try agin after a restart something with .envs caching and the health checks don't work

## Running with docker-compose
```bash
docker-compose -f docker-compose.yml -f docker-compose.dev.yml --project-directory . up --build
```

## Running tests also bugged atm as it uses docker compose

If you want to run it in docker, simply run:

```bash
docker-compose -f docker-compose.yml -f docker-compose.dev.yml --project-directory . run --build --rm api pytest -vv .
docker-compose -f docker-compose.yml -f docker-compose.dev.yml --project-directory . down
```


# Notes
So I split the tests into integration and unit tests with the respected folders and have just the unit tests run.

New test.yaml just builds the dockerfile with --target test so no more having to go into the github action and change python versions and things. It does cd into the fastapi-crud folder.

This bring me to the biggest debate of do i want multiple services/deployments in one repo or do i want to make multiple repos.


I bought a domain for the cloud run.
In cloud run i clicked manage custom domains I registered georges-playground.com and added the mapping I also created a cloud DNS. It gave me some DNS records that you have to add to cloud DNS. In cloud DNS -> in the zone you just created you can add standard and add the `A` and `AAAA` records.

setting up https://cloud.google.com/blog/products/identity-security/enabling-keyless-authentication-from-github-actions

follow given commands then i also added the cloudsql.editor role
```sh
gcloud projects add-iam-policy-binding playground-geo \
    --member='serviceAccount:my-service-account@playground-geo.iam.gserviceaccount.com' \
    --role='roles/cloudsql.editor'
```

also for local connecting/ testing to the cloud sql database
2 ways to connect.
1) cloud-sql-proxy - how it used in the flyway migration action i like that i don't need to supply the ip
https://cloud.google.com/sql/docs/mysql/connect-auth-proxy#mac-m1
```
chmod +x cloud-sql-proxy
sudo mv cloud-sql-proxy /usr/local/bin/
```
connection arguments
```
-url=jdbc:postgresql://localhost:5432/crud_fastapi_app \
-user=crud_fastapi_app \
-password=${{ secrets.FASTAPI_CRUD_DB_PASS }} \
```

2)
```sh
gcloud sql connect crud-fastapi-db --user=postgres
```
then connect to your instances public ip as the host.


add cloud sql to the cloud run instance # TODO terraform this
https://cloud.google.com/sql/docs/postgres/connect-run#command-line
```sh
gcloud run services update hello-cloud-run \
--add-cloudsql-instances=playground-geo:us-central1:crud-fastapi-db
```
