<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 페이지 - 감상평 관리 ( review ) 완료!</title>
    
    <!-- style.css와 연결 -->
    <link href="/css/png_style.css" rel="stylesheet">
    
    <!-- fontawesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
                           integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
                           crossorigin="anonymous" referrerpolicy="no-referrer" />

    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.7.1/dist/jquery.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
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
        <!--컨테이너1 끝-->

        <!-- 컨테이너2 시작 -->
        <div class="p_review_container2">
            <div class="p_title">
                <h3>감상평 관리</h3>
                <h4>신고 들어온 내역</h4>
            </div>
            <div class="p_section1">
                <div class="p_list">
                    <c:choose>
                        <c:when test="${sessionScope.user_id}">
                            <div class="p_frofile">
                                <img src="https://cdn.pixabay.com/photo/2022/10/19/01/02/woman-7531315_1280.png" alt="">
                                <p>사용자 아이디2222222222222222222222222222222222222222222</p>
                            </div>
                        </c:when>
                        <c:when test="${sessionScope.review_id}">
                            <div class="p_coment">
                                <p>감상평 내용2222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222222</p>
                            </div>
                        </c:when>
                        <c:otherwise>
                            <div class="p_score">
                                <span>평점</span>
                                <p>4</p>
                            </div>
                            <div class="p_coment">
                                <p>감상평 내용</p>
                            </div>
                        </c:otherwise>
                    </c:choose>
                    <div class="p_delet">
                        <a href=""><button class="delete-comment">삭제</button></a>
                    </div>
                </div>
                <div class="p_list">
                    <div class="p_frofile">
                        <img src="https://cdn.pixabay.com/photo/2022/10/19/01/02/woman-7531315_1280.png" alt="">
                        <p>사용자 아이디</p>
                    </div>
                    <div class="p_score">
                        <span>평점</span>
                        <p>4</p>
                    </div>
                    <div class="p_coment">
                        <p>감상평 내용</p>
                    </div>
                    <div class="p_delet">
                        <a href=""><button class="delete-comment">삭제</button></a>
                    </div>
                </div>
                <div class="p_list">
                    <div class="p_frofile">
                        <img src="https://cdn.pixabay.com/photo/2022/10/19/01/02/woman-7531315_1280.png" alt="">
                        <p>사용자 아이디</p>
                    </div>
                    <div class="p_score">
                        <span>평점</span>
                        <p>4</p>
                    </div>
                    <div class="p_coment">
                        <p>감상평 내용</p>
                    </div>
                    <div class="p_delet">
                        <a href=""><button class="delete-comment">삭제</button></a>
                    </div>
                </div>
                <div class="p_list">
                    <div class="p_frofile">
                        <img src="https://cdn.pixabay.com/photo/2022/10/19/01/02/woman-7531315_1280.png" alt="">
                        <p>사용자 아이디</p>
                    </div>
                    <div class="p_score">
                        <span>평점</span>
                        <p>4</p>
                    </div>
                    <div class="p_coment">
                        <p>감상평 내용</p>
                    </div>
                    <div class="p_delet">
                        <a href=""><button class="delete-comment">삭제</button></a>
                    </div>
                </div>
                <div class="p_list">
                    <div class="p_frofile">
                        <img src="https://cdn.pixabay.com/photo/2022/10/19/01/02/woman-7531315_1280.png" alt="">
                        <p>사용자 아이디</p>
                    </div>
                    <div class="p_score">
                        <span>평점</span>
                        <p>4</p>
                    </div>
                    <div class="p_coment">
                        <p>감상평 내용</p>
                    </div>
                    <div class="p_delet">
                        <a href=""><button class="delete-comment">삭제</button></a>
                    </div>
                </div>
                <div class="p_list">
                    <div class="p_frofile">
                        <img src="https://cdn.pixabay.com/photo/2022/10/19/01/02/woman-7531315_1280.png" alt="">
                        <p>사용자 아이디</p>
                    </div>
                    <div class="p_score">
                        <span>평점</span>
                        <p>4</p>
                    </div>
                    <div class="p_coment">
                        <p>감상평 내용</p>
                    </div>
                    <div class="p_delet">
                        <a href=""><button class="delete-comment">삭제</button></a>
                    </div>
                </div>
                <div class="p_list">
                    <div class="p_frofile">
                        <img src="https://cdn.pixabay.com/photo/2022/10/19/01/02/woman-7531315_1280.png" alt="">
                        <p>사용자 아이디</p>
                    </div>
                    <div class="p_score">
                        <span>평점</span>
                        <p>4</p>
                    </div>
                    <div class="p_coment">
                        <p>감상평 내용</p>
                    </div>
                    <div class="p_delet">
                        <a href=""><button class="delete-comment">삭제</button></a>
                    </div>
                </div>
                <div class="p_list">
                    <div class="p_frofile">
                        <img src="https://cdn.pixabay.com/photo/2022/10/19/01/02/woman-7531315_1280.png" alt="">
                        <p>사용자 아이디</p>
                    </div>
                    <div class="p_score">
                        <span>평점</span>
                        <p>4</p>
                    </div>
                    <div class="p_coment">
                        <p>감상평 내용</p>
                    </div>
                    <div class="p_delet">
                        <a href=""><button class="delete-comment"> 삭제</button></a>
                    </div>
                </div>
            </div>
        </div>
        <!-- 컨테이너2 끝-->

        <div class="p_review_bottom">
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
    <script>
        $(document).ready(function() {
            // 삭제 버튼에 클릭 이벤트 핸들러를 추가합니다.
            $(".delete-comment").click(function(e) {
                e.preventDefault(); // 링크의 기본 동작 방지

                // 데이터 속성에서 댓글 ID를 가져옵니다.
                var commentId = $(this).closest(".p_list").data("comment-id");

                // 댓글 삭제를 위해 서버로 AJAX 요청을 보냅니다.
                $.ajax({
                    type: "POST",
                    url: "/api/delete/comment", // 실제 서버 URL로 업데이트해주세요.
                    data: { commentId: commentId },
                    success: function(response) {
                        // 필요하다면 UI를 업데이트합니다 (삭제된 댓글 제거 등).
                        console.log(response); // 서버 응답을 로그로 출력합니다.
                    },
                    error: function(error) {
                        console.error("댓글 삭제 중 오류 발생:", error);
                    }
                });
            });
        });
    </script>
</body>

</html>