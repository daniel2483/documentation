-- Oracle Database 10g: Administration Workshop I
-- Oracle Server Technologies - Curriculum Development
--
-- ***Training purposes only***
-- ***Not appropriate for production use***
--

set echo on
alter table inventory.product_master nologging
/
insert /*+ append */ into inventory.product_master
select
100000 + rownum,
'NAME' || dbms_random.string('a',mod(abs(dbms_random.random),30) + 16),
dbms_random.string('a',10),
mod(abs(dbms_random.random),1000) + 100,
25.25,
50.88,
'PRIM' || dbms_random.string('a',mod(abs(dbms_random.random),30) + 16),
'SECO' || dbms_random.string('a',mod(abs(dbms_random.random),30) + 16),
decode(mod(dbms_random.random,5),0,sysdate,null)
from dba_objects
/
commit
/
insert /*+ append */ into inventory.product_master
select
200000 + rownum,
'NAME' || dbms_random.string('a',mod(abs(dbms_random.random),30) + 16),
dbms_random.string('a',10),
mod(abs(dbms_random.random),1000) + 100,
25.25,
50.88,
'PRIM' || dbms_random.string('a',mod(abs(dbms_random.random),30) + 16),
'SECO' || dbms_random.string('a',mod(abs(dbms_random.random),30) + 16),
decode(mod(dbms_random.random,5),0,sysdate,null)
from dba_objects
/
commit
/
insert /*+ append */ into inventory.product_master
select
300000 + rownum,
'NAME' || dbms_random.string('a',mod(abs(dbms_random.random),30) + 16),
dbms_random.string('a',10),
mod(abs(dbms_random.random),1000) + 100,
25.25,
50.88,
'PRIM' || dbms_random.string('a',mod(abs(dbms_random.random),30) + 16),
'SECO' || dbms_random.string('a',mod(abs(dbms_random.random),30) + 16),
decode(mod(dbms_random.random,5),0,sysdate,null)
from dba_objects
/
commit
/
alter table inventory.product_master logging
/

