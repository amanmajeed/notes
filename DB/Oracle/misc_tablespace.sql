--TableSpace Utilization
SELECT 
a.TABLESPACE_NAME, a.BYTES/1024/1024 TotalBytes,
b.BYTES/1024/1024 bytes_free,
(a.BYTES/1024/1024-b.BYTES/1024/1024) bytes_used,
round(((a.BYTES-b.BYTES)/a.BYTES)*100,2) percent_used
FROM 
(select TABLESPACE_NAME,sum(BYTES) BYTES from dba_data_files group by TABLESPACE_NAME) a,
(select TABLESPACE_NAME,sum(BYTES) BYTES from dba_free_space group by TABLESPACE_NAME)b
WHERE a.TABLESPACE_NAME=b.TABLESPACE_NAME
ORDER BY TABLESPACE_NAME,((a.BYTES-b.BYTES)/a.BYTES) desc;

--Tablespace Utilization
SELECT 
    owner       AS owner
    ,table_name  AS table_name
    ,tablespace_name
    ,num_rows
    ,blocks*8/1024      AS size_mb
    ,pct_free
    ,compression 
    ,logging
FROM   dba_tables 
WHERE   owner     ='CUSTOM'
ORDER BY 5 desc;

--Auto Reduce Tablespace
select 'alter database datafile '''||file_name||''' resize '||((size_mb-free_mb)+1)||'M;'
from
(SELECT tablespace_name,
       size_mb,
       free_mb,
       max_size_mb,
       max_free_mb,
       TRUNC((free_mb/(size_mb+free_mb)) * 100) AS free_pct
       --RPAD(' '|| RPAD('X',ROUND((max_size_mb-max_free_mb)/max_size_mb*10,0), 'X'),11,'-') AS used_pct
FROM   (
        SELECT a.tablespace_name,
         b.size_mb,
                               a.free_mb,
                               b.max_size_mb,
                               a.free_mb + (b.max_size_mb - b.size_mb) AS max_free_mb
                        FROM   (SELECT tablespace_name,
                                       TRUNC(SUM(bytes)/1024/1024) AS free_mb
                                FROM   dba_free_space
                                GROUP BY tablespace_name) a,
                               (SELECT tablespace_name,
                                       TRUNC(SUM(bytes)/1024/1024) AS size_mb,
                                       TRUNC(SUM(GREATEST(bytes,maxbytes))/1024/1024) AS max_size_mb
                                FROM   dba_data_files
                                GROUP BY tablespace_name) b
                        WHERE  a.tablespace_name = b.tablespace_name
                       )
                ORDER BY tablespace_name) a,
dba_data_files b
where a.tablespace_name = b.tablespace_name
order by free_pct desc;