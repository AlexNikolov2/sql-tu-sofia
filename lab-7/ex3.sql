drop procedure if exists testProc;
delimiter |
create procedure testProc (in testParam varchar(255))
begin
select testParam;
SET testParam = 'Georgi Georgiev' ;
end;
|

