USE school_sport_clubs;
DROP PROCEDURE IF EXISTS getCoachTrainingInfo;
DELIMITER |
CREATE PROCEDURE getCoachTrainingInfo(IN coachName VARCHAR(255))
BEGIN
    SELECT 
        sp.name AS sportName,
        sg.location AS trainingLocation,
        sg.hourOfTraining AS trainingHour,
        sg.dayOfWeek AS trainingDay,
        st.name AS studentName,
        st.phone AS studentPhone
    FROM sportgroups sg
    JOIN sports sp ON sg.sport_id = sp.id
    JOIN student_sport ss ON sg.id = ss.sportgroup_id
    JOIN students st ON ss.student_id = st.id
    JOIN coaches c ON sg.coach_id = c.id
    WHERE c.name = coachName;
END |
DELIMITER ;
CALL getCoachTrainingInfo('georgi Ivanov Todorov');
