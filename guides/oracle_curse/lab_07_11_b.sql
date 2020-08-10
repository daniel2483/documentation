-- Oracle Database 10g: Administration Workshop I
-- Oracle Server Technologies - Curriculum Development
--
-- ***Training purposes only***
-- ***Not appropriate for production use***
--

set echo on
set timing on
select count(*)
  from inventory.product_master
  where upper(substr(code,5,2)) in
('AA','BB','GR','RE','TT','PO','OI','TE','EW','QE',
 'UU','FE','BV','VD','FD','WW','PX','XX','ZW','CO',
 'VE','VX','VV','MM','MN','MO','MA','AQ','AE','AT',
 'CZ','CX','CQ','CW','CE','CR','CT','CY','CU','CI')
/
