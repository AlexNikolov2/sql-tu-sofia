select students.name, students.class, sportgroups.location, coaches.name from sportgroups 
join coaches on coaches.id = sportgroups.coach_id
join sports on sportgroups.sport_id = sports.id
join student_sport on sports.id = student_sport.sportGroup_id
join students on student_sport.student_id = students.id
where sportgroups.hourOfTraining = '08:00:00'