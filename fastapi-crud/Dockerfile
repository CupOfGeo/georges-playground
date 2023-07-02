### PROD ###
FROM python:3.10-slim-buster as prod
RUN apt-get update \
    && apt-get -y install libpq-dev gcc \
    && pip install psycopg2
# Set the working directory to /app
WORKDIR /app

COPY requirements.txt requirements.txt

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

# Copy the current directory contents into the container at /app
COPY . /app

# Make port 8000 available to the world outside this container
EXPOSE 8000

# Run app.py when the container launches
CMD ["python", "-m", "src"]

### TEST ###
FROM python:3.10-slim-buster as test
RUN apt-get update \
    && apt-get -y install libpq-dev gcc \
    && pip install psycopg2
# Set the working directory to /app
WORKDIR /app

COPY requirements.txt requirements.txt

# Install any needed packages specified in requirements.txt
RUN pip install --trusted-host pypi.python.org -r requirements.txt

ARG FASTAPI_CRUD_DB_PASS
ARG FASTAPI_CRUD_DB_HOST

# Copy the current directory contents into the container at /app
COPY . /app

# Run app.py when the container launches
RUN pytest -vv src/tests/unit
