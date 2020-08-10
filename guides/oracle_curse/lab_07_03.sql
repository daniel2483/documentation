-- Oracle Database 10g: Administration Workshop I
-- Oracle Server Technologies - Curriculum Development
--
-- ***Training purposes only***
-- ***Not appropriate for production use***
--
prompt  There is an error in this statement. It will not
prompt  run successfully unless fixed.

CREATE TABLE INVENTORY.PRODUCT_ON_HAND
(
PRODUCT_ID NUMBER(7),
QUANTITY NUMBER(5),
WAREHOUSE_CITY VARCHAR2(30),
LAST_UPDATE DATE,
  CONSTRAINT FK_PROD_ON_HAND_PROD_ID
    FOREIGN KEY REFERENCES
    INVENTORY.PRODUCT_MASTER (PRODUCT_ID) VALIDATE
)
/
