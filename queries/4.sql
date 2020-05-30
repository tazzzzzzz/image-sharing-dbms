-- Requirement: Identify all the users who have never posted a photo, or liked/commented on another photo.
SELECT users.id, 
    username
FROM users
    LEFT JOIN photos 
        ON users.id = photos.user_id
    LEFT JOIN comments 
        ON users.id = comments.user_id
    LEFT JOIN likes 
        ON users.id = likes.user_id
WHERE 
        photos.id IS NULL 
    AND 
        comments.id IS NULL 
    AND 
        likes.created_at IS NULL;
