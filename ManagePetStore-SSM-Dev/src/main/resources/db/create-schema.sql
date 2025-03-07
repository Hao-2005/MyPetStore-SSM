create table if not exists "admin" (
    id int auto_increment primary key,
    username varchar(255) not null,
    password varchar(255) not null
);

create table if not exists `sells` (
    id int auto_increment primary key not null,
    item_id varchar(255) not null,
    user_id varchar(255) not null,
    amount int not null,
    time timestamp not null default current_timestamp,
    foreign key (user_id) references `account` (userid),
    foreign key (item_id) references `item` (itemid)
);