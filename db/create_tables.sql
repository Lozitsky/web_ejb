# mysql -u admin_db -p
create database if not exists web_ejb;

# use awesome_project;
use web_ejb;

create user if not exists 'admin_db'@'localhost' identified by 'password';
# grant all on awesome_project.* to 'admin_db'@'localhost';
grant all on web_ejb.* to 'admin_db'@'localhost';

-- drop table if exists task;
create table if not exists task
(
    id                 bigint not null auto_increment primary key,
    name               varchar(100) not null,
    description        varchar(1000),
    status             varchar(30),
    created_date       timestamp default current_timestamp(),
    last_modified_date timestamp default current_timestamp()
    );

create table users (
                       user_name         varchar(15) not null primary key,
                       user_pass         varchar(15) not null
);

create table user_roles (
                            user_name         varchar(15) not null,
                            role_name         varchar(15) not null,
                            primary key (user_name, role_name)
);

insert into task VALUES (null, 'My first task', 'The description of my first task', 'TODO', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);
insert into task VALUES (null, 'My second task', 'The description of my second task', 'TODO', CURRENT_TIMESTAMP, CURRENT_TIMESTAMP);

-- MUST BE CHANGED BEFORE STARTUP
insert into users VALUES ('admin1', 'admin1');
insert into user_roles VALUES ('admin1', 'tomee-admin');
insert into user_roles VALUES ('admin1', 'manager-gui');
insert into user_roles VALUES ('admin1', 'manager');
insert into user_roles VALUES ('admin1', 'manager-script');
