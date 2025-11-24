Alter table clients add column gender ENUM('m','f','ns') default 'ns' not null;
alter table clients add column country varchar(2) default 'mx' not null;    


alter table products add column description_length integer as (length(description));