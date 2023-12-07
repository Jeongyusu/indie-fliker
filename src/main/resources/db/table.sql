create table user_tb(
                        id int auto_increment primary key,
                        user_email varchar(20) not null unique,
                        password varchar(300) not null,
                        fullname varchar(50) not null,
                        created_at timestamp not null default now()
);