select sports.name as SportName, sportgroups.location as TrainingLocation, count(student_sport.student_id) as StudentCount
from sportgroups
join sports on sportgroups.sport_id = sports.id
join student_sport on sportgroups.id = student_sport.sportgroup_id
group by sports.name, sportgroups.location
having count(student_sport.student_id) > 3
