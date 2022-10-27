/* There are 6 teams in T20I 2022 super 12 group 2. write an sql query such that each team play with every other team just once. */

drop table teams;
create table teams
    (
        team_code       varchar(10),
        team_name       varchar(40)
    );

insert into teams values ('BAN', 'Bangladesh');
insert into teams values ('NET', 'Netherland');
insert into teams values ('IND', 'India');
insert into teams values ('PAK', 'Pakistan');
insert into teams values ('RSA', 'South Afrcia');
insert into teams values ('ZIM', 'Zimbabwe');


--> Solution

with group2 
as (
	select 
	row_number() over(order by team_code) as team_id, 
	team_code, team_name
	from teams)
select team.team_name, opponent.team_name
from group2 as team
join group2 as opponent
on team.team_id < opponent.team_id;










