Alter table clients add column gender ENUM('m','f','ns') default 'ns' not null;
alter table clients add column country varchar(2) default 'mx' not null;    


<<<<<<< HEAD
alter table products add column description_length integer as (length(description));
=======
alter table products add column description_length integer as (length(description));


alter table bill_products add column total float as (
price * quantity * (1 -discount/100)
) after discount;


--
ALTER TABLE clients ADD COLUMN bill_count INTEGER;      
>>>>>>> ecd5a8bcbde8e6f1a681b7faeb920cdcd5b5e84f
