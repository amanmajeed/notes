-- Commonly performed basic quries. 

-- Delete duplicates in a table
DELETE FROM basket a
USING basket b
WHERE a.id < b.id
AND a.fruit = b.fruit;
