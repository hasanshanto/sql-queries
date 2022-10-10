-- github.com/hasanshanto

with cte as
(
select *
from (
select s.ID, s.Name, s.Marks,
	case when s.Marks between g.Min_marks and g.Max_marks then g.Grade 
	end as grading 
	from Students s
	cross join Grades g) as tbl
where tbl.grading is not null 
)
select 
case when grading >= 8 then name 
else null
end,
grading, marks 
from cte
order by grading desc, name asc 