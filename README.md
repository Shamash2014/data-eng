

# SQL queries


```sql
select 
    count(*)
from "taxi"
where DATE_TRUNC('DAY', lpep_pickup_datetime) 
BETWEEN '2019-10-1' and '2019-11-1' 
and trip_distance BETWEEN 1 and 3


```

```sql
select 
    count(*)
from "taxi"
where DATE_TRUNC('DAY', lpep_pickup_datetime) 
BETWEEN '2019-10-1' and '2019-11-1' 
and trip_distance > 1 and trip_distance < 3
```


```sql
select 
    count(*)
from "taxi"
where DATE_TRUNC('DAY', lpep_pickup_datetime) 
BETWEEN '2019-10-1' and '2019-11-1' 
and trip_distance > 3 and trip_distance < 5
```

```sql
select 
    count(*)
from "taxi"
where DATE_TRUNC('DAY', lpep_pickup_datetime) 
BETWEEN '2019-10-1' and '2019-11-1' 
and trip_distance > 5 and trip_distance < 10
```


```sql
select 
    count(*)
from "taxi"
where DATE_TRUNC('DAY', lpep_pickup_datetime) 
BETWEEN '2019-10-1' and '2019-11-1' 
and trip_distance > 10 
```


```sql
SELECT 
    z.*,
    COALESCE((
        SELECT SUM(total_amount)
        FROM taxi t
        WHERE t."PULocationID" = z."LocationID"
        and date_trunc('DAY', t.lpep_pickup_datetime) = '2019-10-18' 
    ), 0) as total_amount
FROM zones z
WHERE COALESCE((
        SELECT SUM(total_amount)
        FROM taxi t
        WHERE t."PULocationID" = z."LocationID"
        and date_trunc('DAY', t.lpep_pickup_datetime) = '2019-10-18' 
    ), 0) > 13000
ORDER BY total_amount DESC
limit 10
```

```sql

SELECT 
    z.*,
    COALESCE((
        SELECT MAX(t.tip_amount)
        FROM taxi t
        WHERE t."DOLocationID" = z."LocationID"
        and t."PULocationID" = 74
        and date_trunc('MONTH', t.lpep_pickup_datetime) = '2019-10-01' 
    ), 0) as total_amount
FROM zones z
ORDER BY total_amount DESC
limit 10

```

# Kestra

To run the container you could use `docker compose up -d`,
once database is running  - connect through `psql -h localhost -p 5432 -U postgres -d postgres` and run the query to create new database `kestra`: `CREATE DATABASE kestra;`

Than re-run docker compose again. Kestra should be working

Once kestra is running, please add three flows inside UI and run `kv` flow and gcp flow. After that noral backfill is possible


## BigQuery queries

```sql
SELECT count(*) FROM `terminus-401307.zoomcamp.yellow_tripdata` WHERE TIMESTAMP_TRUNC(tpep_pickup_datetime, DAY) > TIMESTAMP("2020-01-01") and TIMESTAMP_TRUNC(tpep_dropoff_datetime, DAY) < TIMESTAMP("2020-12-31")
```


```sql
SELECT count(*) FROM `terminus-401307.zoomcamp.green_tripdata` WHERE TIMESTAMP_TRUNC(lpep_pickup_datetime, DAY) > TIMESTAMP("2020-01-01") and TIMESTAMP_TRUNC(lpep_dropoff_datetime, DAY) < TIMESTAMP("2020-12-31")
```



# Bigquery


```sql
SELECT count(*)  FROM `terminus-401307.yellow_taxi.yellow_taxi_trips` 
```


```sql
SELECT count(distinct PULocationID)  FROM `terminus-401307.yellow_taxi.yellow_taxi_trips`
```

```sql
SELECT PULocationID  FROM `terminus-401307.yellow_taxi.yellow_taxi_trips`
```

```sql
SELECT  count(*) FROM `terminus-401307.yellow_taxi.yellow_taxi_trips` where fare_amount = 0
```

```sql
CREATE OR REPLACE TABLE `terminus-401307.yellow_taxi.optimized_table`
PARTITION BY DATE(tpep_dropoff_datetime)  
CLUSTER BY VendorID AS  
SELECT * FROM `terminus-401307.yellow_taxi.yellow_taxi_trips`
```

```sql
SELECT DISTINCT VendorID  
FROM `terminus-401307.yellow_taxi.optimized_table`
WHERE tpep_dropoff_datetime BETWEEN '2024-03-01' AND '2024-03-15';
```


```sql
CREATE OR REPLACE TABLE `terminus-401307.yellow_taxi.optimized_table`
PARTITION BY DATE(tpep_dropoff_datetime)  
CLUSTER BY VendorID AS  
SELECT * FROM `terminus-401307.yellow_taxi.yellow_taxi_trips`
```


