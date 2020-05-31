## Functional Dependencies
#### users
*      id → {username, age, gender, password_hash, created_at}
*      username → {id, age, gender, password_hash, created_at}

#### tags
*     id → {tag_name, created_at}
*     tag_name → {id, created_at}

#### locations
*      id →  {location_name, created_at}
*      location_name →  {id, created_at}

#### photos
*      id → {image_url, user_id, caption, created_at}

#### comments
*      id → {comment_text, photo_id, user_id, created_at}

## Normalization

#### 1NF
1.  All columns contain only atomic values. (ER-to-Relational Mapping Algorithm ensures that all the multivalued attributes will be
converted into a new set of independent table)
2.  All columns contain only values of the same type (by virtue of data types defined for attributes).
3.  All columns have a unique name.
4.  The order of data storage isn't prioritized, and doesn't matter.
Thus, 1NF is satisfied.

#### 2NF
1.  1NF has been enforced.
2.  It has been ensured that no partial dependencies arise in all the relations that effectuate composite primary keys, i.e., the relations - likes, follows, photo_tags, and photo_locations.
Thus, all the required conditions for 2NF have been met.

#### 3NF
1.  2NF has been enforced.
2.  It has been ensured that no attributes depend upon non-prime attributes. Thus, no transitive dependencies are observed.
Thus, 3NF can be observed to be followed.

#### BCNF
1.  3NF has been enforced.
2.  In all the relations that require a composite primary key, no non-prime attribute can be used to derive the any part of the composite key, i.e., a candidate key.
Thus, BCNF is expected to be enforced.

#### 4NF
1.  BCNF has been enforced.
2.  All the relations either have a single primary key. Relations that have composite keys, do not exhibit multi-valued dependency (due to lack of independent attributes (since B,C are expected to be dependent for multi-value dependency to be observed between A,B,C)), or have only two columns.
Thus, it can be inferred that 4NF is in place.

#### 5NF and Lossless Decomposition
1.  4NF has been enforced.
2.  A few relations, have been decomposed into more relations, in an attempt to follow the previously mentioned normal forms. However, it is done in such a manner, such that atleast one attribute in the decomposed relations is the candidate key in the parent relation. Decomposition is done in such a manner that their join will not lead to loss of data/redundant data, and join dependencies are regulated.
Thus, lossless decomposition can be observed, and it can be inferred that 5NF is in place.


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
