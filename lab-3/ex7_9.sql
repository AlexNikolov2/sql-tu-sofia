select students.name as student_name from students
join student_sport on students.id = student_sport.student_id
join sportgroups on student_sport.sportgroup_id = sportgroups.id
join coaches on sportgroups.coach_id = coaches.id
join sports on sportgroups.sport_id = sports.id
where coaches.name = "Ivan Todorov Petkov" and sports.name = "Football"
