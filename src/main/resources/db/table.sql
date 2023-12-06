create table user_tb(
                        id int auto_increment primary key,
                        username varchar(50) not null unique,
                        password varchar(100) not null,
                        fullname varchar(50) not null,
                        created_at timestamp not null default now()
);