USE school_sport_clubs;
DROP PROCEDURE IF EXISTS getSportInfo;
DELIMITER |
CREATE PROCEDURE getSportInfo(IN sportId INT)
BEGIN
    SELECT 
        sp.name AS sportName,
        st.name AS studentName,
        c.name AS coachName
    FROM sports sp
    JOIN sportgroups sg ON sp.id = sg.sport_id
    JOIN student_sport ss ON sg.id = ss.sportgroup_id
    JOIN students st ON ss.student_id = st.id
    JOIN coaches c ON sg.coach_id = c.id
    WHERE sp.id = sportId;
END
DELIMITER ;

call getSportInfo(1)
