select s1.name as student_1, s2.name as student_2, sg.id as sportgroup_id from student_sport ss1
join student_sport ss2 on ss1.sportgroup_id = ss2.sportgroup_id AND ss1.student_id < ss2.student_id
join students s1 on ss1.student_id = s1.id
join students s2 on ss2.student_id = s2.id
join sportgroups sg on ss1.sportgroup_id = sg.id
join sports sp on sg.sport_id = sp.id
where sp.name = 'Football';