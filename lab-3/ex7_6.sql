select coaches.name as coach_name from coaches 
join sportgroups on coaches.id = sportgroups.coach_id
join sports on sportgroups.sport_id = sports.id
where sports.name = "Football"