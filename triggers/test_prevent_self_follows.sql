-- SELECT * FROM follows WHERE follows.follower_id=3 AND follows.followee_id=3;
-- INSERT INTO follows(follows.follower_id, follows.followee_id ) VALUES (3 ,3);
-- SELECT * FROM follows WHERE follows.follower_id=3 AND follows.followee_id=3;

-- DELETE FROM follows WHERE follows.follower_id=3 AND follows.followee_id=3;

-- source ./triggers/prevent_self_follows.sql
SELECT * FROM follows WHERE follows.follower_id=3 AND follows.followee_id=3;
INSERT INTO follows(follows.follower_id, follows.followee_id ) VALUES (3 ,3);
SELECT * FROM follows WHERE follows.follower_id=3 AND follows.followee_id=3;


