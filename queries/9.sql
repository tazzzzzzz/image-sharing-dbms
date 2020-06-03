-- Requirement: Return the total number of photos a gender has posted.
SELECT 
    users.gender, COUNT(*) as total_photos_posted 
FROM users
INNER JOIN photos
    ON photos.user_id=users.id
GROUP BY users.gender;
