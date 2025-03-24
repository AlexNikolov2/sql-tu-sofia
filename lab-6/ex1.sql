alter table sportgroups 
drop foreign key sportgroups_ibfk_2;

alter table sportgroups 
add constraint foreign key `coach_id_key` (coach_id) references coaches(id)
on delete set null on update cascade