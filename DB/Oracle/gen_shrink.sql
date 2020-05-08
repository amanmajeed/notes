-- Create a script which will shrink the watermark of a table.
-- Think of it as truncate a table, without removing data, just resetting the watermarks and reducing space utilized.
-- Ref : https://oracle-base.com/articles/misc/alter-table-shrink-space-online

set pages 0
set feedback off
set linesize 150
spool shrink.sql
select 'alter table '||owner||'.'||table_name||' enable row movement;' from dba_tables where owner in ('SCHEMA');
select 'alter table '||owner||'.'||table_name||' shrink space;' from dba_tables where owner in ('SCHEMA');
select 'alter table '||owner||'.'||table_name||' shrink space cascade;' from dba_tables where owner in ('SCHEMA');
select 'alter table '||owner||'.'||table_name||' disable row movement;' from dba_tables where owner in ('SCHEMA');
spool off