select coaches.name as CoachName, sports.name as Sport from coaches
join sports on coaches.id in ( 
select coach_id from sportgroups 
where sportgroups.sport_id = sports.id and sports.name = 'Volleyball'
)