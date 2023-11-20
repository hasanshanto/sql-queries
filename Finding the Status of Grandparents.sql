Problem: 01
Problem statement: 
Write a sql query to return the count of people whose grandparent is still alive.










-- DDL
create table test.shanto_practicing__sql_1 
(
	person varchar(20),
	parent varchar(20),
	status varchar(20)
);

select * from test.shanto_practicing__sql_1;

insert into test.shanto_practicing__sql_1 (person, parent, status)
values 
('a', 'x', 'alive'),
('b', 'y', 'dead'),
('x', 'x1', 'alive'),
('y', 'y1', 'alive'),
('x1', 'x2', 'alive'),
('y1', 'y2', 'dead')
;









-- Solution Code
select 
	status,
	count(distinct child) as count_c,
	string_agg(child, ',') as grand_kids 
	from 
		(
	select 
		c.person as child,
		p.person as parent,
		p.parent as grand_parent,
		g.status
	from test.shanto_practicing__sql_1 as c
	inner join test.shanto_practicing__sql_1 as p on c.parent = p.person
	inner join test.shanto_practicing__sql_1 as g on p.parent = g.person
		)as t1
group by 1
;


Solution Statement: 
This table contains data of the person and his parents and most importantly the status given here is the status of the person, not the parent which makes the problem more challenging. In order to find the child, parent and grandparent and the grandparents status we need to join the table thrice with itself. The first table is for children and the latter two is for parents and grandparents respectively.  Finally, the status of the third table is the actual status of whether the grandparents are alive or not. Then , a simple count or group by statement will return the status of those grandparents.
