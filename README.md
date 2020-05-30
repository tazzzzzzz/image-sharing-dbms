## Getting Started
Run the below given commands on an instance of a mysql server. 

## DDL Script:
For creating the database, and setting up the relations, run `source ./DDL.sql`

## Inserting Data:
For inserting the data into the tables, copy the below commands, and paste them directly onto the server-cli.
<pre>
source ./insert/insert_1users.sql
source ./insert/insert_2follows.sql
source ./insert/insert_3tags.sql
source ./insert/insert_4locations.sql
source ./insert/insert_5photos.sql
source ./insert/insert_6likes.sql
source ./insert/insert_7comments.sql
source ./insert/insert_8photo_tags.sql
source ./insert/insert_9photo_locations.sql
</pre>

You can view and verify the tables that have been created by running `show tables;`

## Setting up Triggers:
<pre>
source ./triggers/prevent_self_follows.sql
source ./triggers/unfollows.sql
</pre>
You can view and verify the triggers that have been set up by running `show triggers;`

## Running Queries:
<pre>
source ./queries/1.sql
source ./queries/2.sql
source ./queries/3.sql
source ./queries/4.sql
source ./queries/5.sql
source ./queries/6.sql
source ./queries/7.sql
</pre>
