## DDL Script:
source ./DDL.sql

## Inserting Data:
source ./insert/insert_1users.sql
source ./insert/insert_2follows.sql
source ./insert/insert_3tags.sql
source ./insert/insert_4locations.sql
source ./insert/insert_5photos.sql
source ./insert/insert_6likes.sql
source ./insert/insert_7comments.sql
source ./insert/insert_8photo_tags.sql
source ./insert/insert_9photo_locations.sql

show tables;

## Setting up Triggers:
source ./triggers/prevent_self_follows.sql
source ./triggers/unfollows.sql

show triggers;

## Running Queries:
source ./queries/1.sql
source ./queries/2.sql
source ./queries/3.sql
source ./queries/4.sql
source ./queries/5.sql
source ./queries/6.sql
source ./queries/7.sql

