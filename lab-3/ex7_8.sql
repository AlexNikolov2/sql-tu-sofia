select sports.name as sport_name from sports
join sportgroups on sports.id = sportgroups.sport_id
join student_sport on sportgroups.id = student_sport.sportgroup_id
join students on student_sport.student_id = students.id
where students.name = "Iliyan Ivanov"