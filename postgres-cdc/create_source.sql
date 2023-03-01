create table person (
    "id" int,
    "name" varchar,
    "email_address" varchar,
    "credit_card" varchar,
    "city" varchar,
    "date_time" bigint,
    PRIMARY KEY ("id")
) with (
    connector = 'postgres-cdc',
    hostname = 'postgres',
    port = '5432',
    username = 'myuser',
    password = '123456',
    database.name = 'mydb',
    schema.name = 'public',
    table.name = 'person',
    slot.name = 'person'
);

CREATE SOURCE auction (
    id BIGINT,
    item_name VARCHAR,
    date_time BIGINT,
    seller INT,
    category INT
) WITH (
    connector = 'kafka',
    topic = 'auction',
    properties.bootstrap.server = 'message_queue:29092',
    scan.startup.mode = 'earliest'
) ROW FORMAT JSON;