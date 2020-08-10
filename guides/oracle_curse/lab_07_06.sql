-- Oracle Database 10g: Administration Workshop I
-- Oracle Server Technologies - Curriculum Development
--
-- ***Training purposes only***
-- ***Not appropriate for production use***
--

prompt  There is an error in this script. 
prompt  Correct the error to have the index
prompt  created successfully.

create composite index inventory.prod_name_code
on inventory.product_master(product_name,code)
/
