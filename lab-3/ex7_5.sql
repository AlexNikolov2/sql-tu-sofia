select name, class, sportgroups.id from students 
join student_sport on students.id = student_sport.student_id
join sportgroups on student_sport.sportgroup_id = sportgroups.id 
where sportgroups.dayOfWeek = "Monday"