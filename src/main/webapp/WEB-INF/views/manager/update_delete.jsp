<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 페이지 - 등록 / 삭제 ( update_delete ) 완료!</title>
    <!-- fontawesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
                           integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
                           crossorigin="anonymous" referrerpolicy="no-referrer" />

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <link href="/css/png_style.css" rel="stylesheet">
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
        <div class="p_update_delete_container2">

            <div class="p_section1">
                <div class="p_menu1">
                    <img src="https://cdn.pixabay.com/photo/2019/04/24/21/55/cinema-4153289_1280.jpg" alt="">
                    <p>영화 제목</p>
                    <a href=""><button class="p_button1">영화 수정</button></a>
                    <a href=""><button class="p_button2">영화 삭제</button></a>                  
                </div>
                <div class="p_menu1">
                    <img src="https://cdn.pixabay.com/photo/2019/04/24/21/55/cinema-4153289_1280.jpg" alt="">
                    <p>영화 제목</p>
                    <a href=""><button class="p_button1">영화 수정</button></a>
                    <a href=""><button class="p_button2">영화 삭제</button></a>   
                </div>
                <div class="p_menu1">
                    <img src="https://cdn.pixabay.com/photo/2019/04/24/21/55/cinema-4153289_1280.jpg" alt="">
                    <p>영화 제목</p>
                    <a href=""><button class="p_button1">영화 수정</button></a>
                    <a href=""><button class="p_button2">영화 삭제</button></a>    
                </div>
                <div class="p_menu1">
                    <img src="https://cdn.pixabay.com/photo/2019/04/24/21/55/cinema-4153289_1280.jpg" alt="">
                    <p>영화 제목</p>
                    <a href=""><button class="p_button1">영화 수정</button></a>
                    <a href=""><button class="p_button2">영화 삭제</button></a>    
                </div>
            </div>

            <div class="p_section2">
                <div class="p_menu2">
                    <img src="https://cdn.pixabay.com/photo/2019/04/24/21/55/cinema-4153289_1280.jpg" alt="">
                    <p>영화 제목</p>
                    <a href=""><button class="p_button1">영화 수정</button></a>
                    <a href=""><button class="p_button2">영화 삭제</button></a>    
                </div>
                <div class="p_menu2">
                    <img src="https://cdn.pixabay.com/photo/2019/04/24/21/55/cinema-4153289_1280.jpg" alt="">
                    <p>영화 제목</p>
                    <a href=""><button class="p_button1">영화 수정</button></a>
                    <a href=""><button class="p_button2">영화 삭제</button></a>   
                </div>
                <div class="p_menu2">
                    <img src="https://cdn.pixabay.com/photo/2019/04/24/21/55/cinema-4153289_1280.jpg" alt="">
                    <p>영화 제목</p>
                    <a href=""><button class="p_button1">영화 수정</button></a>
                    <a href=""><button class="p_button2">영화 삭제</button></a>    
                </div>
                <div class="p_menu2">
                    <img src="https://cdn.pixabay.com/photo/2019/04/24/21/55/cinema-4153289_1280.jpg" alt="">
                    <p>영화 제목</p>
                    <a href=""><button class="p_button1">영화 수정</button></a>
                    <a href=""><button class="p_button2">영화 삭제</button></a>    
                </div>
            </div>
            
        </div>
        <!--컨테이너2 끝-->

        <div class="p_update_delete_bottom">
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
</body>
</html>