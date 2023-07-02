This is a fastapi template im building that would be able to do basic crud operations

any and all code goes in the src folder. From there we have api which is the fast api itself. db for database and tests for tests....

This is all assuming you are in the crud-fastapi folder.


# run Localy
```sh
# start up the database
docker run --name postgres-test -e POSTGRES_PASSWORD=pass -e POSTGRES_USER=crud_fastapi_app -e POSTGRES_DB=crud_fastapi_db -p 5432:5432 -d postgres:15.3

# Then locally run flyway migrations
flyway -url=jdbc:postgresql://localhost:5432/crud_fastapi_db -user=crud_fastapi_app -password=pass -locations=filesystem:/Users/georgemazzeo/Code/georges-playground/crud-fastapi/migrations migrate

# Then build and run the app
docker build --target prod -t crud-fastapi:latest .
docker run --name api --restart always --env-file .env -p 8080:8080 crud-fastapi:latest
```

you can also run the app localy with
```sh
python -m src
```


# My docker compose is extreamly buged right now might need to try agin after a restart something with .envs caching and the health checks dont work

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

For running tests on your local machine.
1. you need to start a database.

2. Run the pytest.
```bash
pytest -vv .
```
