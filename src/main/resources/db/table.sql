create table user_tb
(
    id            int auto_increment primary key,
    user_email    varchar(20)            not null unique,
    password      varchar(300)           not null,
    username      varchar(10)            not null,
    pic           varchar(300),
    grade         enum ('NORMAL', 'VIP') not null,
    tel           varchar(30)            not null unique,
    gubun         enum ('NORMAL', 'DIRECTOR', 'ADMIN'),
    is_withdrawal boolean                         default false,
    created_at    timestamp              not null default now()


);

create table theater_tb
(
    id                  int auto_increment primary key,
    theater_pic         varchar(300) not null,
    theater_name        varchar(30)  not null unique,
    theater_description varchar(500) not null,
    tel                 varchar(20)  not null,
    address             varchar(100) not null,
    park                varchar(30)  not null,
    total_seat          int          not null
);

create table movie_tb
(
    id                   int auto_increment primary key,
    make_year            varchar(30)   not null,
    production           varchar(30)    null,
    movie_name           varchar(50)   not null,
    synopsis             varchar(1000) not null,
    thumbnail            varchar(1000) not null,
    directing_intension  varchar(2000) null,
    genre                varchar(30)   null,
    running_grade        varchar(30)   null,
    director             varchar(30)   null,
    director_pic         varchar(300)  null,
    actor                varchar(200)  null,
    director_careers     varchar(4000),
    director_awards_film varchar(4000),
    online_release_date  Date,
    online_end_date      Date,
    offline_release_date Date,
    offline_end_date     Date,
    d_day                Date,
    chat_time            DateTime
);


create table movie_staff_tb
(
    id       int auto_increment primary key,
    director varchar(30)  null,
    filming  varchar(30)  null,
    art      varchar(30)  null,
    sound    varchar(30)  null,
    clothes  varchar(30)  null,
    script   varchar(30)  null,
    lighting varchar(30)  null,
    editing  varchar(30)  null,
    music    varchar(30)  null,
    movie_id int          null,
    foreign KEY (movie_id) references movie_tb (id)
);

create table movie_photo_tb
(
    id        int auto_increment primary key,
    movie_pic varchar(700) not null,
    movie_id  int          null,
    foreign KEY (movie_id) references movie_tb (id)
);

create table movie_file_tb
(
    id            int auto_increment primary key,
    origin_name   varchar(300) not null,
    path          varchar(300) not null,
    file_name     varchar(300) not null,
    graphics      varchar(10)  not null,
    has_subtitles boolean      not null,
    file_type     varchar(300) not null,
    file_size     varchar(20)  not null,
    movie_id      int          not null,
    foreign KEY (movie_id) references movie_tb (id)
);

create table funding_tb
(
    id                int auto_increment primary key,
    target_price      int  not null default 0,
    present_price     int default 0,
    price_per_onetime int  not null default 0,
    people_count      int default 0,
    release_date      date not null,
    end_date          date not null,
    movie_id          int  not null,
    foreign KEY (movie_id) references movie_tb (id)
);

create table funding_ready_tb
(
    id                int auto_increment primary key,
    target_price      int  not null,
    present_price     int,
    price_per_onetime int  not null,
    people_count      int,
    release_date      date not null,
    end_date          date not null,
    movie_id          int  not null,
    foreign KEY (movie_id) references movie_tb (id)
);

create table review_tb
(
    id         int auto_increment primary key,
    content    varchar(100) not null,
    created_at datetime     not null default now(),
    user_id    int          not null,
    movie_id   int          not null,
    foreign KEY (user_id) references user_tb (id),
    foreign KEY (movie_id) references movie_tb (id)
);

create table vip_review_tb
(
    id         int auto_increment primary key,
    content    varchar(100) not null,
    created_at datetime     not null default now(),
    point      int          not null,
    user_id    int          not null,
    movie_id   int          not null,
    foreign KEY (user_id) references user_tb (id),
    foreign KEY (movie_id) references movie_tb (id)
);

create table running_schedule_tb
(
    id           int auto_increment primary key,
    running_time int      not null,
    running_date datetime not null,
    start_time   time     not null,
    end_time     time     not null,
    movie_id     int      not null,
    theater_id   int      not null,
    foreign KEY (movie_id) references movie_tb (id),
    foreign KEY (theater_id) references theater_tb (id)
);

create table seat_tb
(
    id                  int auto_increment primary key,
    seats               varchar(100) not null,
    running_schedule_id int          not null,
    user_id             int          not null,
    foreign KEY (running_schedule_id) references running_schedule_tb (id),
    foreign KEY (user_id) references user_tb (id)
);


create table reservation_tb
(
    id               int auto_increment primary key,
    reservation_code varchar(50) not null,
    reservated_at    datetime    not null default now(),
    user_id          int         not null,
    seat_id          int,
    foreign KEY (user_id) references user_tb (id),
    foreign KEY (seat_id) references seat_tb (id),
    CONSTRAINT unique_constraint_name UNIQUE (id, user_id)
);

create table order_tb
(
    id             int auto_increment primary key,
    selected_seats varchar(200),
    product_price  int,
    quantity       int not null,
    funding_id     int not null,
    user_id        int not null,
    reservation_id int not null,
    foreign KEY (funding_id) references funding_tb (id),
    foreign KEY (user_id) references user_tb (id),
    foreign KEY (reservation_id) references reservation_tb (id)
);

create table payment_tb
(
    id              int auto_increment primary key,
    total_price     int      not null,
    discount_price  int      not null,
    final_price     int      not null,
    paymented_at    datetime not null default now(),
    payment_type_id int      not null,
    order_id        int      not null,
    foreign KEY (payment_type_id) references payment_tb (id),
    foreign KEY (order_id) references order_tb (id)
);

create table refund_tb
(
    id             int auto_increment primary key,
    refund_payment int      not null,
    refunded_at    datetime not null default now(),
    payment_id     int      not null,
    foreign KEY (payment_id) references payment_tb (id)
);

create table payment_type_tb
(
    id   int auto_increment primary key,
    type varchar(20) not null
);

create table scrab_tb
(
    id         int auto_increment primary key,
    user_id    int not null,
    funding_id int not null,
    foreign KEY (user_id) references user_tb (id),
    foreign KEY (funding_id) references funding_tb (id)
);


create table notice_tb
(
    id           int auto_increment primary key,
    notice_title varchar(20)  not null,
    content      varchar(200) not null,
    category     varchar(20)  not null,
    created_at   datetime     not null default now()
);



create table banner_tb
(
    id         int auto_increment primary key,
    banner_pic varchar(200) not null,
    genre      varchar(20)  not null,
    created_at datetime     not null default now(),
    movie_id   int          not null,
    foreign KEY (movie_id) references movie_tb (id)

);




create table invitation_tb
(


    id              int auto_increment primary key,
    invitation_code varchar(30)  not null,
    movie_name      varchar(30)  not null,
    theater_name    varchar(30)  not null,
    theater_address varchar(100) not null,
    movie_time      varchar(100) not null,
    created_at      datetime     not null default now(),
    user_id         int          not null,
    foreign KEY (user_id) references user_tb (id)

);


create table question_tb
(
    id             int auto_increment primary key,
    question_title varchar(20)  not null,
    content        varchar(200) not null,
    category       varchar(20)  not null,
    created_at     datetime     not null default now()
);