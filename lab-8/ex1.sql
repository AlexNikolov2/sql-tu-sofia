use school_sport_clubs;
CREATE OR REPLACE VIEW TrainerInfo AS
SELECT 
    c.name AS TrainerName,
    sg.location AS GroupInfo,
    sp.name AS SportName,
    tp.month AS Month,
    tp.year AS Year,
    SUM(sal.salaryAmount) AS MonthlyEarnings
FROM 
    coaches c
JOIN 
    sportgroups sg ON c.id = sg.coach_id
JOIN 
    sports sp ON sg.sport_id = sp.id
JOIN 
    salaryPayments sal ON c.id = sal.coach_id
JOIN 
    taxesPayments tp ON sg.id = tp.group_id
WHERE 
    tp.month = '5'
    AND tp.year = 2022
GROUP BY 
    c.name, sp.name, sg.location, tp.month, tp.year;
