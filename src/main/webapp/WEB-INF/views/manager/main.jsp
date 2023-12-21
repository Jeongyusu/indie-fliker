<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 페이지 - 메인( main ) - 완료!</title>
    
    <!-- style.css와 연결 -->
    <link rel="stylesheet" href="/CSS/png_style.css">
    
    <!-- fontawesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
                           integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
                           crossorigin="anonymous" referrerpolicy="no-referrer" />

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>

    <div class="p_main">
        <!--탑 시작-->
        <div class="p_top">

            <div class="p_title">
                <div class="p_line"></div>
                <a href=""><h2>IndiFlinker</h2></a>
            </div>

            <div class="p_search">
                <i class="fa-solid fa-magnifying-glass"></i>
                <input type="text" placeholder="검색 하기">
            </div>

            <div class="p_inform">
                <a href=""><i class="fa-regular fa-bell"></i></a>
            </div>

        </div>
        <!--탑 끝-->

        <!--컨테이너1 시작-->
        <div class="p_container1">

            <div class="p_section1">
                <div class="p_dashboard">
                    <i class="fa-solid fa-table-cells-large"></i>
                    <a href="">대시보드</a>
                </div>
            </div>

            <div class="p_section2">
                <h3>영화</h3>
                <ul>
                    <li><i class="fa-solid fa-clapperboard p_icon1"></i><a href="/admin/register">영화 등록 허가</a></li>
                    <li><i class="fa-solid fa-chart-line p_icon2"></i><a href="/admin/check">펀딩 현황 확인</a></li>
                    <li><i class="fa-solid fa-pen p_icon3"></i><a href="/admin/update-delete">펀딩 등록 / 삭제</a></li>
                </ul>
                <div class="p_line"></div>
            </div>

            <div class="p_section3">
                <h3>회원</h3>
                <ul>
                    <li><i class="fa-solid fa-ticket-simple p_icon1"></i><a href="/admin/invitation">VIP 초청권 발급</a></li>
                    <li><i class="fa-solid fa-user p_icon2"></i><a href="/admin/user-management">일반 회원 관리</a></li>
                    <li><i class="fa-solid fa-user-group p_icon3"></i><a href="/admin/vip-management">VIP 회원 관리</a></li>
                    <li><i class="fa-solid fa-user-group p_icon3"></i><a href="/admin/grade-update">회원 등급 수정</a></li>
                </ul>
                <div class="p_line"></div>
            </div>

            <div class="p_section4">
                <h3>온라인 상영 가능 영화</h3>
                <ul>
                    <li><i class="fa-solid fa-calendar-days p_icon1"></i><a href="/admin/playday">온라인 오픈 기간 설정</a></li>
                    <li><i class="fa-solid fa-comment p_icon2"></i><a href="/admin/chatting">채팅방 오픈</a></li>
                    <li><i class="fa-solid fa-note-sticky p_icon3"></i><a href="/admin/review">감상평 관리</a></li>
                </ul>
                <div class="p_line"></div>
            </div>

            <!-- <div class="p_section5">
                <i class="fa-solid fa-gear p_icon1"></i>
                <a href="">환경설정</a>
            </div> -->

        </div>
        <!--컨테이너1 끝-->



        <!--컨테이너2 시작-->
        <div class="p_container2">
            <div class="p_section1">
                <div class="p_menu1">
                    <i class="fa-solid fa-people-group"></i>
                    <h3>사용자 현황</h3>
                    <p>23,543</p>
                    <span>34.3% ↑</span>
                </div>
                <div class="p_menu2">
                    <progress></progress>
                    <span>100%</span>
                </div>
            </div>

            <div class="p_section2">
                <div class="p_menu1">
                    <h3>개봉 완료 영화</h3>
                </div>
                <div class="p_menu2">
                    <a href="">더보기</a>
                </div>
                <div class="p_menu3">
                    <div class="p_movie">
                        <img src="https://cdn.pixabay.com/photo/2015/12/09/17/12/popcorn-1085072_1280.jpg" alt="">
                        <p>영화 제목22222222222222222222222222222222222222222222222222</p>
                        <p class="p_p">100%2222222222222222222222222222222222222222222</p>
                        <a href=""><button>온라인 상영 시작</button></a>
                    </div>
                    <div class="p_movie">
                        <img src="https://cdn.pixabay.com/photo/2013/09/29/12/21/camera-188083_1280.jpg" alt="">
                        <p>영화 제목</p>
                        <p class="p_p">100%</p>
                        <a href=""><button>온라인 상영 시작</button></a>
                    </div>
                    <div class="p_movie">
                        <img src="https://cdn.pixabay.com/photo/2016/01/13/22/54/man-1139066_1280.jpg" alt="">
                        <p>영화 제목</p>
                        <p class="p_p">100%</p>
                        <a href=""><button>온라인 상영 시작</button></a>
                    </div>

                </div>
            </div>

        </div>
        <!--컨테이너2 끝-->

        <!--컨테이너3 시작-->
        <div class="p_container3">
            <div class="p_section1">
                <h3>회원 관리</h3>
            </div>
            <div class="p_section2">
                <a href="">필터</a>
                <i class="fa-solid fa-filter"></i>
            </div>
            
            <div class="p_section3">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>회원 ID</th>
                            <th>회원 닉네임</th>
                            <th>회원 가입 날짜</th>
                            <th>최근 구매 날짜</th>
                            <th>회원 등급</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>01</td>
                            <td>#11111</td>
                            <td>
                                <img src="https://cdn.pixabay.com/photo/2019/07/03/11/41/cucumber-4314342_1280.jpg" alt="">
                                <span class="p_name">김오이</span>
                            </td>
                            <td>1111/11/11 11:11</td>
                            <td>1111/11/11 11:11</td>
                            <td>VIP</td>
                        </tr>
                        <tr>
                            <td>02</td>
                            <td>#2222</td>
                            <td>
                                <img src="https://cdn.pixabay.com/photo/2016/12/13/08/10/vegetable-1903490_1280.jpg" alt="">
                                <span class="p_name">최배추</span>
                            </td>
                            <td>2222/22/22 22:22</td>
                            <td>2222/22/22 22:22</td>
                            <td>일반 회원</td>
                        </tr>
                        <tr>
                            <td>03</td>
                            <td>#3333</td>
                            <td>
                                <img src="https://cdn.pixabay.com/photo/2018/04/29/11/54/strawberries-3359755_1280.jpg" alt="">

                                <span class="p_name">박딸기</span>
                            </td>
                            <td>3333/33/33 33:33</td>
                            <td>3333/33/33 33:33</td>
                            <td>일반 회원</td>
                        </tr>
                        <tr>
                            <td>04</td>
                            <td>#4444</td>
                            <td>
                                <img src="https://cdn.pixabay.com/photo/2016/09/29/08/33/apple-1702316_1280.jpg" alt="">
                                <span class="p_name">이사과</span>
                            </td>
                            <td>4444/44/44 44:44</td>
                            <td>4444/44/44 44:44</td>
                            <td>신고</td>
                        </tr>
                        <tr>
                            <td>05</td>
                            <td>#5555</td>
                            <td>
                                <img src="https://cdn.pixabay.com/photo/2016/09/29/08/33/apple-1702316_1280.jpg" alt="">

                                <span class="p_name">박대추</span>
                            </td>
                            <td>5555/5555/55 55:55</td>
                            <td>5555/5555/55 55:55</td>
                            <td>신고</td>
                        </tr>
                    </tbody>
                </table>
            </div>

            <div class="p_main_bottom">
                <nav aria-label="...">
                    <ul class="pagination">
                    <li class="page-item disabled">
                        <a class="page-link previous" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                    </li>
                    <li class="page-item paging">
                        <a class="page-link" href="#">1</a>
                    </li>
                    <li class="page-item active paging" aria-current="page" style="color:#01DFD7;">
                        <a class="page-link" href="#">2</a>
                    </li>
                    <li class="page-item paging">
                        <a class="page-link" href="#">3</a>
                    </li>
                    <li class="page-item paging">
                        <a class="page-link" href="#">4</a>
                    </li>
                    <li class="page-item paging">
                        <a class="page-link" href="#">5</a>
                    </li>
                    <li class="page-item">
                        <a class="page-link next" href="#">Next</a>
                    </li>
                    </ul>
                </nav>  
            </div>
        </div>
        <!--컨테이너3 끝-->

    </div>
    
</body>
</html>