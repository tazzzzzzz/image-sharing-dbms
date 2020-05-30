-- Requirement: Determine the average posts per user using the services.
SELECT 
    (SELECT COUNT(*) from photos)/(SELECT COUNT(*) from users) AS avg;

