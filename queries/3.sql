-- Requirement: Identify all the users who have never posted a photo.
SELECT username, image_url 
FROM users
LEFT JOIN photos
    ON users.id = photos.user_id
WHERE photos.id IS NULL;