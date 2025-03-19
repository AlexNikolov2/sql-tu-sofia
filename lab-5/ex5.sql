create VIEW student_training_info as select s.name as student_name, s.class as student_class, sg.location as training_location, t.name as coach_name from students s
join student_sport ss on s.id = ss.student_id
join sportgroups sg on ss.sportgroup_id = sg.id
join coaches t on sg.coach_id = t.id
where sg.hourOfTraining = '08:00:00';