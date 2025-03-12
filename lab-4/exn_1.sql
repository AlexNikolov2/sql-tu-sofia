use school_sport_clubs;
select students.name, class, phone from students 
join student_sport on students.id = student_sport.student_id
join sports on sports.id = student_sport.sportgroup_id
where sports.name = 'Volleyball'