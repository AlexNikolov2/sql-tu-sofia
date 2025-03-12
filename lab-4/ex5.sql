select firstpl.name as firstPlayer, secondpl.name as secondPlayer, sports.name as
sportName
from students as firstpl join students as secondpl
on firstpl.id > secondpl.id
join sports on (

secondpl.id in(
select student_id
from student_sport

where sportGroup_id in(
select id
from sportgroups

where sport_id = sports.id
)
)

and (firstPl.id in( select student_id
from student_sport
where sportGroup_id in(
select id
from sportgroups
where sport_id = sports.id)
)
)
)
WHERE firstPL.id IN(
SELECT student_id
FROM student_sport
WHERE sportGroup_id IN(
SELECT sportGroup_id
FROM student_sport
WHERE student_id = secondPl.id
)

)
ORDER BY sportName;