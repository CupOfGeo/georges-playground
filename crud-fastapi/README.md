This is all assuming you are in the crud-fastapi folder.

docker build -t api2post .
docker run -e TEST_POSTGRES_PASSWORD=XXX -p 80:80 api2post


docker tag api2post us-central1-docker.pkg.dev/playground-geo/autio-transcription-services/api2post
docker push us-central1-docker.pkg.dev/playground-geo/autio-transcription-services/api2post


This is a fastapi template im building that would be able to do basic crud operations

any and all code goes in the src folder. From there we have api which is the fast api itself. db for database and tests for tests....

## Running with docker-compose 
```bash
docker-compose -f docker-compose.yml -f docker-compose.dev.yml --project-directory . up --build
```

## Running tests

If you want to run it in docker, simply run:

```bash
docker-compose -f docker-compose.yml -f docker-compose.dev.yml --project-directory . run --build --rm api pytest -vv .
docker-compose -f docker-compose.yml -f docker-compose.dev.yml --project-directory . down
```

For running tests on your local machine.
1. you need to start a database.

I prefer doing it with docker:
```
docker run -p "5432:5432" -e "POSTGRES_PASSWORD=pass" -e "POSTGRES_USER=george" -e "POSTGRES_DB=app" postgres:14
```


2. Run the pytest.
```bash
pytest -vv .
```