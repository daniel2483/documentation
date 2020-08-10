-- Oracle Database 10g: Administration Workshop I
-- Oracle Server Technologies - Curriculum Development
--
-- ***Training purposes only***
-- ***Not appropriate for production use***
--
-- Delete a datafile but leave the database open

DECLARE
	v_cmd varchar2(300);
	v_process varchar2(1000);
	v_pid varchar2(20);
	v_timewait number;
	v_timeprint number;
	CURSOR c_pid is select spid from v$process;
BEGIN
	execute immediate 'alter system switch logfile';
	execute immediate 'alter system switch logfile';	
	select '/bin/rm -f '||dfile into v_cmd from
	   (select rownum "NUM",a.name "DFILE", b.name "TBS"
	    from v$datafile a join v$tablespace b using (ts#)
	    where b.name='EXAMPLE')
	    where num=1;
	 dbms_output.put_line(v_cmd);   
	 execcmd(v_cmd);
	 
	 -- Because of the way LINUX/UNIX handles files, we have to reset the file handles for
	 --  the background processes or they will keep the inode open and you won't be able to 
	 --  tell the datafile is missing. 
	 open c_pid;
	 LOOP
	    FETCH c_pid INTO v_pid;
	    v_process:=v_process||' '||v_pid;
	    EXIT WHEN c_pid%NOTFOUND;
	 END LOOP;
	 v_process:='/bin/kill -2 '||v_process;
	 dbms_output.put_line(v_process);
	 execcmd(v_process);
	 execute immediate 'alter system flush buffer_cache';
	 FOR i in 1..10000 LOOP
		 v_timeprint:=v_timeprint+1;
	 END LOOP;
	 execute immediate 'alter system checkpoint';
	 execcmd(v_process);
 END;
 /
