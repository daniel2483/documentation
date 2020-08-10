-- Oracle Database 10g: Administration Workshop I
-- Oracle Server Technologies - Curriculum Development
--
-- ***Training purposes only***
-- ***Not appropriate for production use***
--
-- Delete a controlfile and crash the database
--

DECLARE
v_cmd varchar2(300);
v_process varchar2(100);
BEGIN
select '/bin/rm -f '||trim(name) into v_cmd from (select rownum "NUM", name from v$controlfile)where num='2';
dbms_output.put_line(v_cmd);
execcmd(v_cmd);
--
-- The next statements crash the database by killing the SMON process
select '/bin/kill -9 '||spid into v_process from v$process where program like '%SMON%)';
dbms_output.put_line(v_process);
execcmd(v_process);
END;
/

