-- Keeping track of when users unfollow another user for analytics

DELIMITER $$

CREATE TRIGGER capture_unfollow
	AFTER DELETE ON follows for EACH ROW
    BEGIN
			INSERT INTO unfollows(unfollower_id, unfollowee_id)
            VALUES (OLD.follower_id,OLD.followee_id);
    END;
$$
DELIMITER ;
