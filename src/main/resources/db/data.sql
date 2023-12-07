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

insert into movie_tb(movie_name, synopsis,thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('스트리머','한 BJ가 남긴 기괴한 영상의 진위를 밝히겠다며 한 폐건물로 모인 5명의 스트리머들. 각자 라이브 방송을 진행하며 건물을 살펴보던 그들의 섬뜩하고 소름 끼치는 현장은 그야말로 리얼하게 생중계 되는데…
', '/images/moviethumbnail/gk/streamer.jpeg' '부산형제복지원 사건 모티브', '극영화', '12세 이상 관람가', '장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[스트리머](2023)', '', '', '2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(movie_name, synopsis,thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('홈리스권제니','사람의 몸이 죽고 영혼은 천국으로 가기 전, 영혼들이 잠시 머무는 "영혼의 휴게소"
그곳에 모인 10살, 25살, 75살의 세 명의 여자.
내 이름은 권제니, 네 이름도 권제니, 우리 모두 권제니?!

모두 한 집에 살았고, 한 남자를 사랑했으며, 한 가지 꿈을 꾸었던
"제니"의 세 자아들이 모여 함께 인생을 되돌아보기 시작한다.
"그 땐 참 민망했지, 그 땐 참 즐거웠지"
집을 잃은 것만 같던 각각의 시기를 열심히 살아낸 이들이 모여 나누는 인생후기일담이 펼쳐진다.', '/images/moviethumbnail/gk/homeless.jpeg', '<홈리스 권제니>는 이처럼 시공간을 초월하여 내가 나를 만나는 이야기를 그린다. 죽음 이후 ''영혼의 휴게소''에 머물게 된 각각 10세, 25세, 75세의 권제니. 그들은 살아온 인생에 대한 소감을 주고받고 추억을 회상하며 서로의 상처를 치유해준다. 또한 인생에 있어 ‘집을 잃은 것 같은’ 좌절을 느꼈던 시기에 대해 서로가 느꼈던 바를 공유한다.', '극영화', '12세 이상 관람가', '장형모', '황서령, 김수희, 김영선, 김지한, 홍성원, 이호철'
       , '', '', '', '2023-11-21', '2024-12-10', '2024-01-01', '2024-02-02');

insert into movie_tb(movie_name, synopsis,thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('내가누워있을때','각기 다른 사연을 가지고 있는 선아, 지수, 보미. 지수의 부모님 산소를 향해 급작스럽게 떠나게 된 여행 길에서 차 사고를 당한다. 그렇게 세 사람은 낯선 곳에서 하룻밤을 묵게 되고, 서로의 비밀을 알게 된다.
', '/images/moviethumbnail/gk/naega.jpeg' '아픔이 있는 소외된 모든 사람들이 오늘밤만은 편안하게 잘 잘 수 있길.
', '극영화', '15세 이상 관람가', '장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[스트리머](2023)', '', '', '2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(movie_name, synopsis,thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('불청객들','각기 다른 사연을 가지고 있는 선아, 지수, 보미. 지수의 부모님 산소를 향해 급작스럽게 떠나게 된 여행 길에서 차 사고를 당한다. 그렇게 세 사람은 낯선 곳에서 하룻밤을 묵게 되고, 서로의 비밀을 알게 된다.
', '/images/moviethumbnail/gk/bulchung.jpeg' '아픔이 있는 소외된 모든 사람들이 오늘밤만은 편안하게 잘 잘 수 있길.
', '극영화', '15세 이상 관람가', '장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[스트리머](2023)', '', '', '2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(movie_name, synopsis,thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('만해 한용운','각기 다른 사연을 가지고 있는 선아, 지수, 보미. 지수의 부모님 산소를 향해 급작스럽게 떠나게 된 여행 길에서 차 사고를 당한다. 그렇게 세 사람은 낯선 곳에서 하룻밤을 묵게 되고, 서로의 비밀을 알게 된다.
', '/images/moviethumbnail/gk/manhae.jpeg' '아픔이 있는 소외된 모든 사람들이 오늘밤만은 편안하게 잘 잘 수 있길.
', '극영화', '15세 이상 관람가', '장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[스트리머](2023)', '', '', '2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(movie_name, synopsis,thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('불멸의여신','각기 다른 사연을 가지고 있는 선아, 지수, 보미. 지수의 부모님 산소를 향해 급작스럽게 떠나게 된 여행 길에서 차 사고를 당한다. 그렇게 세 사람은 낯선 곳에서 하룻밤을 묵게 되고, 서로의 비밀을 알게 된다.
', '/images/moviethumbnail/gk/bulmyeol.jpeg' '아픔이 있는 소외된 모든 사람들이 오늘밤만은 편안하게 잘 잘 수 있길.
', '극영화', '15세 이상 관람가', '장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[스트리머](2023)', '', '', '2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(movie_name, synopsis,thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('충분히애도되지못한슬픔','각기 다른 사연을 가지고 있는 선아, 지수, 보미. 지수의 부모님 산소를 향해 급작스럽게 떠나게 된 여행 길에서 차 사고를 당한다. 그렇게 세 사람은 낯선 곳에서 하룻밤을 묵게 되고, 서로의 비밀을 알게 된다.
', '/images/moviethumbnail/gk/ado.jpeg' '아픔이 있는 소외된 모든 사람들이 오늘밤만은 편안하게 잘 잘 수 있길.
', '극영화', '15세 이상 관람가', '장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[스트리머](2023)', '', '', '2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(movie_name, synopsis,thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('엑스','각기 다른 사연을 가지고 있는 선아, 지수, 보미. 지수의 부모님 산소를 향해 급작스럽게 떠나게 된 여행 길에서 차 사고를 당한다. 그렇게 세 사람은 낯선 곳에서 하룻밤을 묵게 되고, 서로의 비밀을 알게 된다.
', '/images/moviethumbnail/gk/ex.jpeg' '아픔이 있는 소외된 모든 사람들이 오늘밤만은 편안하게 잘 잘 수 있길.
', '극영화', '15세 이상 관람가', '장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[스트리머](2023)', '', '', '2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(movie_name, synopsis,thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('안할 이유 없는 임신','각기 다른 사연을 가지고 있는 선아, 지수, 보미. 지수의 부모님 산소를 향해 급작스럽게 떠나게 된 여행 길에서 차 사고를 당한다. 그렇게 세 사람은 낯선 곳에서 하룻밤을 묵게 되고, 서로의 비밀을 알게 된다.
', '/images/moviethumbnail/gk/anhal.jpeg' '아픔이 있는 소외된 모든 사람들이 오늘밤만은 편안하게 잘 잘 수 있길.
', '애니메이션', '15세 이상 관람가', '장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[스트리머](2023)', '', '', '2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(movie_name, synopsis,thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('건전지 엄마','각기 다른 사연을 가지고 있는 선아, 지수, 보미. 지수의 부모님 산소를 향해 급작스럽게 떠나게 된 여행 길에서 차 사고를 당한다. 그렇게 세 사람은 낯선 곳에서 하룻밤을 묵게 되고, 서로의 비밀을 알게 된다.
', '/images/moviethumbnail/gk/gunjeonji.jpeg' '아픔이 있는 소외된 모든 사람들이 오늘밤만은 편안하게 잘 잘 수 있길.
', '애니메이션', '15세 이상 관람가', '장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[스트리머](2023)', '', '', '2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(movie_name, synopsis,thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('쿠키 커피 도시락','각기 다른 사연을 가지고 있는 선아, 지수, 보미. 지수의 부모님 산소를 향해 급작스럽게 떠나게 된 여행 길에서 차 사고를 당한다. 그렇게 세 사람은 낯선 곳에서 하룻밤을 묵게 되고, 서로의 비밀을 알게 된다.
', '/images/moviethumbnail/gk/cookie.jpeg' '아픔이 있는 소외된 모든 사람들이 오늘밤만은 편안하게 잘 잘 수 있길.
', '애니메이션', '15세 이상 관람가', '장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[스트리머](2023)', '', '', '2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(movie_name, synopsis,thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('저주소년','각기 다른 사연을 가지고 있는 선아, 지수, 보미. 지수의 부모님 산소를 향해 급작스럽게 떠나게 된 여행 길에서 차 사고를 당한다. 그렇게 세 사람은 낯선 곳에서 하룻밤을 묵게 되고, 서로의 비밀을 알게 된다.
', '/images/moviethumbnail/gk/jeoju.jpeg' '아픔이 있는 소외된 모든 사람들이 오늘밤만은 편안하게 잘 잘 수 있길.
', '애니메이션', '15세 이상 관람가', '장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[스트리머](2023)', '', '', '2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(movie_name, synopsis,thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('인형 이야기','각기 다른 사연을 가지고 있는 선아, 지수, 보미. 지수의 부모님 산소를 향해 급작스럽게 떠나게 된 여행 길에서 차 사고를 당한다. 그렇게 세 사람은 낯선 곳에서 하룻밤을 묵게 되고, 서로의 비밀을 알게 된다.
', '/images/moviethumbnail/gk/inhyung.jpeg' '아픔이 있는 소외된 모든 사람들이 오늘밤만은 편안하게 잘 잘 수 있길.
', '애니메이션', '15세 이상 관람가', '장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[스트리머](2023)', '', '', '2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(movie_name, synopsis,thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('마녀들의 카니발','각기 다른 사연을 가지고 있는 선아, 지수, 보미. 지수의 부모님 산소를 향해 급작스럽게 떠나게 된 여행 길에서 차 사고를 당한다. 그렇게 세 사람은 낯선 곳에서 하룻밤을 묵게 되고, 서로의 비밀을 알게 된다.
', '/images/moviethumbnail/gk/manyeo.jpeg' '아픔이 있는 소외된 모든 사람들이 오늘밤만은 편안하게 잘 잘 수 있길.
', '다큐멘터리', '15세 이상 관람가', '장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[스트리머](2023)', '', '', '2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(movie_name, synopsis,thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('인간의 마음','각기 다른 사연을 가지고 있는 선아, 지수, 보미. 지수의 부모님 산소를 향해 급작스럽게 떠나게 된 여행 길에서 차 사고를 당한다. 그렇게 세 사람은 낯선 곳에서 하룻밤을 묵게 되고, 서로의 비밀을 알게 된다.
', '/images/moviethumbnail/gk/ingan.jpeg' '아픔이 있는 소외된 모든 사람들이 오늘밤만은 편안하게 잘 잘 수 있길.
', '다큐멘터리', '15세 이상 관람가', '장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[스트리머](2023)', '', '', '2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(movie_name, synopsis,thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('천변의 악사들','각기 다른 사연을 가지고 있는 선아, 지수, 보미. 지수의 부모님 산소를 향해 급작스럽게 떠나게 된 여행 길에서 차 사고를 당한다. 그렇게 세 사람은 낯선 곳에서 하룻밤을 묵게 되고, 서로의 비밀을 알게 된다.
', '/images/moviethumbnail/gk/chunbyun.jpeg' '아픔이 있는 소외된 모든 사람들이 오늘밤만은 편안하게 잘 잘 수 있길.
', '다큐멘터리', '15세 이상 관람가', '장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[스트리머](2023)', '', '', '2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(movie_name, synopsis,thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('곰마워','각기 다른 사연을 가지고 있는 선아, 지수, 보미. 지수의 부모님 산소를 향해 급작스럽게 떠나게 된 여행 길에서 차 사고를 당한다. 그렇게 세 사람은 낯선 곳에서 하룻밤을 묵게 되고, 서로의 비밀을 알게 된다.
', '/images/moviethumbnail/gk/gomma.jpeg' '아픔이 있는 소외된 모든 사람들이 오늘밤만은 편안하게 잘 잘 수 있길.
', '다큐멘터리', '15세 이상 관람가', '장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[스트리머](2023)', '', '', '2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(movie_name, synopsis,thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('비상구 있는 집','각기 다른 사연을 가지고 있는 선아, 지수, 보미. 지수의 부모님 산소를 향해 급작스럽게 떠나게 된 여행 길에서 차 사고를 당한다. 그렇게 세 사람은 낯선 곳에서 하룻밤을 묵게 되고, 서로의 비밀을 알게 된다.
', '/images/moviethumbnail/gk/dog.jpeg' '아픔이 있는 소외된 모든 사람들이 오늘밤만은 편안하게 잘 잘 수 있길.
', '다큐멘터리', '15세 이상 관람가', '장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[스트리머](2023)', '', '', '2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(movie_name, synopsis,thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('1975','각기 다른 사연을 가지고 있는 선아, 지수, 보미. 지수의 부모님 산소를 향해 급작스럽게 떠나게 된 여행 길에서 차 사고를 당한다. 그렇게 세 사람은 낯선 곳에서 하룻밤을 묵게 되고, 서로의 비밀을 알게 된다.
', '/images/moviethumbnail/gk/1975.jpeg' '아픔이 있는 소외된 모든 사람들이 오늘밤만은 편안하게 잘 잘 수 있길.
', '다큐멘터리', '15세 이상 관람가', '장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[스트리머](2023)', '', '', '2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(movie_name, synopsis,thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('홈그라운드','각기 다른 사연을 가지고 있는 선아, 지수, 보미. 지수의 부모님 산소를 향해 급작스럽게 떠나게 된 여행 길에서 차 사고를 당한다. 그렇게 세 사람은 낯선 곳에서 하룻밤을 묵게 되고, 서로의 비밀을 알게 된다.
', '/images/moviethumbnail/gk/homeground.jpeg' '아픔이 있는 소외된 모든 사람들이 오늘밤만은 편안하게 잘 잘 수 있길.
', '다큐멘터리', '15세 이상 관람가', '장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[스트리머](2023)', '', '', '2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(movie_name, synopsis,thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('분첩','각기 다른 사연을 가지고 있는 선아, 지수, 보미. 지수의 부모님 산소를 향해 급작스럽게 떠나게 된 여행 길에서 차 사고를 당한다. 그렇게 세 사람은 낯선 곳에서 하룻밤을 묵게 되고, 서로의 비밀을 알게 된다.
', '/images/moviethumbnail/gk/bunchup.jpeg' '아픔이 있는 소외된 모든 사람들이 오늘밤만은 편안하게 잘 잘 수 있길.
', '실험영화', '15세 이상 관람가', '장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[스트리머](2023)', '', '', '2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(movie_name, synopsis,thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('우리의 시간','각기 다른 사연을 가지고 있는 선아, 지수, 보미. 지수의 부모님 산소를 향해 급작스럽게 떠나게 된 여행 길에서 차 사고를 당한다. 그렇게 세 사람은 낯선 곳에서 하룻밤을 묵게 되고, 서로의 비밀을 알게 된다.
', '/images/moviethumbnail/gk/uri.jpeg' '아픔이 있는 소외된 모든 사람들이 오늘밤만은 편안하게 잘 잘 수 있길.
', '실험영화', '15세 이상 관람가', '장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[스트리머](2023)', '', '', '2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(movie_name, synopsis,thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('차가운 새들의 세계','각기 다른 사연을 가지고 있는 선아, 지수, 보미. 지수의 부모님 산소를 향해 급작스럽게 떠나게 된 여행 길에서 차 사고를 당한다. 그렇게 세 사람은 낯선 곳에서 하룻밤을 묵게 되고, 서로의 비밀을 알게 된다.
', '/images/moviethumbnail/gk/chaga.jpeg' '아픔이 있는 소외된 모든 사람들이 오늘밤만은 편안하게 잘 잘 수 있길.
', '실험영화', '15세 이상 관람가', '장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[스트리머](2023)', '', '', '2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(movie_name, synopsis,thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('이것은 보이는 것과 다르다','각기 다른 사연을 가지고 있는 선아, 지수, 보미. 지수의 부모님 산소를 향해 급작스럽게 떠나게 된 여행 길에서 차 사고를 당한다. 그렇게 세 사람은 낯선 곳에서 하룻밤을 묵게 되고, 서로의 비밀을 알게 된다.
', '/images/moviethumbnail/gk/egut.jpeg' '아픔이 있는 소외된 모든 사람들이 오늘밤만은 편안하게 잘 잘 수 있길.
', '실험영화', '15세 이상 관람가', '장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[스트리머](2023)', '', '', '2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');

insert into movie_tb(movie_name, synopsis,thumbnail, directing_intension, genre, running_grade, director, actor, director_careers, director_awards_film, online_awards_film, online_release_date, online_end_date, offline_release_date, offline_end_date)
values ('소진된 인간','각기 다른 사연을 가지고 있는 선아, 지수, 보미. 지수의 부모님 산소를 향해 급작스럽게 떠나게 된 여행 길에서 차 사고를 당한다. 그렇게 세 사람은 낯선 곳에서 하룻밤을 묵게 되고, 서로의 비밀을 알게 된다.
', '/images/moviethumbnail/gk/sojin.jpeg' '아픔이 있는 소외된 모든 사람들이 오늘밤만은 편안하게 잘 잘 수 있길.
', '실험영화', '15세 이상 관람가', '장형모', '이푸름, 권민혁, 김모범, 김준형, 심소영', '[스트리머](2023)', '', '', '2023-12-01', '2024-12-15', '2024-02-01', '2024-03-02');









