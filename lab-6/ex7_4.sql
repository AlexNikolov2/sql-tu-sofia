select students.name as StudentName, sum(taxesPayments.paymentAmount) as TotalFees, taxesPayments.month as Month, taxesPayments.year as Year
from students
join student_sport on students.id = student_sport.student_id
join sportgroups on student_sport.sportgroup_id = sportgroups.id
join coaches on sportgroups.coach_id = coaches.id
join taxesPayments on students.id = taxesPayments.student_id
where coaches.egn = '7509041245'
group by students.name, taxesPayments.month, taxesPayments.year
having sum(taxesPayments.paymentAmount) > 700