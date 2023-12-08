insert into user_tb(user_email, password, username, pic, grade, tel, gubun, created_at)
values('ssar@nate.com', '1234', '쌀', '/images/ssar.jpg', 'NORMAL', '010-1122-3344', 'NORMAL', now());

insert into user_tb(user_email, password, username, pic, grade, tel, gubun, created_at)
values('cos@nate.com', '1234', '코스', '/images/cos.jpg', 'VIP', '010-4455-6677', 'NORMAL', now());

insert into user_tb(user_email, password, username, pic, grade, tel, gubun, created_at)
values('love@nate.com', '1234', '러브', '/images/love.jpg', 'NORMAL', '010-4455-6677', 'DIRECTOR', now());

insert into user_tb(user_email, password, username, pic, grade, tel, gubun, created_at)
values('happy@nate.com', '1234', '해피', '/images/happy.jpg', 'VIP', '010-4455-6677', 'DIRECTOR', now());

insert into theater_tb(theater_name, tel, address, park, total_seat) values ('메가박스 부산 부전동 지점', '051-494-1004', '부산시 부산진구 부전동 1004-1', '주차장 협소', 150);
insert into theater_tb(theater_name, tel, address, park, total_seat) values ('메가박스 대구 만촌동 지점', '054-422-2005', '대구시 수성구 만촌동 1004-1', '주차장 넓음', 150);
insert into theater_tb(theater_name, tel, address, park, total_seat) values ('메가박스 서울 서초동 지점', '02-422-2005', '서울시 수성구 만촌동 1006-1', '주차장 넓음', 160);
insert into theater_tb(theater_name, tel, address, park, total_seat) values ('메가박스 전라 수유동 지점', '02-562-1935', '전라북도 전북구 선유동 1007-1', '주차장 넓음', 180);
insert into theater_tb(theater_name, tel, address, park, total_seat) values ('메가박스 인천 그린동 지점', '033-662-2005', '인천 북구 국제동 1008-1', '주차장 넓음', 130);

select * from movie_tb;

