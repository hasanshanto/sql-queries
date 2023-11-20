Problem: 02
Problem statement: 
Write a sql query to return how many runs batter scored per over in a T20 cricket match.





-- DDL
drop table if exists test.shanto_practicing__sql_2;
create table test.shanto_practicing__sql_2
(
	balls	int,
	runs	int
);

-- formula for range between 2 numbers. here we need between 1 & 6. 1 being the low number and 6 being the high number.
-- round(random()*(high_no - low_no + 1)) + low_no;

insert into test.shanto_practicing__sql_2 (balls, runs)
select generate_series, round(random()*6)
from generate_series(1,120)
;

update test.shanto_practicing__sql_2
set runs = round(random()*(2-1))+1
where runs = 5;



-- Solution
select
	overs,
	sum(runs) as runs_per_over
from 
	(
	select 
		*,
		--case when balls % 6 = 0 then (balls / 6) else (balls / 6) +1 end as overs,
		ntile(20) over(order by balls) as overs
	from test.shanto_practicing__sql_2 
	)as t1
group by overs 
order by overs
;



Solution Statement: 
This table contains data about ball-by-ball runs consumed by a bowler in a T20 match. To calculate over-by-over runs scored by a batter we used two methods here. 
One method includes calculation for finding the over using mathematical calculation.
Another method used ntile to divide 120 balls into 20 buckets which will define which ball is in which overs. Then using group by and sum aggregation will solve the problem for us.

