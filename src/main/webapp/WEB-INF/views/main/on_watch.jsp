<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/layout/header.jsp"%>

<div class="l_main_body">
    <div class="l_avi_main">
        <div class="l_avi_container">
            <div class="row">
                <div id="l_movie_on_watch">
                    <div class="video-container d-flex justify-content-center">
                        <video src="${onMovieDetailDTO.moviePath}" controls
                               controlsList="nodownload" class="mx-auto"></video>
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
                                    <div class="l_info_p">
                                        ${onMovieDetailDTO.synopsis}
                                    </div>
                                    <div class="l_info_title h5"><a class="l_green">${onMovieDetailDTO.movieName}</a>에 대한 <a
                                            class="l_font_pupple">9,734</a>개의 이야기가 있어요!
                                    </div>
                                </div>

                                <div class="l_participant d-flex align-items-center">
                                    <div class="d-flex flex-column l_user_profile">
                                        <img src="https://dummyimage.com/100/000/fff.jpg" alt="IndiFlinker" class="m-2">
                                        <span>인디픽커</span>
                                    </div>
                                    <div class="l_chat_message col-md-10">
                                        <input type="text" class="l_chat_message_input" name="reply_comment" value=""
                                               placeholder="재미있게 보셨나요? 영화의 어떤 점이 좋았는지 이야기해주세요.">
                                        <button type="submit" class="l_review_button">관람평쓰기</button>
                                    </div>
                                </div>
                                <div id="l_review_container" class="l_chat_container">
                                    <div class="l_message_container">
                                        <div class="l_review_message_text">
                                            <div class="l_profile_comment">
                                                <div class="l_profile_img" style=""></div>
                                                <div class="l_text_container">
                                                    <div class="l_message_name">sksk</div>
                                                    <div class="l_message_text">hihihihihi</div>
                                                </div>
                                            </div>
                                            <div class="dropdown l_dropdown_div">
                                                <button type="button" class="dropdown-toggle l_review_set_button" data-bs-toggle="dropdown">
                                                    <img src="/images/icons/menu.png">
                                                </button>
                                                <ul class="dropdown-menu">
                                                    <li class="dropdown-item">Link 1</li>
                                                    <li class="dropdown-item">Link 1</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- 영화 평론 -->
                            <div class="content" num="2" style="display:none;">
                                <div class="l_commentary_info">
                                    <div class="l_info_title h5"><a class="l_green">${onMovieDetailDTO.movieName}</a>에 대한 <a
                                            class="l_font_pupple">다양한 평론</a>을 느껴보세요!
                                    </div>
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
                                <div id="l_commentary_container" class="l_chat_container">
                                    <div class="l_comment_container">
                                        <div class="l_score_container">
                                            <div class="l_score_title">평점</div>
                                            <div class="l_score">5</div>
                                        </div>
                                        <div class="l_commentary_list_container">
                                            <div class="l_commentary_message_text">
                                                <div class="l_profile_comment">
                                                    <div class="l_profile_img" style=""></div>
                                                    <div class="l_text_container">
                                                        <div class="l_message_name">sksk</div>
                                                        <div class="l_message_text">hihihihihi</div>
                                                    </div>
                                                </div>
                                                <div class="dropdown l_dropdown_div">
                                                    <button type="button" class="dropdown-toggle l_review_set_button" data-bs-toggle="dropdown">
                                                        <img src="/images/icons/menu.png">
                                                    </button>
                                                    <ul class="dropdown-menu">
                                                        <li class="dropdown-item">Link 1</li>
                                                        <li class="dropdown-item">Link 1</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <!-- 영화 포토 -->
                            <div class="content" num="3" style="display: none;">
                                <div class="l_green l_info_title h5">영화 포토</div>
                                <div class="l_carousel_background">
                                    <div id="carousel" class="carousel slide l_carousel">
                                        <div class="carousel-inner">
                                            <c:forEach var="moviePics" items="${onMovieDetailDTO.moviePics}">
                                                <div class="carousel-item active">
                                                    <img src="${moviePics.moviePic}"
                                                         class="d-block w-100" alt="...">
                                                </div>
                                            </c:forEach>
                                        </div>
                                        <button class="carousel-control-prev" type="button" data-bs-target="#carousel"
                                                data-bs-slide="prev"
                                                style="background-color: transparent;border: none;">
                                            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                        </button>
                                        <button class="carousel-control-next" type="button" data-bs-target="#carousel"
                                                data-bs-slide="next"
                                                style="background-color: transparent;border: none;">
                                            <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="l_movie_on_poster">
                    <div class="l_chat_section l_hide_on_small border-0" style="max-width: 250px;">
                        <div class="card bg-light border-0" id="l_poster">
                            <img src="${onMovieDetailDTO.thumbnail}"
                                 alt="채팅방 이미지" class="img-fluid m-2" style="max-width: 200px;">
                            <div id="l_movie_mini_info">
                                <div id="l_movie_title">
                                    ${onMovieDetailDTO.movieName}
                                </div>
                                <div id="l_movie_info">
                                    감독 : ${onMovieDetailDTO.director}<br/>
                                    장르 : ${onMovieDetailDTO.genre}<br/>
                                    등급 : ${onMovieDetailDTO.runningGrade}<br/>
                                    개봉일 : ${onMovieDetailDTO.onlineReleaseDate}
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
            <input type="hidden" name="onlineEndDate" value="${onMovieDetailDTO.onlineEndDate}">
            <a id="l_back_to_top">
                <icon><svg xmlns="http://www.w3.org/2000/svg" width="50" height="50" viewBox="0 0 24 24" style="fill: rgba(0, 0, 0, 1);"><path d="M11 8.414V18h2V8.414l4.293 4.293 1.414-1.414L12 4.586l-6.707 6.707 1.414 1.414z"></path></svg></icon>
            </a>
        </div>
    </div>
</div>

<!-- 스크립트 위로 올리면 에러나요! -->
<script src="../../../../js/lsr/on_watch.js"></script>
<%@ include file="/WEB-INF/views/layout/footer.jsp"%>