select coaches.name as CoachName, sports.name as Sport
from coaches
left join sportgroups on coaches.id = sportgroups.coach_id
left join sports on sportgroups.sport_id = sports.id
