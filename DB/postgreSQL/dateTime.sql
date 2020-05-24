-- Date and Time functions in postgresql

-- Oracle sysdate equivalent 
select up_time from exam where up_time = current_date;
select CURRENT_TIMESTAMP;

-- Select time
--yesterday
SELECT NOW() - INTERVAL '1 DAY';

--Unrelated to the question, but PostgreSQL also supports some shortcuts:
SELECT 'yesterday'::TIMESTAMP, 'tomorrow'::TIMESTAMP, 'allballs'::TIME;   