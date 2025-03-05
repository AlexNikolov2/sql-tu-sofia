select students.name as student_name, sports.name as sport_name from students 
join student_sport on student_sport.student_id = students.id 
join sports on sports.id = student_sport.sportGroup_id