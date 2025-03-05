select coaches.name, sports.name from coaches
join sports on coaches.id in (
select coach_id from sportgroups where sportgroups.sport_id = sports.id
)