
CREATE VIEW TrainerInfo AS
SELECT 
    t.name AS TrainerName,
    s.name AS SportName,
    g.name AS GroupName,
    SUM(p.amount) AS MonthlyEarnings
FROM 
    Trainers t
JOIN 
    Sports s ON t.sport_id = s.id
JOIN 
    Groups g ON t.group_id = g.id
JOIN 
    Payments p ON t.id = p.trainer_id
WHERE 
    MONTH(p.payment_date) = MONTH(CURRENT_DATE)
    AND YEAR(p.payment_date) = YEAR(CURRENT_DATE)
GROUP BY 
    t.name, s.name, g.name;
