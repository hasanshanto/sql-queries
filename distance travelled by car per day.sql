-->> Problem Statement:
/*
Suppose you have a car travelling certain distance and the data is presented as follows -
Day 1 - 50 km
Day 2 - 100 km
Day 3 - 200 km

Now the distance is a cumulative sum as in
    row2 = (kms travelled on that day + row1 kms).

How should I get the table in the form of kms travelled by the car on a given day and not the sum of the total distance?
*/

-->> Sample Dataset:
drop table car_travels;
create table car_travels
(
    car                    varchar(40),
    days                    varchar(10),
    cumulative_distance     int
);
insert into car_travels values ('Car1', 'Day1', 50);
insert into car_travels values ('Car1', 'Day2', 100);
insert into car_travels values ('Car1', 'Day3', 200);
insert into car_travels values ('Car2', 'Day1', 0);
insert into car_travels values ('Car3', 'Day1', 0);
insert into car_travels values ('Car3', 'Day2', 50);
insert into car_travels values ('Car3', 'Day3', 50);
insert into car_travels values ('Car3', 'Day4', 100);

--> Solution

select car, days,
-- lag(column_name, offset value, default value) 
(cumulative_distance -  lag(cumulative_distance, 1, 0) over(partition by car order by days)) as distance_travelled_each_day
from car_travels;















