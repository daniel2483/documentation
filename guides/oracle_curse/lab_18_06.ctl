-- Oracle Database 10g: Administration Workshop I
-- Oracle Server Technologies - Curriculum Development
--
-- ***Training purposes only***
-- ***Not appropriate for production use***
--
-- Load data into the PRODUCT_ON_HAND table
--
LOAD DATA
infile '/home/oracle/labs/lab_18_06.dat'
INTO TABLE INVENTORY.PRODUCT_ON_HAND
APPEND
FIELDS TERMINATED BY ','
(on_hand_id,
product_id,
quantity,
warehouse_city char(30),
last_update date(12) 'DD-MON-YYYY')