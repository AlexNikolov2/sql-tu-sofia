Select sportgroups.location, sportgroups.dayOfWeek, sportgroups.hourOfTraining, sports.name from sportgroups 
inner join sports on sportgroups.sport_id = sports.id;