# Database for an Image Sharing Platform
Database for an Image Sharing platform (dubbed image-share), as the name suggests, is a database designed for providing SQL-database support for an image sharing platform.

## Documentation
Detailed documentation, and explanation of the database model and all its respective features (along with some examples of execution), can be found [here](image-share.pdf).

## Getting Started
Run the below given commands on an instance of a mysql server. 

## DDL Script
For creating the database, and setting up the relations, run `source ./DDL.sql`
You can view and verify the tables that have been created by running `show tables;`

## Inserting Data
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

## Setting up Triggers
<pre>
source ./triggers/capture_unfollow.sql
source ./triggers/prevent_self_follows.sql
</pre>
You can view and verify the triggers that have been set up by running `show triggers;`

## Running Queries
<pre>
source ./queries/1.sql
source ./queries/2.sql
source ./queries/3.sql
source ./queries/4.sql
source ./queries/5.sql
source ./queries/6.sql
source ./queries/7.sql
source ./queries/8.sql
</pre>

## Previous work and due credits
This work was motivated by the database design and techniques adopted and taught by <a href='https://github.com/Colt'>Colt</a>. <br>However, it is to be noted that, although initially inspiration was drawn from the above-mentioned source, significant changes have been made to the database model and structure.