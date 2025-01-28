

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
