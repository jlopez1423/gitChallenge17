--Jose Lopez
--Prcticing some more with SQL
--script3.sql
--====================================================================================
--First Constraint:
--Edition of a book must be a positive int
ALTER TABLE cb_books
ADD CONSTRAINT edition_number CHECK (edition>0);

--====================================================================================
--Second Constraint:
--A customer record my not have empty foreign key

--1st: Let's not have any NULL alues in address_id

--Seems to work make sure to adress this in unit testing
--let's change any nulls to 1s
UPDATE mg_customers
SET address_id = dv_address.address_id
FROM dv_address
WHERE mg_customers.address_id IS NULL AND 
	  dv_address.address_id = 1;

ALTER TABLE mg_customers
	ADD CONSTRAINT this_foreign_key 
	FOREIGN KEY (address_id)
	REFERENCES dv_address(address_id);

ALTER TABLE mg_customers
	ADD CONSTRAINT check_if_empty
	CHECK(address_id IS NOT NULL);

--====================================================================================
--Third Constraint:
--Adress record may not have an empy address field

ALTER TABLE dv_address
ADD CONSTRAINT check_address 
CHECK (address IS NOT NULL);
