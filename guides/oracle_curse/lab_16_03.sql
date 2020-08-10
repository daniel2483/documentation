-- Oracle Database 10g: Administration Workshop I
-- Oracle Server Technologies - Curriculum Development
--
-- ***Training purposes only***
-- ***Not appropriate for production use***
--
-- Delete a file in the SYSTEM tablespace and crash the database
--

DECLARE
v_cmd varchar2(300);
v_process varchar2(1000);
v_pid varchar2(20);
CURSOR c_pid is select spid from v$process;
BEGIN
select '/bin/rm -f '||dfile into v_cmd from
   (select rownum "NUM",a.name "DFILE", b.name "TBS"
    from v$datafile a join v$tablespace b using (ts#)
    where b.name='SYSTEM')
    where num=1;
    dbms_output.put_line(v_cmd);
 execcmd(v_cmd);
 open c_pid;
  LOOP
     FETCH c_pid INTO v_pid;
     v_process:=v_process||' '||v_pid;
     EXIT WHEN c_pid%NOTFOUND;
  END LOOP;
  v_process:='/bin/kill -2 '||v_process;
  dbms_output.put_line(v_process);
 execcmd(v_process);
 END;
 /
shutdown abort;

