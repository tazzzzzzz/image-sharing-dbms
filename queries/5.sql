--Requirement: Determine the user and the image that has got the most likes.
SELECT 
    username, photos.id as "photo id", 
    photos.image_url,
    COUNT(*) AS likes
FROM photos
INNER JOIN likes
    ON likes.photo_id = photos.id
INNER JOIN users
    ON photos.user_id = users.id
GROUP BY photos.id
ORDER BY likes DESC
LIMIT 1;
