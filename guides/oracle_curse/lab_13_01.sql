-- Oracle Database 10g: Administration Workshop I
-- Oracle Server Technologies - Curriculum Development
--
-- ***Training purposes only***
-- ***Not appropriate for production use***
--
-- Moves the table hr.employees from one location to another. This
--   helps fix any migrated rows, as well as compacting unused space
--   in the segment that may have been caused by deleting data.

alter table hr.employees move;

