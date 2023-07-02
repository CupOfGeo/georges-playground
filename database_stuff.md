#DB stuff

### les creat a postgres 14 database in container
https://hub.docker.com/_/postgres/
```sh
docker run -d --name postgres -p 5432:5432 -e POSTGRES_PASSWORD=pass -v postgres:/var/lib/postgresql/data postgres:14
```

### lets psql into it
```sh
docker exec -it postgres psql -U postgres
```

### well make a new database called test
```sql
CREATE DATABASE test;
```

### then well change into it you should get a new prompt test=#
```bash
\c test
```

database exsample

### Lets make a table called scrapes with some things
```sql
CREATE TABLE scrapes (
id SERIAL PRIMARY KEY,
name VARCHAR(255),
meta JSON
);
```


```sql
-- Insert test data into the 'scrapes' table
INSERT INTO scrapes (name, meta) VALUES
  ('Scrape 1', '{"key1": "value1", "key2": "value2"}'),
  ('Scrape 2', '{"key1": "value3", "key2": "value4"}'),
  ('Scrape 3', '{"key1": "value5", "key2": "value6"}'),
  ('Scrape 4', '{"key1": "value7", "key2": "value8"}'),
  ('Scrape 5', '{"key1": "value9", "key2": "value10"}');
```

```sql
select * from scrapes;
```

```sql
-- Create the 'another_table' table
CREATE TABLE another_table (
  id SERIAL PRIMARY KEY,
  scrapes_id INTEGER REFERENCES scrapes (id),
  valid BOOLEAN
);
```






```sql
-- List all tables in the current database
SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
  AND table_type = 'BASE TABLE';
```

```sql
-- Insert test data into the 'another_table'
INSERT INTO another_table (scrapes_id, valid) VALUES
  (1, TRUE),
 (2, FALSE);
 ```


flyway notes
you have to name the files V1__ V2 V3 ... so that it knows what order to apply them in


ok now let delete this container and start again with a migration
be sure you have flyway you can `brew install flyway` on mac
```sh
flyway -url=jdbc:postgresql://localhost:5432/test -user=postgres -password=pass -locations=filesystem:/Users/georgemazzeo/Code/ScrapingApp/db-migrations migrate
```
