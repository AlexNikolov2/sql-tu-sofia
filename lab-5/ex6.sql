select sp.name as sport_name, COUNT(ss.student_id) as student_count from sports sp
join sportgroups sg on sp.id = sg.sport_id
join student_sport ss on sg.id = ss.sportgroup_id
group by sp.name;