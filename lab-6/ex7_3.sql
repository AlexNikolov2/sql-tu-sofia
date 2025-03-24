select coaches.name as CoachName, sports.name as Sport, sportgroups.dayOfWeek as TrainingDay, sportgroups.location as TrainingLocation
from coaches
join sports on coaches.id in (
    select coach_id from sportgroups where sportgroups.sport_id = sports.id and sports.name = 'Volleyball'
)
join sportgroups on sportgroups.coach_id = coaches.id
join student_sport on student_sport.sportgroup_id = sportgroups.id
join students on students.id = student_sport.student_id
where students.name = 'Maria Hristova Dimova'