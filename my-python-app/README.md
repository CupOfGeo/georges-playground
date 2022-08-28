# Build, Tag and Push to gcr
```
docker build -t sample-flask-app .
docker tag sample-flask-app gcr.io/playground-geo/sample-flask-app
docker push gcr.io/playground-geo/sample-flask-app
```
