-- Run Oracle Stats on dictionary and fixed objects
EXEC DBMS_STATS.GATHER_DICTIONARY_STATS();
EXEC DBMS_STATS.GATHER_FIXED_OBJECTS_STATS();

-- Run Oracle stats on a schema
-- Update <SCHEMA-NAME> with the intended schema
-- Change 2 to needed parallelization
EXEC DBMS_STATS.GATHER_SCHEMA_STATS('<SCHEMA-NAME>',CASCADE=>TRUE,NO_INVALIDATE=>FALSE,METHOD_OPT=>'FOR ALL COLUMNS SIZE 1',DEGREE=>2);
