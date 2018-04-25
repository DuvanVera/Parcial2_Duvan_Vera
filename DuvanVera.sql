--------------------------------------------------------
-- Archivo creado  - miércoles-abril-25-2018   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table CUSTOMERS
--------------------------------------------------------

  CREATE TABLE "MID_TERM"."CUSTOMERS" 
   (	"ID" NUMBER(*,0), 
	"NAME" VARCHAR2(255), 
	"COUNTRY" VARCHAR2(255), 
	"GRADE" NUMBER(*,0), 
	"SALESMAN_ID" NUMBER(*,0)
   )
--------------------------------------------------------
--  DDL for Table ORDERS
--------------------------------------------------------

  CREATE TABLE "MID_TERM"."ORDERS" 
   (	"ID" NUMBER(*,0), 
	"AMOUNT" NUMBER(8,2), 
	"ORDER_DATE" DATE, 
	"CUSTOMER_ID" NUMBER(*,0), 
	"SALESMAN_ID" NUMBER(*,0)
   )
--------------------------------------------------------
--  DDL for Table SALESMAN
--------------------------------------------------------

  CREATE TABLE "MID_TERM"."SALESMAN" 
   (	"ID" NUMBER(*,0), 
	"NAME" VARCHAR2(255), 
	"COUNTRY" VARCHAR2(255), 
	"COMMISSION" NUMBER(5,2)
   )
--------------------------------------------------------
--  DDL for View VIEW_1
--------------------------------------------------------

  CREATE OR REPLACE VIEW "MID_TERM"."VIEW_1" ("SALERMAN_NAME", "CUSTOMER_NAME", "COUNTRIES") AS 
  SELECT SALESMAN.name as salerman_name, CUSTOMERS.name as customer_name ,SALESMAN.COUNTRY as COUNTRIES
   from SALESMAN  inner join CUSTOMERS  
   on SALESMAN.COUNTRY = CUSTOMERS.COUNTRY
--------------------------------------------------------
--  DDL for Index SYS_C007214
--------------------------------------------------------

  CREATE UNIQUE INDEX "MID_TERM"."SYS_C007214" ON "MID_TERM"."ORDERS" ("ID")
--------------------------------------------------------
--  DDL for Index SYS_C007215
--------------------------------------------------------

  CREATE UNIQUE INDEX "MID_TERM"."SYS_C007215" ON "MID_TERM"."SALESMAN" ("ID")
--------------------------------------------------------
--  DDL for Index SYS_C007216
--------------------------------------------------------

  CREATE UNIQUE INDEX "MID_TERM"."SYS_C007216" ON "MID_TERM"."CUSTOMERS" ("ID")
--------------------------------------------------------
--  Constraints for Table CUSTOMERS
--------------------------------------------------------

  ALTER TABLE "MID_TERM"."CUSTOMERS" ADD PRIMARY KEY ("ID") ENABLE
--------------------------------------------------------
--  Constraints for Table ORDERS
--------------------------------------------------------

  ALTER TABLE "MID_TERM"."ORDERS" ADD PRIMARY KEY ("ID") ENABLE
--------------------------------------------------------
--  Constraints for Table SALESMAN
--------------------------------------------------------

  ALTER TABLE "MID_TERM"."SALESMAN" ADD PRIMARY KEY ("ID") ENABLE
--------------------------------------------------------
--  Ref Constraints for Table CUSTOMERS
--------------------------------------------------------

  ALTER TABLE "MID_TERM"."CUSTOMERS" ADD CONSTRAINT "SALESMAN_FK" FOREIGN KEY ("SALESMAN_ID")
	  REFERENCES "MID_TERM"."SALESMAN" ("ID") ENABLE
--------------------------------------------------------
--  Ref Constraints for Table ORDERS
--------------------------------------------------------

  ALTER TABLE "MID_TERM"."ORDERS" ADD CONSTRAINT "CUSTOMER_ORDER_FK" FOREIGN KEY ("CUSTOMER_ID")
	  REFERENCES "MID_TERM"."CUSTOMERS" ("ID") ENABLE
  ALTER TABLE "MID_TERM"."ORDERS" ADD CONSTRAINT "SALESMAN_ORDER_FK" FOREIGN KEY ("SALESMAN_ID")
	  REFERENCES "MID_TERM"."SALESMAN" ("ID") ENABLE
