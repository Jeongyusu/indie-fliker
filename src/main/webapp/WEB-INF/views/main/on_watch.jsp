<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>

<div class="l_main_body">
    <div class="l_avi_main">
        <div class="l_avi_container">
            <div class="row">
                <div id="l_movie_on_watch">
                    <div class="video-container d-flex justify-content-center">
                        <video src="https://codingyaar.com/wp-content/uploads/video-in-bootstrap-card.mp4" controls controlsList="nodownload" class="mx-auto"></video>
                    </div>
                    <div class="l_chat_review_main">
                        <nav id="l_online_navbar">
                            <ul>
                                <li class="l_active" onClick="handleClickTab(1)">주요정보</li>
                                <li onClick="handleClickTab(2)">영화 평론</li>
                                <li onClick="handleClickTab(3)">포토</li>
                            </ul>
                        </nav>

                        <div class="container">

                            <div class="content" num="1">
                                <div class="l_information">
                                    <div class="l_info_p">어머니에 대한 그리움과 새로운 보금자리에 적응하느라 힘들어하던 ‘마히토’ 앞에
                                        정체를 알 수 없는 왜가리 한 마리가 나타나고, 저택에서 일하는 일곱 할멈으로부터 왜가리가 살고 있는 탑에 대한 신비로운 이야기를 듣게 된다.
                                        그러던 어느 날, ‘마히토’는 사라져버린 새엄마 ‘나츠코’를 찾기 위해 탑으로 들어가고,
                                        왜가리가 안내하는 대로 이세계(異世界)의 문을 통과하는데…!</div>
                                    <div class="l_info_title h5"><a class="l_green">그대들은 어떻게 살 것인가</a>에 대한 <a class="l_font_pupple">9,734</a>개의 이야기가 있어요!</div>
                                </div>

                                <div class="l_participant d-flex align-items-center">
                                    <div class="d-flex flex-column l_user_profile">
                                        <img src="https://dummyimage.com/100/000/fff.jpg" alt="IndiFlinker" class="m-2">
                                        <span>인디픽커</span>
                                    </div>
                                    <form class="l_chat_message col-md-10">
                                        <input type="text" class="l_chat_message_input" name="reply_comment" value="" placeholder="재미있게 보셨나요? 영화의 어떤 점이 좋았는지 이야기해주세요.">
                                        <button type="submit" class="l_review_button">관람평쓰기</button>
                                    </form>
                                </div>
                                <div id="l_review_container" class="l_chat_container"></div>
                            </div>

                            <!-- 영화 평론 -->
                            <div class="content" num="2" style="display:none;">
                                <div class="l_commentary_info">
                                    <div class="l_info_title h5"><a class="l_green">그대들은 어떻게 살 것인가</a>에 대한 <a class="l_font_pupple">다양한 평론</a>을 느껴보세요!</div>
                                </div>
                                <div class="row align-items-center">
                                    <div class="l_score_p" style="max-width: 4rem;">
                                        평점
                                    </div>
                                    <select id="l_score_point" class="form-select form-select-sm">
                                        <option value="1">1</option>
                                        <option value="2">2</option>
                                        <option value="3">3</option>
                                        <option value="4">4</option>
                                        <option selected value="5">5</option>
                                    </select>
                                </div>
                                <div class="l_participant d-flex align-items-center">
                                    <div class="d-flex flex-column l_user_profile">
                                        <img src="https://dummyimage.com/100/000/fff.jpg" alt="IndiFlinker" class="m-2">
                                        <span>인디픽커</span>
                                    </div>
                                    <div class="l_commentary col-md-10">
                            <textarea class="l_commentary_input" placeholder="영화의 다양한 생각과 느낌을 전달해주세요."
                                      onkeydown="resize(this)" onkeyup="resize(this)"></textarea>
                                        <button type="submit" class="l_review_button">평론쓰기</button>
                                    </div>
                                </div>
                                <div id="l_commentary_container" class="l_chat_container"></div>
                            </div>

                            <!-- 영화 예고편 -->
                            <div class="content" num="3" style="display: none;">
                                <div class="l_green l_info_title h5">영화 포토</div>
                                <div class="l_carousel_background">
                                    <div id="carousel" class="carousel slide l_carousel">
                                        <div class="carousel-inner">
                                            <div class="carousel-item active">
                                                <img src="https://img.freepik.com/free-photo/cheesy-tokbokki-korean-traditional-food-on-black-board-background-lunch-dish_1150-42992.jpg" class="d-block w-100" alt="...">
                                            </div>
                                            <div class="carousel-item">
                                                <img src="https://cdn.mindgil.com/news/photo/202004/69068_2873_1455.jpg" class="d-block w-100" alt="...">
                                            </div>
                                            <div class="carousel-item">
                                                <img src="https://img.daily.co.kr/@files/www.daily.co.kr/content/food/2020/20200730/40d0fb3794229958bdd1e36520a4440f.jpg" class="d-block w-100" alt="...">
                                            </div>
                                        </div>
                                        <button class="carousel-control-prev" type="button" data-bs-target="#carousel" data-bs-slide="prev" style="background-color: transparent;border: none;">
                                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                        </button>
                                        <button class="carousel-control-next" type="button" data-bs-target="#carousel" data-bs-slide="next" style="background-color: transparent;border: none;">
                                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="l_movie_on_poster">
                    <div class="l_chat_section l_hide_on_small border-0"  style="max-width: 250px;">
                        <div class="card bg-light border-0" id="l_poster">
                            <img src="https://upload.wikimedia.org/wikipedia/ko/8/87/%EA%B7%B8%EB%8C%80%EB%93%A4%EC%9D%80_%EC%96%B4%EB%96%BB%EA%B2%8C_%EC%82%B4_%EA%B2%83%EC%9D%B8%EA%B0%80_%ED%8F%AC%EC%8A%A4%ED%84%B0.jpg" alt="채팅방 이미지" class="img-fluid m-2" style="max-width: 200px;">
                            <div id="l_movie_mini_info">
                                <div id="l_movie_title">
                                    그대들은 어떻게 살 것인가
                                </div>
                                <div id="l_movie_info">
                                    감독 : 미야자키 하야오<br/>
                                    장르 : 애니메이션<br/>
                                    등급 : 전체관람가<br/>
                                    개봉일 : 2023-11-11
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- 채팅방 오픈 알림창 -->
                    <!-- 오픈하는 날 2시간만 열림 -->
                    <div class="toast show l_toast_show">
                        <div class="toast-header l_toast_header">
                            <form action="" method="get">
                                <button type="submit">실시간 채팅 입장하기</button>
                            </form>
                        </div>
                        <div class="toast-body">
                            <div class="h6 l_toast_h6">
                                <a class="l_font_pupple">'그대들은 어떻게 살 것인가'</a><br/>
                                감독님과 만나는 즐거운 시간
                            </div>
                            <div class="p l_toast_p">
                                자유로운 대화를 나눠보세요<br/>
                                선착순 입장이므로 양해 부탁드립니다 :)
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <a id="l_back_to_top">
                <icon><svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" viewBox="0 0 24 24" style="fill: rgba(0, 0, 0, 1);"><path d="M11 8.414V18h2V8.414l4.293 4.293 1.414-1.414L12 4.586l-6.707 6.707 1.414 1.414z"></path></svg></icon>
            </a>
        </div>
    </div>
</div>

<!-- 스크립트 위로 올리면 에러나요! -->
<script src="../../../../js/lsr/on_watch.js"></script>
<%@ include file="/WEB-INF/views/layout/footer.jsp"%>