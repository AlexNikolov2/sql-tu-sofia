select sportgroups.location, sportgroups.dayOfWeek, sportgroups.hourOfTraining, sportgroups.sport_id, coaches.name from sportgroups
right outer join coaches on sportgroups.coach_id = coaches.id