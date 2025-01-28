import pandas as pd
from sqlalchemy import create_engine


def ingest():
    engine = create_engine(
        "postgresql://postgres:postgres@db:5432/ny_taxi", echo=True
    )
    df = pd.read_csv("green_tripdata_2019-10.csv.gz")

    df.lpep_pickup_datetime = pd.to_datetime(df.lpep_pickup_datetime)
    df.lpep_dropoff_datetime = pd.to_datetime(df.lpep_dropoff_datetime)

    df.to_sql("taxi", engine, if_exists="replace", index=False)


def ingest_zones():
    engine = create_engine(
        "postgresql://postgres:postgres@db:5432/ny_taxi", echo=True
    )

    df = pd.read_csv("taxi_zone_lookup.csv")
    df.to_sql("zones", engine, if_exists="replace", index=False)


if __name__ == "__main__":
    ingest()
    ingest_zones()
