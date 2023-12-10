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

insert into movie_tb(make_year, production, movie_name, synopsis, thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('2023', '(주)시네마프로덕션', '스트리머','한 BJ가 남긴 기괴한 영상의 진위를 밝히겠다며 한 폐건물로 모인 5명의 스트리머들. 각자 라이브 방송을 진행하며 건물을 살펴보던 그들의 섬뜩하고 소름 끼치는 현장은 그야말로 리얼하게 생중계 되는데…
', '/src/resources/static/images/moviethumbnail/gk/streamer.jpeg', '부산형제복지원 사건 모티브', '극영화', '12세 이상 관람가','장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[2023]스트리머', '2023 청룡영화제 우수작','2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(make_year, production, movie_name, synopsis, thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('2023', '(주)시네마프로덕션', '만해한용운','한 BJ가 남긴 기괴한 영상의 진위를 밝히겠다며 한 폐건물로 모인 5명의 스트리머들. 각자 라이브 방송을 진행하며 건물을 살펴보던 그들의 섬뜩하고 소름 끼치는 현장은 그야말로 리얼하게 생중계 되는데…
', '/src/resources/static/images/moviethumbnail/gk/manhaejpeg', '부산형제복지원 사건 모티브', '극영화', '12세 이상 관람가','장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[2023]스트리머', '2023 청룡영화제 우수작','2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(make_year, production, movie_name, synopsis, thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('2023', '(주)시네마프로덕션', '홈리스권제니','한 BJ가 남긴 기괴한 영상의 진위를 밝히겠다며 한 폐건물로 모인 5명의 스트리머들. 각자 라이브 방송을 진행하며 건물을 살펴보던 그들의 섬뜩하고 소름 끼치는 현장은 그야말로 리얼하게 생중계 되는데…
', '/src/resources/static/images/moviethumbnail/gk/homeless.jpeg', '부산형제복지원 사건 모티브', '극영화', '12세 이상 관람가','장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[2023]스트리머', '2023 청룡영화제 우수작','2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(make_year, production, movie_name, synopsis, thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('2023', '(주)시네마프로덕션', '불멸의여신','한 BJ가 남긴 기괴한 영상의 진위를 밝히겠다며 한 폐건물로 모인 5명의 스트리머들. 각자 라이브 방송을 진행하며 건물을 살펴보던 그들의 섬뜩하고 소름 끼치는 현장은 그야말로 리얼하게 생중계 되는데…
', '/src/resources/static/images/moviethumbnail/gk/bulmyeolpeg', '부산형제복지원 사건 모티브', '극영화', '12세 이상 관람가','장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[2023]스트리머', '2023 청룡영화제 우수작','2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(make_year, production, movie_name, synopsis, thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('2023', '(주)시네마프로덕션', '내가누워있을때','한 BJ가 남긴 기괴한 영상의 진위를 밝히겠다며 한 폐건물로 모인 5명의 스트리머들. 각자 라이브 방송을 진행하며 건물을 살펴보던 그들의 섬뜩하고 소름 끼치는 현장은 그야말로 리얼하게 생중계 되는데…
', '/src/resources/static/images/moviethumbnail/gk/naega.jpeg', '부산형제복지원 사건 모티브', '극영화', '12세 이상 관람가','장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[2023]스트리머', '2023 청룡영화제 우수작','2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(make_year, production, movie_name, synopsis, thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('2023', '(주)시네마프로덕션', '애도되지못한슬픔','한 BJ가 남긴 기괴한 영상의 진위를 밝히겠다며 한 폐건물로 모인 5명의 스트리머들. 각자 라이브 방송을 진행하며 건물을 살펴보던 그들의 섬뜩하고 소름 끼치는 현장은 그야말로 리얼하게 생중계 되는데…
', '/src/resources/static/images/moviethumbnail/gk/ado.jpeg', '부산형제복지원 사건 모티브', '극영화', '12세 이상 관람가','장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[2023]스트리머', '2023 청룡영화제 우수작','2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(make_year, production, movie_name, synopsis, thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('2023', '(주)시네마프로덕션', '불청객들','한 BJ가 남긴 기괴한 영상의 진위를 밝히겠다며 한 폐건물로 모인 5명의 스트리머들. 각자 라이브 방송을 진행하며 건물을 살펴보던 그들의 섬뜩하고 소름 끼치는 현장은 그야말로 리얼하게 생중계 되는데…
', '/src/resources/static/images/moviethumbnail/gk/bulchung.jpeg', '부산형제복지원 사건 모티브', '극영화', '12세 이상 관람가','장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[2023]스트리머', '2023 청룡영화제 우수작','2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(make_year, production, movie_name, synopsis, thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('2024', '(주)시네마프로덕션', '엑스','한 BJ가 남긴 기괴한 영상의 진위를 밝히겠다며 한 폐건물로 모인 5명의 스트리머들. 각자 라이브 방송을 진행하며 건물을 살펴보던 그들의 섬뜩하고 소름 끼치는 현장은 그야말로 리얼하게 생중계 되는데…
', '/src/resources/static/images/moviethumbnail/gk/streamer.jpeg', '부산형제복지원 사건 모티브', '극영화', '12세 이상 관람가','장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[2023]스트리머', '2023 청룡영화제 우수작','2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(make_year, production, movie_name, synopsis, thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('2023', '(주)시네마프로덕션', '안 할 이유 없는 임신','한 BJ가 남긴 기괴한 영상의 진위를 밝히겠다며 한 폐건물로 모인 5명의 스트리머들. 각자 라이브 방송을 진행하며 건물을 살펴보던 그들의 섬뜩하고 소름 끼치는 현장은 그야말로 리얼하게 생중계 되는데…
', '/src/resources/static/images/moviethumbnail/animation/anhal.jpeg', '부산형제복지원 사건 모티브', '애니메이션', '12세 이상 관람가','장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[2023]스트리머', '2023 청룡영화제 우수작','2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(make_year, production, movie_name, synopsis, thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('2024', '(주)시네마프로덕션', '건전지 엄마','한 BJ가 남긴 기괴한 영상의 진위를 밝히겠다며 한 폐건물로 모인 5명의 스트리머들. 각자 라이브 방송을 진행하며 건물을 살펴보던 그들의 섬뜩하고 소름 끼치는 현장은 그야말로 리얼하게 생중계 되는데…
', '/src/resources/static/images/moviethumbnail/animation/gunjeonji.jpeg', '부산형제복지원 사건 모티브', '애니메이션', '12세 이상 관람가','장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[2023]스트리머', '2023 청룡영화제 우수작','2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(make_year, production, movie_name, synopsis, thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('2024', '(주)시네마프로덕션', '쿠키 커피 도시락','한 BJ가 남긴 기괴한 영상의 진위를 밝히겠다며 한 폐건물로 모인 5명의 스트리머들. 각자 라이브 방송을 진행하며 건물을 살펴보던 그들의 섬뜩하고 소름 끼치는 현장은 그야말로 리얼하게 생중계 되는데…
', '/src/resources/static/images/moviethumbnail/animation/cookie.jpeg', '부산형제복지원 사건 모티브', '애니메이션', '12세 이상 관람가','장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[2023]스트리머', '2023 청룡영화제 우수작','2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(make_year, production, movie_name, synopsis, thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('2023', '(주)시네마프로덕션', '저주소년','한 BJ가 남긴 기괴한 영상의 진위를 밝히겠다며 한 폐건물로 모인 5명의 스트리머들. 각자 라이브 방송을 진행하며 건물을 살펴보던 그들의 섬뜩하고 소름 끼치는 현장은 그야말로 리얼하게 생중계 되는데…
', '/src/resources/static/images/moviethumbnail/animation/jeoju.jpeg', '부산형제복지원 사건 모티브', '애니메이션', '12세 이상 관람가','장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[2023]스트리머', '2023 청룡영화제 우수작','2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(make_year, production, movie_name, synopsis, thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('2024', '(주)시네마프로덕션', '인형 이야기','한 BJ가 남긴 기괴한 영상의 진위를 밝히겠다며 한 폐건물로 모인 5명의 스트리머들. 각자 라이브 방송을 진행하며 건물을 살펴보던 그들의 섬뜩하고 소름 끼치는 현장은 그야말로 리얼하게 생중계 되는데…
', '/src/resources/static/images/moviethumbnail/animation/inhyung.jpeg', '부산형제복지원 사건 모티브', '애니메이션', '12세 이상 관람가','장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[2023]스트리머', '2023 청룡영화제 우수작','2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(make_year, production, movie_name, synopsis, thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('2023', '(주)시네마프로덕션', '사라지는 것들','한 BJ가 남긴 기괴한 영상의 진위를 밝히겠다며 한 폐건물로 모인 5명의 스트리머들. 각자 라이브 방송을 진행하며 건물을 살펴보던 그들의 섬뜩하고 소름 끼치는 현장은 그야말로 리얼하게 생중계 되는데…
', '/src/resources/static/images/moviethumbnail/animation/sara.jpeg', '부산형제복지원 사건 모티브', '애니메이션', '12세 이상 관람가','장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[2023]스트리머', '2023 청룡영화제 우수작','2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(make_year, production, movie_name, synopsis, thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('2024', '(주)시네마프로덕션', '도그피쉬','한 BJ가 남긴 기괴한 영상의 진위를 밝히겠다며 한 폐건물로 모인 5명의 스트리머들. 각자 라이브 방송을 진행하며 건물을 살펴보던 그들의 섬뜩하고 소름 끼치는 현장은 그야말로 리얼하게 생중계 되는데…
', '/src/resources/static/images/moviethumbnail/animation/dog.jpeg', '부산형제복지원 사건 모티브', '애니메이션', '12세 이상 관람가','장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[2023]스트리머', '2023 청룡영화제 우수작','2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(make_year, production, movie_name, synopsis, thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('2023', '(주)시네마프로덕션', '마법이 돌아오는 날의 바다','한 BJ가 남긴 기괴한 영상의 진위를 밝히겠다며 한 폐건물로 모인 5명의 스트리머들. 각자 라이브 방송을 진행하며 건물을 살펴보던 그들의 섬뜩하고 소름 끼치는 현장은 그야말로 리얼하게 생중계 되는데…
', '/src/resources/static/images/moviethumbnail/animation/mabup.jepg', '부산형제복지원 사건 모티브', '애니메이션', '12세 이상 관람가','장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[2023]스트리머', '2023 청룡영화제 우수작','2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(make_year, production, movie_name, synopsis, thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('2024', '(주)시네마프로덕션', '크로노스','한 BJ가 남긴 기괴한 영상의 진위를 밝히겠다며 한 폐건물로 모인 5명의 스트리머들. 각자 라이브 방송을 진행하며 건물을 살펴보던 그들의 섬뜩하고 소름 끼치는 현장은 그야말로 리얼하게 생중계 되는데…
', '/src/resources/static/images/moviethumbnail/animation/cro.jpeg', '부산형제복지원 사건 모티브', '애니메이션', '12세 이상 관람가','장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[2023]스트리머', '2023 청룡영화제 우수작','2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(make_year, production, movie_name, synopsis, thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('2023', '(주)시네마프로덕션', '마녀들의 카니발','한 BJ가 남긴 기괴한 영상의 진위를 밝히겠다며 한 폐건물로 모인 5명의 스트리머들. 각자 라이브 방송을 진행하며 건물을 살펴보던 그들의 섬뜩하고 소름 끼치는 현장은 그야말로 리얼하게 생중계 되는데…
', '/src/resources/static/images/moviethumbnail/documentary/manyeo.jpeg', '부산형제복지원 사건 모티브', '다큐멘터리', '12세 이상 관람가','장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[2023]스트리머', '2023 청룡영화제 우수작','2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(make_year, production, movie_name, synopsis, thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('2023', '(주)시네마프로덕션', '1975','한 BJ가 남긴 기괴한 영상의 진위를 밝히겠다며 한 폐건물로 모인 5명의 스트리머들. 각자 라이브 방송을 진행하며 건물을 살펴보던 그들의 섬뜩하고 소름 끼치는 현장은 그야말로 리얼하게 생중계 되는데…
', '/src/resources/static/images/moviethumbnail/documentary/1975.jpeg', '부산형제복지원 사건 모티브', '다큐멘터리', '12세 이상 관람가','장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[2023]스트리머', '2023 청룡영화제 우수작','2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(make_year, production, movie_name, synopsis, thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('2023', '(주)시네마프로덕션', '비상구 없는 집','한 BJ가 남긴 기괴한 영상의 진위를 밝히겠다며 한 폐건물로 모인 5명의 스트리머들. 각자 라이브 방송을 진행하며 건물을 살펴보던 그들의 섬뜩하고 소름 끼치는 현장은 그야말로 리얼하게 생중계 되는데…
', '/src/resources/static/images/moviethumbnail/documentary/bisang.jpeg', '부산형제복지원 사건 모티브', '다큐멘터리', '12세 이상 관람가','장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[2023]스트리머', '2023 청룡영화제 우수작','2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(make_year, production, movie_name, synopsis, thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('2023', '(주)시네마프로덕션', '곰마워','한 BJ가 남긴 기괴한 영상의 진위를 밝히겠다며 한 폐건물로 모인 5명의 스트리머들. 각자 라이브 방송을 진행하며 건물을 살펴보던 그들의 섬뜩하고 소름 끼치는 현장은 그야말로 리얼하게 생중계 되는데…
', '/src/resources/static/images/moviethumbnail/documentary/gomma.jpeg', '부산형제복지원 사건 모티브', '다큐멘터리', '12세 이상 관람가','장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[2023]스트리머', '2023 청룡영화제 우수작','2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(make_year, production, movie_name, synopsis, thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('2023', '(주)시네마프로덕션', '홈그라운드','한 BJ가 남긴 기괴한 영상의 진위를 밝히겠다며 한 폐건물로 모인 5명의 스트리머들. 각자 라이브 방송을 진행하며 건물을 살펴보던 그들의 섬뜩하고 소름 끼치는 현장은 그야말로 리얼하게 생중계 되는데…
', '/src/resources/static/images/moviethumbnail/documentary/homeground.jpeg', '부산형제복지원 사건 모티브', '다큐멘터리', '12세 이상 관람가','장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[2023]스트리머', '2023 청룡영화제 우수작','2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(make_year, production, movie_name, synopsis, thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('2023', '(주)시네마프로덕션', '인간의 마음','한 BJ가 남긴 기괴한 영상의 진위를 밝히겠다며 한 폐건물로 모인 5명의 스트리머들. 각자 라이브 방송을 진행하며 건물을 살펴보던 그들의 섬뜩하고 소름 끼치는 현장은 그야말로 리얼하게 생중계 되는데…
', '/src/resources/static/images/moviethumbnail/documentary/ingan.jpeg', '부산형제복지원 사건 모티브', '다큐멘터리', '12세 이상 관람가','장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[2023]스트리머', '2023 청룡영화제 우수작','2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(make_year, production, movie_name, synopsis, thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('2023', '(주)시네마프로덕션', '천변의 악사들','한 BJ가 남긴 기괴한 영상의 진위를 밝히겠다며 한 폐건물로 모인 5명의 스트리머들. 각자 라이브 방송을 진행하며 건물을 살펴보던 그들의 섬뜩하고 소름 끼치는 현장은 그야말로 리얼하게 생중계 되는데…
', '/src/resources/static/images/moviethumbnail/documentary/chunbyun.jpeg', '부산형제복지원 사건 모티브', '다큐멘터리', '12세 이상 관람가','장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[2023]스트리머', '2023 청룡영화제 우수작','2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(make_year, production, movie_name, synopsis, thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('2023', '(주)시네마프로덕션', '분첩','한 BJ가 남긴 기괴한 영상의 진위를 밝히겠다며 한 폐건물로 모인 5명의 스트리머들. 각자 라이브 방송을 진행하며 건물을 살펴보던 그들의 섬뜩하고 소름 끼치는 현장은 그야말로 리얼하게 생중계 되는데…
', '/src/resources/static/images/moviethumbnail/experiment/bunchup.jpeg', '부산형제복지원 사건 모티브', '실험영화', '12세 이상 관람가','장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[2023]스트리머', '2023 청룡영화제 우수작','2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(make_year, production, movie_name, synopsis, thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('2024', '(주)시네마프로덕션', '차가운 새들의 세계','한 BJ가 남긴 기괴한 영상의 진위를 밝히겠다며 한 폐건물로 모인 5명의 스트리머들. 각자 라이브 방송을 진행하며 건물을 살펴보던 그들의 섬뜩하고 소름 끼치는 현장은 그야말로 리얼하게 생중계 되는데…
', '/src/resources/static/images/moviethumbnail/experiment/chaga.jpeg', '부산형제복지원 사건 모티브', '실험영화', '12세 이상 관람가','장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[2023]스트리머', '2023 청룡영화제 우수작','2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(make_year, production, movie_name, synopsis, thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('2023', '(주)시네마프로덕션', '우리의 시간','한 BJ가 남긴 기괴한 영상의 진위를 밝히겠다며 한 폐건물로 모인 5명의 스트리머들. 각자 라이브 방송을 진행하며 건물을 살펴보던 그들의 섬뜩하고 소름 끼치는 현장은 그야말로 리얼하게 생중계 되는데…
', '/src/resources/static/images/moviethumbnail/experiment/uri.jpeg', '부산형제복지원 사건 모티브', '실험영화', '12세 이상 관람가','장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[2023]스트리머', '2023 청룡영화제 우수작','2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(make_year, production, movie_name, synopsis, thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('2023', '(주)시네마프로덕션', '이것은 보이는 것과 다르다','한 BJ가 남긴 기괴한 영상의 진위를 밝히겠다며 한 폐건물로 모인 5명의 스트리머들. 각자 라이브 방송을 진행하며 건물을 살펴보던 그들의 섬뜩하고 소름 끼치는 현장은 그야말로 리얼하게 생중계 되는데…
', '/src/resources/static/images/moviethumbnail/experiment/egut.jpeg', '부산형제복지원 사건 모티브', '실험영화', '12세 이상 관람가','장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[2023]스트리머', '2023 청룡영화제 우수작','2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(make_year, production, movie_name, synopsis, thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('2023', '(주)시네마프로덕션', '소진된 인간','한 BJ가 남긴 기괴한 영상의 진위를 밝히겠다며 한 폐건물로 모인 5명의 스트리머들. 각자 라이브 방송을 진행하며 건물을 살펴보던 그들의 섬뜩하고 소름 끼치는 현장은 그야말로 리얼하게 생중계 되는데…
', '/src/resources/static/images/moviethumbnail/experiment/sojin.jpeg', '부산형제복지원 사건 모티브', '실험영화', '12세 이상 관람가','장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[2023]스트리머', '2023 청룡영화제 우수작','2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_staff_tb(director, filming, art, sound, clothes, script, lighting, editing, music, movie_id) values ('이영호', '김상수', '남은혜', '김하율', '이사라', '박남규', '박세환', '김언약', '정유수', 1);
insert into movie_staff_tb(director, filming, art, sound, clothes, script, lighting, editing, music, movie_id) values ('김사라', '김수호', '김하얀', '김철수', '이사라', '김남규', '김라희', '김민아', '박정환', 2);
insert into movie_staff_tb(director, filming, art, sound, clothes, script, lighting, editing, music, movie_id) values ('이사라', '김호수', '남은혜', '김하율', '이사라', '민선규', '이미소', '이만수', '김남수', 3);
insert into movie_staff_tb(director, filming, art, sound, clothes, script, lighting, editing, music, movie_id) values ('이영호', '김진수', '김하은', '김고은', '이사라', '박지민', '최민재', '천창환', '이유라', 4);
insert into movie_staff_tb(director, filming, art, sound, clothes, script, lighting, editing, music, movie_id) values ('지철환', '박상수', '남은혜', '김하율', '이사라', '김지민', '이영환', '편소영', '김지현', 5);
insert into movie_staff_tb(director, filming, art, sound, clothes, script, lighting, editing, music, movie_id) values ('박지민', '김남수', '김하얀', '김하율', '이설아', '최준호', '이필규', '이지민', '윤지환', 6);
insert into movie_staff_tb(director, filming, art, sound, clothes, script, lighting, editing, music, movie_id) values ('이영호', '김상수', '남은혜', '김하율', '이사라', '이준호', '이은빈', '김은빈', '최준호', 7);
insert into movie_staff_tb(director, filming, art, sound, clothes, script, lighting, editing, music, movie_id) values ('김철호', '박남일', '정유혜', '김고은', '이사라', '김규호', '박선민', '이은진', '박설아', 8);
insert into movie_staff_tb(director, filming, art, sound, clothes, script, lighting, editing, music, movie_id) values ('이수호', '김상수', '김하얀', '김하율', '이사라', '정영재', '최지환', '장용석', '박정민', 9);
insert into movie_staff_tb(director, filming, art, sound, clothes, script, lighting, editing, music, movie_id) values ('이영호', '김상수', '남은혜', '김하율', '이사라', '정지민', '최대홍', '이성웅', '최영호', 10);
insert into movie_staff_tb(director, filming, art, sound, clothes, script, lighting, editing, music, movie_id) values ('이영호', '김철수', '윤혜림', '김고은', '이사라', '최인호', '민선웅', '박재영', '최영재', 11);
insert into movie_staff_tb(director, filming, art, sound, clothes, script, lighting, editing, music, movie_id) values ('이영호', '김민수', '남은혜', '김하율', '이사라', '박남규', '최지웅', '김철수', '이인재', 12);
insert into movie_staff_tb(director, filming, art, sound, clothes, script, lighting, editing, music, movie_id) values ('이영호', '김민지', '김하은', '김하율', '이사라', '이설아', '이영웅', '민지은', '이철환', 13);
insert into movie_staff_tb(director, filming, art, sound, clothes, script, lighting, editing, music, movie_id) values ('이영민', '김지수', '남은혜', '정유수', '이사라', '최정민', '김사라', '김은지', '남필규', 14);
insert into movie_staff_tb(director, filming, art, sound, clothes, script, lighting, editing, music, movie_id) values ('이성호', '송민환', '남은혜', '김하율', '이사라', '김사랑', '박재영', '최민영', '이민지', 15);
insert into movie_staff_tb(director, filming, art, sound, clothes, script, lighting, editing, music, movie_id) values ('김진희', '송제인', '남은혜', '김하율', '이사라', '이미소', '이민서', '박인호', '이은혜', 16);
insert into movie_staff_tb(director, filming, art, sound, clothes, script, lighting, editing, music, movie_id) values ('지진희', '김상수', '정유수', '김하율', '이사라', '이혜수', '박민환', '장준은', '김사랑', 17);
insert into movie_staff_tb(director, filming, art, sound, clothes, script, lighting, editing, music, movie_id) values ('이민호', '송익상', '남은혜', '김하율', '이사라', '박남규', '이인형', '김보미', '박필규', 18);
insert into movie_staff_tb(director, filming, art, sound, clothes, script, lighting, editing, music, movie_id) values ('이영호', '김상수', '윤혜림', '김하율', '이사라', '박철민', '김택수', '이근호', '정유수', 19);
insert into movie_staff_tb(director, filming, art, sound, clothes, script, lighting, editing, music, movie_id) values ('이영호', '김상수', '남은혜', '김그린', '이사라', '박남규', '박세환', '김언약', '김라희', 20);
insert into movie_staff_tb(director, filming, art, sound, clothes, script, lighting, editing, music, movie_id) values ('이근호', '박수호', '정유수', '김하율', '이사라', '박남규', '박세인', '고민영', '이철민', 21);
insert into movie_staff_tb(director, filming, art, sound, clothes, script, lighting, editing, music, movie_id) values ('이웅진', '김상수', '남은혜', '김하율', '이사라', '박남규', '김철영', '김라희', '고만영', 22);
insert into movie_staff_tb(director, filming, art, sound, clothes, script, lighting, editing, music, movie_id) values ('최민재', '박나래', '윤혜림', '김하율', '이사라', '박남규', '박후민', '이미소', '윤민수', 23);
insert into movie_staff_tb(director, filming, art, sound, clothes, script, lighting, editing, music, movie_id) values ('이진수', '김상수', '남은혜', '김하율', '이사라', '박남규', '이영희', '박영환', '박민서', 24);
insert into movie_staff_tb(director, filming, art, sound, clothes, script, lighting, editing, music, movie_id) values ('박남기', '김수환', '김하은', '김하율', '이사라', '박남규', '진영수', '김영민', '서문환', 25);
insert into movie_staff_tb(director, filming, art, sound, clothes, script, lighting, editing, music, movie_id) values ('김영웅', '박수환', '윤혜림', '김그린', '이사라', '박남규', '여민재', '이인제', '이인영', 26);
insert into movie_staff_tb(director, filming, art, sound, clothes, script, lighting, editing, music, movie_id) values ('고영웅', '김상수', '남은혜', '김철수', '이사라', '박남규', '최철영', '최민수', '정지환', 27);
insert into movie_staff_tb(director, filming, art, sound, clothes, script, lighting, editing, music, movie_id) values ('이영수', '김재인', '이은지', '김하율', '이사라', '박남규', '이세환', '여민수', '정수민', 28);
insert into movie_staff_tb(director, filming, art, sound, clothes, script, lighting, editing, music, movie_id) values ('이영호', '송재익', '남은혜', '김하율', '이사라', '박남규', '박세환', '나민수', '정유진', 29);
insert into funding_tb(target_price, present_price, price_per_onetime, people_count, release_date, end_date, movie_id) values ('1000000', '300000', '8000', '40', '2023-11-01', '2023-12-31', 1);
insert into funding_tb(target_price, present_price, price_per_onetime, people_count, release_date, end_date, movie_id) values ('2000000', '400000', '8000', '40', '2023-11-01', '2023-12-31', 2);
insert into funding_tb(target_price, present_price, price_per_onetime, people_count, release_date, end_date, movie_id) values ('3000000', '500000', '8000', '40', '2023-11-01', '2023-12-31', 3);
insert into funding_tb(target_price, present_price, price_per_onetime, people_count, release_date, end_date, movie_id) values ('4000000', '700000', '8000', '40', '2023-11-01', '2023-12-31', 4);
insert into funding_tb(target_price, present_price, price_per_onetime, people_count, release_date, end_date, movie_id) values ('5000000', '1000000', '8000', '40', '2023-11-01', '2023-12-31', 5);
insert into funding_tb(target_price, present_price, price_per_onetime, people_count, release_date, end_date, movie_id) values ('4000000', '3000000', '8000', '40', '2023-11-01', '2023-12-31', 6);
insert into funding_tb(target_price, present_price, price_per_onetime, people_count, release_date, end_date, movie_id) values ('3000000', '300000', '8000', '40', '2023-11-01', '2023-12-31', 7);
insert into funding_tb(target_price, present_price, price_per_onetime, people_count, release_date, end_date, movie_id) values ('2000000', '300000', '8000', '40', '2023-11-01', '2023-12-31', 8);
insert into funding_tb(target_price, present_price, price_per_onetime, people_count, release_date, end_date, movie_id) values ('1000000', '400000', '8000', '40', '2023-11-01', '2023-12-31', 9);
insert into funding_tb(target_price, present_price, price_per_onetime, people_count, release_date, end_date, movie_id) values ('2000000', '500000', '8000', '40', '2023-11-01', '2023-12-31', 10);
insert into funding_tb(target_price, present_price, price_per_onetime, people_count, release_date, end_date, movie_id) values ('3000000', '600000', '8000', '40', '2023-11-01', '2023-12-31', 11);
insert into funding_tb(target_price, present_price, price_per_onetime, people_count, release_date, end_date, movie_id) values ('4000000', '800000', '8000', '40', '2023-11-01', '2023-12-31', 12);
insert into funding_tb(target_price, present_price, price_per_onetime, people_count, release_date, end_date, movie_id) values ('5000000', '1500000', '8000', '40', '2023-11-01', '2023-12-31', 13);
insert into funding_tb(target_price, present_price, price_per_onetime, people_count, release_date, end_date, movie_id) values ('6000000', '1200000', '8000', '40', '2023-11-01', '2023-12-31', 14);
insert into funding_tb(target_price, present_price, price_per_onetime, people_count, release_date, end_date, movie_id) values ('7000000', '2100000', '8000', '40', '2023-11-01', '2023-12-31', 15);
insert into funding_tb(target_price, present_price, price_per_onetime, people_count, release_date, end_date, movie_id) values ('6000000', '3000000', '8000', '40', '2023-11-01', '2023-12-31', 16);
insert into funding_tb(target_price, present_price, price_per_onetime, people_count, release_date, end_date, movie_id) values ('5000000', '4500000', '8000', '40', '2023-11-01', '2023-12-31', 17);
insert into funding_tb(target_price, present_price, price_per_onetime, people_count, release_date, end_date, movie_id) values ('4000000', '2800000', '8000', '40', '2023-11-01', '2023-12-31', 18);
insert into funding_tb(target_price, present_price, price_per_onetime, people_count, release_date, end_date, movie_id) values ('3000000', '2000000', '8000', '40', '2023-11-01', '2023-12-31', 19);
insert into funding_tb(target_price, present_price, price_per_onetime, people_count, release_date, end_date, movie_id) values ('2000000', '1000000', '8000', '40', '2023-11-01', '2023-12-31', 20);
insert into funding_tb(target_price, present_price, price_per_onetime, people_count, release_date, end_date, movie_id) values ('1000000', '300000', '8000', '40', '2023-11-01', '2023-12-31', 21);
insert into funding_tb(target_price, present_price, price_per_onetime, people_count, release_date, end_date, movie_id) values ('2000000', '400000', '8000', '40', '2023-11-01', '2023-12-31', 22);
insert into funding_tb(target_price, present_price, price_per_onetime, people_count, release_date, end_date, movie_id) values ('3000000', '2700000', '8000', '40', '2023-11-01', '2023-12-31', 23);
insert into funding_tb(target_price, present_price, price_per_onetime, people_count, release_date, end_date, movie_id) values ('4000000', '3600000', '8000', '40', '2023-11-01', '2023-12-31', 24);
insert into funding_tb(target_price, present_price, price_per_onetime, people_count, release_date, end_date, movie_id) values ('5000000', '3500000', '8000', '40', '2023-11-01', '2023-12-31', 25);
insert into funding_tb(target_price, present_price, price_per_onetime, people_count, release_date, end_date, movie_id) values ('3000000', '300000', '8000', '40', '2023-11-01', '2023-12-31', 26);
insert into funding_tb(target_price, present_price, price_per_onetime, people_count, release_date, end_date, movie_id) values ('2000000', '400000', '8000', '40', '2023-11-01', '2023-12-31', 27);
insert into funding_tb(target_price, present_price, price_per_onetime, people_count, release_date, end_date, movie_id) values ('5000000', '4000000', '8000', '40', '2023-11-01', '2023-12-31', 28);
insert into funding_tb(target_price, present_price, price_per_onetime, people_count, release_date, end_date, movie_id) values ('4000000', '3000000', '8000', '40', '2023-11-01', '2023-12-31', 29);
insert into running_schedule_tb (id, running_time, running_date, start_time, end_time, movie_id, theater_id) values (1, 89, '2023-12-24', '13:22', '14:51', 1, 1);
insert into running_schedule_tb (id, running_time, running_date, start_time, end_time, movie_id, theater_id) values (2, 89, '2023-12-24', '17:30', '18:59', 1, 1);
insert into running_schedule_tb (id, running_time, running_date, start_time, end_time, movie_id, theater_id) values (3, 89, '2023-12-25', '19:56', '21:25', 1, 1);
insert into running_schedule_tb (id, running_time, running_date, start_time, end_time, movie_id, theater_id) values (4, 89, '2023-12-25', '18:07', '19:36', 1, 1);
insert into running_schedule_tb (id, running_time, running_date, start_time, end_time, movie_id, theater_id) values (5, 89, '2023-12-26', '09:02', '10:31', 1, 1);
insert into running_schedule_tb (id, running_time, running_date, start_time, end_time, movie_id, theater_id) values (6, 89, '2023-12-26', '13:38', '15:07', 1, 1);
insert into running_schedule_tb (id, running_time, running_date, start_time, end_time, movie_id, theater_id) values (7, 89, '2023-12-27', '20:33', '22:02', 1, 1);
insert into running_schedule_tb (id, running_time, running_date, start_time, end_time, movie_id, theater_id) values (8, 89, '2023-12-28', '15:27', '16:56', 1, 1);
insert into running_schedule_tb (id, running_time, running_date, start_time, end_time, movie_id, theater_id) values (9, 89, '2023-12-29', '09:19', '10:48', 1, 1);
insert into running_schedule_tb (id, running_time, running_date, start_time, end_time, movie_id, theater_id) values (10, 89, '2023-12-30', '13:14', '14:43', 1, 1);