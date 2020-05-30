SELECT 
    (SELECT COUNT(*) from photos)/(SELECT COUNT(*) from users) AS avg;

