select sg.location as locationOfGroup, sg.dayOfWeek as trainingDay, sg.hourOfTraining as trainingHour, sp.name as sportName from sportgroups as sg
join sports as sp on sg.sport_id = sp.id