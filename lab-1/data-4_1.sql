-- Assuming Coach Stefan has id 1 and Coach Dimitrov has id 2:
INSERT INTO football (student_id, coach_id) VALUES 
(1, 1),  -- student_id 1, coach_id 1 (Coach Stefan)
(3, 1),  -- student_id 3, coach_id 1 (Coach Stefan)
(5, 1),  -- student_id 5, coach_id 1 (Coach Stefan)
(7, 1),  -- student_id 7, coach_id 1 (Coach Stefan)
(9, 1);  -- student_id 9, coach_id 1 (Coach Stefan)


-- Insert Volleyball Players with correct coach_id
INSERT INTO volleyball (student_id, coach_id) VALUES 
(2, 2),  -- student_id 2, coach_id 2 (Coach Dimitrov)
(4, 2),  -- student_id 4, coach_id 2 (Coach Dimitrov)
(6, 2),  -- student_id 6, coach_id 2 (Coach Dimitrov)
(8, 2),  -- student_id 8, coach_id 2 (Coach Dimitrov)
(10, 2); -- student_id 10, coach_id 2 (Coach Dimitrov)