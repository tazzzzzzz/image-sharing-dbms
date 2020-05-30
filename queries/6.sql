SELECT 
    tags.tag_name,
    COUNT(*) AS total
from photo_tags
JOIN tags
    ON photo_tags.tag_id = tags.id
GROUP BY tags.id 
ORDER BY total DESC
LIMIT 5;
