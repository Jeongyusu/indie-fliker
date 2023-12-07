create table user_tb(
                        id int auto_increment primary key,
                        user_email varchar(20) not null unique,
                        password varchar(300) not null,
                        username varchar(10) not null,
                        pic varchar(300) not null,
                        grade enum('NORMAL', 'VIP') not null,
                        tel varchar(30) not null,
                        gubun enum('NORMAL', 'DIRECTOR', 'ADMIN') not null,
                        created_at timestamp not null default now()
);

create table theater_tb(
                           id int auto_increment primary key,
                           theater_name varchar(30) not null unique,
                           tel varchar(20) not null,
                           address varchar(100) not null,
                           park varchar(30) not null,
                           total_seat int not null
);

create table movie_tb(
                         id int auto_increment primary key,
                         movie_name varchar(20) not null,
                         synopsis varchar(500) not null,
                         thumbnail varchar(50) not null,
                         directing_intension varchar(500) not null,
                         genre varchar(20) not null,
                         running_grade enum('전체 관람가', '12세 이상 관람가', '15세 이상 관람가','청소년 관람 불가', '제한상영가') not null,
                         director varchar(20) not null,
                         actor varchar(200) not null,
                         direct_careers varchar(500) not null,
                         direct_awards_film varchar(500) not null,
                         online_release_date Date not null,
                         online_end_date Date not null,
                         offline_release_date Date not null,
                         offline_end_date Date not null
);

create table movie_staff_tb(
                               id int auto_increment primary key,
                               director varchar(30) not null,
                               filming varchar(30) not null,
                               art varchar(30) not null,
                               sound varchar(30) not null,
                               clothes varchar(30) not null,
                               script varchar(30) not null,
                               lighting varchar(30) not null,
                               editing varchar(30) not null,
                               music varchar(30) not null,
                               movie_id int,
                               foreign KEY(movie_id) references movie_tb(id)
);

create table movie_photo_tb(
                               id int auto_increment primary key,
                               movie_pic varchar(300) not null,
                               movie_id int not null,
                               foreign KEY(movie_id) references movie_tb(id)
);

create table movie_file_tb(
                              id int auto_increment primary key,
                              origin_name varchar(300) not null,
                              path varchar(300) not null,
                              file_name varchar(300) not null,
                              graphics varchar(10) not null,
                              has_subtitles boolean not null,
                              file_type varchar(300) not null,
                              file_size varchar(20) not null,
                              movie_id int,
                              foreign KEY(movie_id) references movie_tb(id)
);

create table funding_tb(
                           id int auto_increment primary key,
                           target_price int not null,
                           price_per_onetime int not null,
                           people_count int not null,
                           release_date date not null,
                           end_date date not null,
                           movie_id int,
                           foreign KEY(movie_id) references movie_tb(id)
);

create table funding_ready_tb(
                                 id int auto_increment primary key,
                                 target_price int not null,
                                 price_per_onetime int not null,
                                 people_count int not null,
                                 release_date date not null,
                                 end_date date not null,
                                 movie_id int,
                                 foreign KEY(movie_id) references movie_tb(id)
);

create table review_tb(
                          id int auto_increment primary key,
                          content varchar(100) not null,
                          created_at datetime not null,
                          user_id int,
                          movie_id int,
                          foreign KEY(user_id) references user_tb(id),
                          foreign KEY(movie_id) references movie_tb(id)
);


