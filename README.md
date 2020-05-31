## Functional Dependencies
### users
*      id -> {username, age, gender, password_hash, created_at}
*      username -> {id, age, gender, password_hash, created_at}

### tags
*     id -> {tag_name, created_at}
*     tag_name -> {id, created_at}

### locations
*      id -> {location_name, created_at}
*      location_name -> {id, created_at}

### photos
*      id -> {image_url, user_id, caption, created_at}

### comments
*      id -> {comment_text, photo_id, user_id, created_at}





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
source ./triggers/prevent_self_follows.sql
source ./triggers/unfollows.sql
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
