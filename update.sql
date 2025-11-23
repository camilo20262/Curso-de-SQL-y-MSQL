update clients set gender  ='f' where rand () >.51;
update clients set gender = 'm'  where gender = 'ns';

update clients set country  ='col' where rand () <.31;
update clients set country  ='us' where rand () <.15;
update clients set country  ='ar' where rand () <.15 and country in ('mx','us');


---
UPDATE clients AS c
SET bill_count = (
    SELECT COUNT(*)
    FROM bills AS b
    WHERE b.client_id = c.client_id
);

