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

create table vip_review_tb(
                              id int auto_increment primary key,
                              content varchar(100) not null,
                              created_at datetime not null,
                              point int not null,
                              user_id int,
                              movie_id int,
                              foreign KEY(user_id) references user_tb(id),
                              foreign KEY(movie_id) references movie_tb(id)
);

create table running_schedule_tb(
                                    id int auto_increment primary key,
                                    running_time int not null,
                                    running_date datetime not null,
                                    start_time time not null,
                                    end_time time not null,
                                    movie_id int,
                                    theater_id int,
                                    foreign KEY(movie_id) references movie_tb(id),
                                    foreign KEY(theater_id) references theater_tb(id)
);

create table seat_tb(
                        id int auto_increment primary key,
                        seat_name varchar(5) not null,
                        running_schedule_id int not null,
                        foreign KEY(running_schedule_id) references running_schedule_tb(id)
);


create table reservation_tb(
                               id int auto_increment primary key,
                               reservation_code varchar(50) not null,
                               reservated_at datetime not null,
                               user_id int not null,
                               seat_id int not null,
                               foreign KEY(user_id) references user_tb(id),
                               foreign KEY(seat_id) references seat_tb(id)
);

create table order_tb(
                         id int auto_increment primary key,
                         selected_seats varchar(200) not null,
                         product_price int not null,
                         quantity int not null,
                         funding_id int not null,
                         user_id int not null,
                         foreign KEY(funding_id) references funding_tb(id),
                         foreign KEY(user_id) references user_tb(id)
);

create table payment_tb(
                           id int auto_increment primary key,
                           total_price int not null,
                           discount_price int not null,
                           final_price int not null,
                           paymented_at datetime not null,
                           payment_type_id int not null,
                           order_id int not null,
                           foreign KEY(payment_type_id) references payment_tb(id),
                           foreign KEY(order_id) references order_tb(id)
);

create table refund_tb(
                          id int auto_increment primary key,
                          refund_payment int not null,
                          refunded_at date not null,
                          payment_id int not null,
                          foreign KEY(payment_id) references payment_tb(id)
);

create table payment_type_tb(
                                id int auto_increment primary key,
                                type varchar(20) not null
);

create table scrab_tb(
                         id int auto_increment primary key,
                         user_id int not null,
                         funding_id int not null,
                         foreign KEY(user_id) references user_tb(id),
                         foreign KEY(funding_id) references funding_tb(id)
);


create table notice_tb(
                          id int auto_increment primary key,
                          notice_title varchar(20) not null,
                          content varchar(200) not null,
                          category varchar(20) not null,
                          created_at date not null
);
