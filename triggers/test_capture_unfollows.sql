-- SELECT COUNT(*) FROM follows;
-- SELECT * FROM follows WHERE follows.follower_id=2 AND follows.followee_id=1;
-- DELETE FROM follows WHERE follows.follower_id=2 AND follows.followee_id=1;
-- SELECT * FROM unfollows;
-- SELECT * FROM follows WHERE follows.follower_id=2 AND follows.followee_id=1;

-- source ./triggers/capture_unfollows.sql

SELECT COUNT(*) FROM follows;
DELETE FROM follows WHERE follows.follower_id=3 AND follows.followee_id=1;
SELECT * FROM follows WHERE follows.follower_id=3 AND follows.followee_id=1;
SELECT * FROM unfollows WHERE unfollows.unfollower_id=3 AND unfollows.unfollowee_id=1;
SELECT * FROM follows WHERE follows.follower_id=3 AND follows.followee_id=3;
