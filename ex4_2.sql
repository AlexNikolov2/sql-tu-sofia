/*create table sport_clubs(id int auto_increment primary key, club varchar(100) unique );

create table students(id int auto_increment primary key, name varchar(100) unique, class int, age int, sport varchar(100),  foreign key (sport) references sport_clubs(club) on delete cascade);

create table coaches(id int auto_increment primary key, name varchar(100) unique, sport varchar(100), foreign key (sport) references sport_clubs(club) on delete cascade);*/

create table football(id int auto_increment primary key, student_id int, coach_id int, foreign key (student_id) references students(id) on delete cascade, foreign key (id) references coaches(id) on delete cascade);

create table volleyball(id int auto_increment primary key, student_id int, coach_id int, foreign key (student_id) references students(id) on delete cascade, foreign key (id) references coaches(id) on delete cascade);
