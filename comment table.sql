/* Write an SQL query to display the correct message (meaningful message) from the input
comments_and_translation table. */

drop table comments_;
create table comments_
(
	id				int,
	comment			varchar(100),
	translation		varchar(100)
);

insert into comments_ values
(1, 'very good', null),
(2, 'good', null),
(3, 'bad', null),
(4, 'ordinary', null),
(5, 'cdcdcdcd', 'very bad'),
(6, 'excellent', null),
(7, 'ababab', 'not satisfied'),
(8, 'satisfied', null),
(9, 'aabbaabb', 'extraordinary'),
(10, 'ccddccbb', 'medium');

--> Solution 1

select
case when translation is null 
	then comment
	else translation
end as comments
from comments_;


--> Solution 2
-- coalesce return the first non null value in a list
select coalesce(translation, comment) as comments
from comments_;








