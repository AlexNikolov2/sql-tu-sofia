USE school_sport_clubs;
DROP PROCEDURE IF EXISTS getAllSportGroupsWithSports;
delimiter |
create procedure getAllSportGroupsWithSports()
begin
SELECT sg.location as locationOfGroup,
sg.dayOfWeek as trainingDay,
sg.hourOfTraining as trainingHour,
sp.name as sportName
FROM sportgroups as sg JOIN sports as sp
ON sg.sport_id = sp.id;
end
|
delimiter ;