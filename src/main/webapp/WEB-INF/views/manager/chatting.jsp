<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 페이지 - 채팅방 ( chatting ) 완료!</title>
    
    <!-- style.css와 연결 -->
    <link rel="stylesheet" href="/css/png_style.css">
    
    <!-- fontawesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
                           integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
                           crossorigin="anonymous" referrerpolicy="no-referrer" />

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
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
                    <li><i class="fa-solid fa-clapperboard p_icon1"></i><a href="/admin/funding-ready-list">펀딩 등록 승인</a></li>
                    <li><i class="fa-solid fa-chart-line p_icon2"></i><a href="/admin/funding/confirm">펀딩 현황 확인</a></li>
                    <li><i class="fa-solid fa-pen p_icon3"></i><a href="/admin/funding-management">펀딩 수정 / 종료</a></li>
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
                <h3>기간 설정</h3>
                <ul>
                    <li><i class="fa-solid fa-calendar-days p_icon1"></i><a href="/admin/funding/movie-open/setting">온라인 상영 기간 설정/채팅 오픈 시간 설정</a></li>
                    <li><i class="fa-solid fa-calendar-days p_icon1"></i><a href="/admin/funding/off-movie-open/setting">오프라인 상영 기간 설정</a></li>
                </ul>
                <div class="p_line"></div>
            </div>

        </div>
        <!--컨테이너2 시작-->
        <div class="p_chatting_container2">

            <div class="p_section1">
                <div class="p_menu1">
                    <img src="https://cdn.pixabay.com/photo/2014/10/16/09/15/lens-490806_640.jpg" alt="">
                    <p class="p_p1">그대들은 어떻게 살 것인가?</p>
                    <p class="p_p2">200% 달성</p>
                    <button type="button" class="btn" data-toggle="modal" data-target="#staticBackdrop">채팅방 오픈</button>
                </div>
                <div class="p_menu1">
                    <img src="https://cdn.pixabay.com/photo/2014/10/16/09/15/lens-490806_640.jpg" alt="">
                    <p class="p_p1">영화 제목</p>
                    <p class="p_p2">달성률</p>
                    <button type="button" class="btn" data-toggle="modal" data-target="#staticBackdrop">채팅방 오픈</button>
                </div>
                <div class="p_menu1">
                    <img src="https://cdn.pixabay.com/photo/2014/10/16/09/15/lens-490806_640.jpg" alt="">
                    <p class="p_p1">영화 제목</p>
                    <p class="p_p2">달성률</p>
                    <button type="button" class="btn" data-toggle="modal" data-target="#staticBackdrop">채팅방 오픈</button>
                </div>
                <div class="p_menu1">
                    <img src="https://cdn.pixabay.com/photo/2014/10/16/09/15/lens-490806_640.jpg" alt="">
                    <p class="p_p1">영화 제목</p>
                    <p class="p_p2">달성률</p>
                    <button type="button" class="btn" data-toggle="modal" data-target="#staticBackdrop">채팅방 오픈</button>
                </div>
            </div>

            <div class="p_section2">
                <div class="p_menu2">
                    <img src="https://cdn.pixabay.com/photo/2014/10/16/09/15/lens-490806_640.jpg" alt="">
                    <p class="p_p1">영화 제목</p>
                    <p class="p_p2">달성률</p>
                    <button type="button" class="btn" data-toggle="modal" data-target="#staticBackdrop">채팅방 오픈</button>
                </div>
                <div class="p_menu2">
                    <img src="https://cdn.pixabay.com/photo/2014/10/16/09/15/lens-490806_640.jpg" alt="">
                    <p class="p_p1">영화 제목</p>
                    <p class="p_p2">달성률</p>
                    <a href=""><button>채팅방 오픈</button></a>
                </div>
                <div class="p_menu2">
                    <img src="https://cdn.pixabay.com/photo/2014/10/16/09/15/lens-490806_640.jpg" alt="">
                    <p class="p_p1">영화 제목</p>
                    <p class="p_p2">달성률</p>
                    <button type="button" class="btn" data-toggle="modal" data-target="#staticBackdrop">채팅방 오픈</button>
                </div>
                <div class="p_menu2">
                    <img src="https://cdn.pixabay.com/photo/2014/10/16/09/15/lens-490806_640.jpg" alt="">
                    <p class="p_p1">영화 제목</p>
                    <p class="p_p2">달성률</p>
                    <button type="button" class="btn" data-toggle="modal" data-target="#staticBackdrop">채팅방 오픈</button>
                </div>
            </div>
            
        </div>
        <!--컨테이너2 끝-->

        <div class="p_chatting_bottom">
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
		
		<!-- 채팅방 오픈 모달창 -->
		<div class="modal fade" id="staticBackdrop" data-backdrop="static" data-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="staticBackdropLabel">채팅방 오픈</h5>
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
		          <span aria-hidden="true">&times;</span>
		        </button>
		      </div>
		      <div class="modal-body">
		        <div class="p">
		          <p class="movie-title"></p>
		          <p class="achievement-rate"></p>
		          정말 오픈하시겠습니까?
		        </div>
		        <figcaption class="figure-caption">선택하시면 2시간동안 오픈됩니다.</figcaption>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
				<button type="button" class="btn btn-primary" data-dismiss="modal" id="startChatBtn">오픈 시작 하기</button>
		      </div>
		    </div>
		  </div>
		</div>
     
	</div>
	<script type="module" src="/js/lsr/chatting.js"></script>
</body>
</html>