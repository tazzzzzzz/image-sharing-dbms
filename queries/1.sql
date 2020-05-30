-- Requirement: To determine the 5 oldest users present.
SELECT * 
FROM users
ORDER BY created_at
LIMIT 5;