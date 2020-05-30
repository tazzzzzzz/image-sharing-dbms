SELECT 
    username, 
    user_id,
    COUNT(*) AS total
 FROM users
 INNER JOIN likes
    ON likes.user_id = users.id
GROUP BY likes.user_id
HAVING total = (SELECT COUNT(*) FROM photos);