insert into movie_tb(movie_name, synopsis, thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('스트리머','한 BJ가 남긴 기괴한 영상의 진위를 밝히겠다며 한 폐건물로 모인 5명의 스트리머들. 각자 라이브 방송을 진행하며 건물을 살펴보던 그들의 섬뜩하고 소름 끼치는 현장은 그야말로 리얼하게 생중계 되는데…
', '/src/resources/static/images/moviethumbnail/gk/streamer.jpeg' '부산형제복지원 사건 모티브', '극영화', '12세 이상 관람가', '김현수','장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[2023]스트리머', '2023 청룡영화제 우수작','2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(movie_name, synopsis, thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('만해한용운','한 BJ가 남긴 기괴한 영상의 진위를 밝히겠다며 한 폐건물로 모인 5명의 스트리머들. 각자 라이브 방송을 진행하며 건물을 살펴보던 그들의 섬뜩하고 소름 끼치는 현장은 그야말로 리얼하게 생중계 되는데…
', '/src/resources/static/images/moviethumbnail/gk/manhaejpeg' '부산형제복지원 사건 모티브', '극영화', '12세 이상 관람가', '김현수','장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[2023]스트리머', '2023 청룡영화제 우수작','2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(movie_name, synopsis, thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('홈리스권제니','한 BJ가 남긴 기괴한 영상의 진위를 밝히겠다며 한 폐건물로 모인 5명의 스트리머들. 각자 라이브 방송을 진행하며 건물을 살펴보던 그들의 섬뜩하고 소름 끼치는 현장은 그야말로 리얼하게 생중계 되는데…
', '/src/resources/static/images/moviethumbnail/gk/homeless.jpeg' '부산형제복지원 사건 모티브', '극영화', '12세 이상 관람가', '김현수','장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[2023]스트리머', '2023 청룡영화제 우수작','2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(movie_name, synopsis, thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('불멸의여신','한 BJ가 남긴 기괴한 영상의 진위를 밝히겠다며 한 폐건물로 모인 5명의 스트리머들. 각자 라이브 방송을 진행하며 건물을 살펴보던 그들의 섬뜩하고 소름 끼치는 현장은 그야말로 리얼하게 생중계 되는데…
', '/src/resources/static/images/moviethumbnail/gk/bulmyeolpeg' '부산형제복지원 사건 모티브', '극영화', '12세 이상 관람가', '김현수','장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[2023]스트리머', '2023 청룡영화제 우수작','2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(movie_name, synopsis, thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('내가누워있을때','한 BJ가 남긴 기괴한 영상의 진위를 밝히겠다며 한 폐건물로 모인 5명의 스트리머들. 각자 라이브 방송을 진행하며 건물을 살펴보던 그들의 섬뜩하고 소름 끼치는 현장은 그야말로 리얼하게 생중계 되는데…
', '/src/resources/static/images/moviethumbnail/gk/naega.jpeg' '부산형제복지원 사건 모티브', '극영화', '12세 이상 관람가', '김현수','장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[2023]스트리머', '2023 청룡영화제 우수작','2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(movie_name, synopsis, thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('애도되지못한슬픔','한 BJ가 남긴 기괴한 영상의 진위를 밝히겠다며 한 폐건물로 모인 5명의 스트리머들. 각자 라이브 방송을 진행하며 건물을 살펴보던 그들의 섬뜩하고 소름 끼치는 현장은 그야말로 리얼하게 생중계 되는데…
', '/src/resources/static/images/moviethumbnail/gk/ado.jpeg' '부산형제복지원 사건 모티브', '극영화', '12세 이상 관람가', '김현수','장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[2023]스트리머', '2023 청룡영화제 우수작','2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(movie_name, synopsis, thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('불청객들','한 BJ가 남긴 기괴한 영상의 진위를 밝히겠다며 한 폐건물로 모인 5명의 스트리머들. 각자 라이브 방송을 진행하며 건물을 살펴보던 그들의 섬뜩하고 소름 끼치는 현장은 그야말로 리얼하게 생중계 되는데…
', '/src/resources/static/images/moviethumbnail/gk/bulchung.jpeg' '부산형제복지원 사건 모티브', '극영화', '12세 이상 관람가', '김현수','장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[2023]스트리머', '2023 청룡영화제 우수작','2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(movie_name, synopsis, thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('엑스','한 BJ가 남긴 기괴한 영상의 진위를 밝히겠다며 한 폐건물로 모인 5명의 스트리머들. 각자 라이브 방송을 진행하며 건물을 살펴보던 그들의 섬뜩하고 소름 끼치는 현장은 그야말로 리얼하게 생중계 되는데…
', '/src/resources/static/images/moviethumbnail/gk/streamer.jpeg' '부산형제복지원 사건 모티브', '극영화', '12세 이상 관람가', '김현수','장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[2023]스트리머', '2023 청룡영화제 우수작','2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(movie_name, synopsis, thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('안 할 이유 없는 임신','한 BJ가 남긴 기괴한 영상의 진위를 밝히겠다며 한 폐건물로 모인 5명의 스트리머들. 각자 라이브 방송을 진행하며 건물을 살펴보던 그들의 섬뜩하고 소름 끼치는 현장은 그야말로 리얼하게 생중계 되는데…
', '/src/resources/static/images/moviethumbnail/animation/anhal.jpeg' '부산형제복지원 사건 모티브', '극영화', '12세 이상 관람가', '김현수','장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[2023]스트리머', '2023 청룡영화제 우수작','2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(movie_name, synopsis, thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('건전지 엄마','한 BJ가 남긴 기괴한 영상의 진위를 밝히겠다며 한 폐건물로 모인 5명의 스트리머들. 각자 라이브 방송을 진행하며 건물을 살펴보던 그들의 섬뜩하고 소름 끼치는 현장은 그야말로 리얼하게 생중계 되는데…
', '/src/resources/static/images/moviethumbnail/animation/gunjeonji.jpeg' '부산형제복지원 사건 모티브', '극영화', '12세 이상 관람가', '김현수','장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[2023]스트리머', '2023 청룡영화제 우수작','2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(movie_name, synopsis, thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('쿠키 커피 도시락','한 BJ가 남긴 기괴한 영상의 진위를 밝히겠다며 한 폐건물로 모인 5명의 스트리머들. 각자 라이브 방송을 진행하며 건물을 살펴보던 그들의 섬뜩하고 소름 끼치는 현장은 그야말로 리얼하게 생중계 되는데…
', '/src/resources/static/images/moviethumbnail/animation/cookie.jpeg' '부산형제복지원 사건 모티브', '극영화', '12세 이상 관람가', '김현수','장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[2023]스트리머', '2023 청룡영화제 우수작','2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(movie_name, synopsis, thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('저주소년','한 BJ가 남긴 기괴한 영상의 진위를 밝히겠다며 한 폐건물로 모인 5명의 스트리머들. 각자 라이브 방송을 진행하며 건물을 살펴보던 그들의 섬뜩하고 소름 끼치는 현장은 그야말로 리얼하게 생중계 되는데…
', '/src/resources/static/images/moviethumbnail/animation/jeoju.jpeg' '부산형제복지원 사건 모티브', '극영화', '12세 이상 관람가', '김현수','장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[2023]스트리머', '2023 청룡영화제 우수작','2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(movie_name, synopsis, thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('인형 이야기','한 BJ가 남긴 기괴한 영상의 진위를 밝히겠다며 한 폐건물로 모인 5명의 스트리머들. 각자 라이브 방송을 진행하며 건물을 살펴보던 그들의 섬뜩하고 소름 끼치는 현장은 그야말로 리얼하게 생중계 되는데…
', '/src/resources/static/images/moviethumbnail/animation/inhyung.jpeg' '부산형제복지원 사건 모티브', '극영화', '12세 이상 관람가', '김현수','장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[2023]스트리머', '2023 청룡영화제 우수작','2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(movie_name, synopsis, thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('사라지는 것들','한 BJ가 남긴 기괴한 영상의 진위를 밝히겠다며 한 폐건물로 모인 5명의 스트리머들. 각자 라이브 방송을 진행하며 건물을 살펴보던 그들의 섬뜩하고 소름 끼치는 현장은 그야말로 리얼하게 생중계 되는데…
', '/src/resources/static/images/moviethumbnail/animation/sara.jpeg' '부산형제복지원 사건 모티브', '극영화', '12세 이상 관람가', '김현수','장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[2023]스트리머', '2023 청룡영화제 우수작','2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(movie_name, synopsis, thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('도그피쉬','한 BJ가 남긴 기괴한 영상의 진위를 밝히겠다며 한 폐건물로 모인 5명의 스트리머들. 각자 라이브 방송을 진행하며 건물을 살펴보던 그들의 섬뜩하고 소름 끼치는 현장은 그야말로 리얼하게 생중계 되는데…
', '/src/resources/static/images/moviethumbnail/animation/dog.jpeg' '부산형제복지원 사건 모티브', '극영화', '12세 이상 관람가', '김현수','장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[2023]스트리머', '2023 청룡영화제 우수작','2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(movie_name, synopsis, thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('마법이 돌아오는 날의 바다','한 BJ가 남긴 기괴한 영상의 진위를 밝히겠다며 한 폐건물로 모인 5명의 스트리머들. 각자 라이브 방송을 진행하며 건물을 살펴보던 그들의 섬뜩하고 소름 끼치는 현장은 그야말로 리얼하게 생중계 되는데…
', '/src/resources/static/images/moviethumbnail/animation/mabup.jepg' '부산형제복지원 사건 모티브', '극영화', '12세 이상 관람가', '김현수','장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[2023]스트리머', '2023 청룡영화제 우수작','2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(movie_name, synopsis, thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('크로노스','한 BJ가 남긴 기괴한 영상의 진위를 밝히겠다며 한 폐건물로 모인 5명의 스트리머들. 각자 라이브 방송을 진행하며 건물을 살펴보던 그들의 섬뜩하고 소름 끼치는 현장은 그야말로 리얼하게 생중계 되는데…
', '/src/resources/static/images/moviethumbnail/animation/cro.jpeg' '부산형제복지원 사건 모티브', '극영화', '12세 이상 관람가', '김현수','장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[2023]스트리머', '2023 청룡영화제 우수작','2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(movie_name, synopsis, thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('마녀들의 카니발','한 BJ가 남긴 기괴한 영상의 진위를 밝히겠다며 한 폐건물로 모인 5명의 스트리머들. 각자 라이브 방송을 진행하며 건물을 살펴보던 그들의 섬뜩하고 소름 끼치는 현장은 그야말로 리얼하게 생중계 되는데…
', '/src/resources/static/images/moviethumbnail/documentary/manyeo.jpeg' '부산형제복지원 사건 모티브', '극영화', '12세 이상 관람가', '김현수','장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[2023]스트리머', '2023 청룡영화제 우수작','2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(movie_name, synopsis, thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('1975','한 BJ가 남긴 기괴한 영상의 진위를 밝히겠다며 한 폐건물로 모인 5명의 스트리머들. 각자 라이브 방송을 진행하며 건물을 살펴보던 그들의 섬뜩하고 소름 끼치는 현장은 그야말로 리얼하게 생중계 되는데…
', '/src/resources/static/images/moviethumbnail/documentary/1975.jpeg' '부산형제복지원 사건 모티브', '극영화', '12세 이상 관람가', '김현수','장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[2023]스트리머', '2023 청룡영화제 우수작','2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(movie_name, synopsis, thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('비상구 없는 집','한 BJ가 남긴 기괴한 영상의 진위를 밝히겠다며 한 폐건물로 모인 5명의 스트리머들. 각자 라이브 방송을 진행하며 건물을 살펴보던 그들의 섬뜩하고 소름 끼치는 현장은 그야말로 리얼하게 생중계 되는데…
', '/src/resources/static/images/moviethumbnail/documentary/bisang.jpeg' '부산형제복지원 사건 모티브', '극영화', '12세 이상 관람가', '김현수','장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[2023]스트리머', '2023 청룡영화제 우수작','2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(movie_name, synopsis, thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('곰마워','한 BJ가 남긴 기괴한 영상의 진위를 밝히겠다며 한 폐건물로 모인 5명의 스트리머들. 각자 라이브 방송을 진행하며 건물을 살펴보던 그들의 섬뜩하고 소름 끼치는 현장은 그야말로 리얼하게 생중계 되는데…
', '/src/resources/static/images/moviethumbnail/documentary/gomma.jpeg' '부산형제복지원 사건 모티브', '극영화', '12세 이상 관람가', '김현수','장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[2023]스트리머', '2023 청룡영화제 우수작','2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(movie_name, synopsis, thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('홈그라운드','한 BJ가 남긴 기괴한 영상의 진위를 밝히겠다며 한 폐건물로 모인 5명의 스트리머들. 각자 라이브 방송을 진행하며 건물을 살펴보던 그들의 섬뜩하고 소름 끼치는 현장은 그야말로 리얼하게 생중계 되는데…
', '/src/resources/static/images/moviethumbnail/documentary/homeground.jpeg' '부산형제복지원 사건 모티브', '극영화', '12세 이상 관람가', '김현수','장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[2023]스트리머', '2023 청룡영화제 우수작','2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(movie_name, synopsis, thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('인간의 마음','한 BJ가 남긴 기괴한 영상의 진위를 밝히겠다며 한 폐건물로 모인 5명의 스트리머들. 각자 라이브 방송을 진행하며 건물을 살펴보던 그들의 섬뜩하고 소름 끼치는 현장은 그야말로 리얼하게 생중계 되는데…
', '/src/resources/static/images/moviethumbnail/documentary/ingan.jpeg' '부산형제복지원 사건 모티브', '극영화', '12세 이상 관람가', '김현수','장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[2023]스트리머', '2023 청룡영화제 우수작','2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(movie_name, synopsis, thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('천변의 악사들','한 BJ가 남긴 기괴한 영상의 진위를 밝히겠다며 한 폐건물로 모인 5명의 스트리머들. 각자 라이브 방송을 진행하며 건물을 살펴보던 그들의 섬뜩하고 소름 끼치는 현장은 그야말로 리얼하게 생중계 되는데…
', '/src/resources/static/images/moviethumbnail/documentary/chunbyun.jpeg' '부산형제복지원 사건 모티브', '극영화', '12세 이상 관람가', '김현수','장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[2023]스트리머', '2023 청룡영화제 우수작','2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(movie_name, synopsis, thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('분첩','한 BJ가 남긴 기괴한 영상의 진위를 밝히겠다며 한 폐건물로 모인 5명의 스트리머들. 각자 라이브 방송을 진행하며 건물을 살펴보던 그들의 섬뜩하고 소름 끼치는 현장은 그야말로 리얼하게 생중계 되는데…
', '/src/resources/static/images/moviethumbnail/experiment/bunchup.jpeg' '부산형제복지원 사건 모티브', '극영화', '12세 이상 관람가', '김현수','장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[2023]스트리머', '2023 청룡영화제 우수작','2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(movie_name, synopsis, thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('차가운 새들의 세계','한 BJ가 남긴 기괴한 영상의 진위를 밝히겠다며 한 폐건물로 모인 5명의 스트리머들. 각자 라이브 방송을 진행하며 건물을 살펴보던 그들의 섬뜩하고 소름 끼치는 현장은 그야말로 리얼하게 생중계 되는데…
', '/src/resources/static/images/moviethumbnail/experiment/chaga.jpeg' '부산형제복지원 사건 모티브', '극영화', '12세 이상 관람가', '김현수','장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[2023]스트리머', '2023 청룡영화제 우수작','2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(movie_name, synopsis, thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('우리의 시간','한 BJ가 남긴 기괴한 영상의 진위를 밝히겠다며 한 폐건물로 모인 5명의 스트리머들. 각자 라이브 방송을 진행하며 건물을 살펴보던 그들의 섬뜩하고 소름 끼치는 현장은 그야말로 리얼하게 생중계 되는데…
', '/src/resources/static/images/moviethumbnail/experiment/uri.jpeg' '부산형제복지원 사건 모티브', '극영화', '12세 이상 관람가', '김현수','장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[2023]스트리머', '2023 청룡영화제 우수작','2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(movie_name, synopsis, thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('이것은 보이는 것과 다르다','한 BJ가 남긴 기괴한 영상의 진위를 밝히겠다며 한 폐건물로 모인 5명의 스트리머들. 각자 라이브 방송을 진행하며 건물을 살펴보던 그들의 섬뜩하고 소름 끼치는 현장은 그야말로 리얼하게 생중계 되는데…
', '/src/resources/static/images/moviethumbnail/experiment/egut.jpeg' '부산형제복지원 사건 모티브', '극영화', '12세 이상 관람가', '김현수','장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[2023]스트리머', '2023 청룡영화제 우수작','2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(movie_name, synopsis, thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('소진된 인간','한 BJ가 남긴 기괴한 영상의 진위를 밝히겠다며 한 폐건물로 모인 5명의 스트리머들. 각자 라이브 방송을 진행하며 건물을 살펴보던 그들의 섬뜩하고 소름 끼치는 현장은 그야말로 리얼하게 생중계 되는데…
', '/src/resources/static/images/moviethumbnail/experiment/sojin.jpeg' '부산형제복지원 사건 모티브', '극영화', '12세 이상 관람가', '김현수','장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[2023]스트리머', '2023 청룡영화제 우수작','2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

