DROP TABLE source;
CREATE TABLE source
    (
        id      int,
        name    varchar(1)
    );

DROP TABLE target;
CREATE TABLE target
    (
        id      int,
        name    varchar(1)
    );

INSERT INTO source VALUES (1, 'A');
INSERT INTO source VALUES (2, 'B');
INSERT INTO source VALUES (3, 'C');
INSERT INTO source VALUES (4, 'D');

INSERT INTO target VALUES (1, 'A');
INSERT INTO target VALUES (2, 'B');
INSERT INTO target VALUES (4, 'X');
INSERT INTO target VALUES (5, 'F');


select *
from source;

select *
from target;

--> solution 1

select s.id, 'Mismatch' as Comment
from source s
join target t
on s.id = t.id 
where s.name <> t.name
	union
select s.id, 'New in source' as Comment
from source s
left join target t
on s.id = t.id
where t.id is null
	union
select t.id, 'New in target' as Comment 
from source s
right join target t
on s.id = t.ids
where s.id is null;

--> solution 2

select coalesce(s.id, t.id) as id, 
case 
	when t.id is null 
	then 'new in source'
	when s.id is null
	then 'new in target'
	when s.name <> t.name
	then 'mismatch'
end as comments

from source s
full join target t
on s.id = t.id
where s.id is null 
or t.id is null 
or s.name <> t.name














