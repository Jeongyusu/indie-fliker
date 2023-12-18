<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>자주 묻는 질문</title>
    <script src="https://kit.fontawesome.com/0f9e652ce1.js" crossorigin="anonymous"></script>
    <link href="/css/khy_style.css" rel="stylesheet">
</head>
<body>
<div class="k_ask_container">
    <h1 class="k_ask_main">자주 묻는 질문</h1>
    <div class="k_search-container">
        <input type="text" class="k_search-input" placeholder="검색어를 입력하세요">
        <a href="#" class="custom-button">
        <img class="k_search-icon" src="
        /images/icons/icons8-search-50.png" alt="My Image">
        </a>
    </div>
</div>
<hr class="k_ask_hr">
<div class="k_ask_s_container">
    <div class="k_btn_group">
        <button type="button" class="k_btn k_a_btn-primary k_a_btn_mem_button"><a href="/question/user">회원정보</a></button>
        <button type="button" class="k_btn k_a_btn-primary k_b_b_none" ><a href="/question/pay">결제</a></button>
        <button type="button" class="k_btn k_a_btn-primary k_b_b_none" ><a href="/question/cancel">취소/환불</a></button>
        <button type="button" class="k_btn k_a_btn-primary k_b_b_none"><a href="/question/reservation">영화예매</a></button>
        <button type="button" class="k_btn k_a_btn-primary k_a_btn_mem_vip"><a href="/question/VIP">VIP</a></button>
    </div>

    <c:forEach var="questionResponseDTO" items="${questionPayPagingLists}">
    <div class="k_member_info">${questionResponseDTO.category}</div>
    <div class="k_member_how_info">
            ${questionResponseDTO.questionTitle}
        <div class="k_clickMe">
            <button type="button" class="k_clickMeSymbol" onclick="handleClick(1)">∨</button>
        </div>
    </div>
    <div class="k_hiddenDiv" id="hiddenDiv1">
            ${questionResponseDTO.content}
    </div>
    <hr>
    </c:forEach>

    <div>
        <c:choose>
            <%-- 현재 페이지가 1페이지이면 이전 글자만 보여줌 --%>
            <c:when test="${paging.page <= 1}">
                <a>[이전]</a>
            </c:when>

            <c:otherwise>
                <%-- 이전을 누르면 컨트롤러에 현재 페이지보다 1 작은 페이지로 요청 --%>
                <a href="/question/pay?page=${paging.page-1}">[이전]</a>
            </c:otherwise>
        </c:choose>

        <%-- 자바로 생각하면 >> for(int i = startPage; i <= endPage; i++) --%>
        <c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i" step="1">
            <c:choose>
                <%-- 현재 페이지는 클릭할 필요가 없기 때문에 <span>태그 처리 --%>
                <c:when test="${i eq paging.page}">
                    <span>${i}</span>
                </c:when>

                <c:otherwise>
                    <%-- 다른 페이지 이동이 필요할때 컨트롤러에 요청 --%>
                    <a href="/question/pay?page=${i}">${i}</a>
                </c:otherwise>
            </c:choose>
        </c:forEach>

        <%-- 현재 페이지가 가장 끝 페이지이면 다음이라는 text만 나오게 함 --%>
        <c:choose>
            <c:when test="${paging.page >= paging.maxPage}">
                <a>[다음]</a>
            </c:when>
            <%-- 다음을 누르면 현재 페이지보다 1 큰 페이지로 요청 --%>
            <c:otherwise>
                <a href="/question/pay?page=${paging.page+1}">[다음]</a>
            </c:otherwise>
        </c:choose>
    </div>

</div>

<script>
    function handleClick(id) {
        var hiddenDivElement = document.getElementById("hiddenDiv" + id);

        // 나타날 요소를 토글하여 보이거나 숨기기
        if (hiddenDivElement.style.display === 'none') {
            hiddenDivElement.style.display = 'block';
        } else {
            hiddenDivElement.style.display = 'none';
        }
    }
</script>

</body>
</html>