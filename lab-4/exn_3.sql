select coaches.name, sports.name from students 
join student_sport on students.id = student_sport.student_id
join sports on sports.id = student_sport.sportGroup_id
join sportgroups on sports.id = sportgroups.sport_id
join coaches on sportgroups.coach_id = coaches.id
where students.name = 'Iliyan Ivanov'
