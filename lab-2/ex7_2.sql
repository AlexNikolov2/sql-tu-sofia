create table categories (
id int primary key auto_increment, 
category_name varchar(50) not null unique
);

create table news (
id int primary key auto_increment, 
title varchar(255) not null, 
content text not null, 
published_at timestamp default current_timestamp, 
author_id int, category_id int, 
foreign key (author_id) references users(id) on delete cascade, 
foreign key (category_id) references categories(id) on delete cascade
);

create table media (
id int primary key auto_increment, 
news_id int,
media_url varchar(255) not null,
media_type enum('image', 'video') not null, 
foreign key (news_id) references news(id) on delete cascade
);

create table comments (
id int primary key auto_increment, 
news_id int, user_id int, 
comment_text text not null, 
commented_at timestamp default current_timestamp, 
foreign key (news_id) references news(id) on delete cascade, 
foreign key (user_id) references users(id) on delete cascade
);

create table admin_actions (
id int primary key auto_increment, 
admin_id int, user_id int, 
action varchar(50) not null, 
action_date timestamp default current_timestamp, 
foreign key (admin_id) references users(id) on delete cascade, 
foreign key (user_id) references users(id) on delete cascade
);