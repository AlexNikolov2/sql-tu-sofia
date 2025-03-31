DROP PROCEDURE IF EXISTS testProc;
delimiter |
create procedure testProc (out testParam VARCHAR(255))
begin
select testParam; 
SET testParam = 'Georgi Georgiev'; 
end; 