select count(students.id) as FootballStudentsCount
from students
join student_sport on students.id = student_sport.student_id
join sportgroups on student_sport.sportgroup_id = sportgroups.id
join sports on sportgroups.sport_id = sports.id
where sports.name = 'Football'