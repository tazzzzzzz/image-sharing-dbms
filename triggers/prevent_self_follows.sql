-- Don't allow users to follow themselves.

DELIMITER $$

CREATE TRIGGER prevent_self_follows
	BEFORE INSERT ON follows for EACH ROW
    BEGIN
			IF NEW.follower_id = NEW.followee_id
            THEN
				SIGNAL SQLSTATE '45000'
                SET MESSAGE_TEXT = 'You cannot follow yourself.';
			END IF;
    END;
$$
DELIMITER ;

-- INSERT INTO follows(follower_id, followee_id) VALUES(1,1);