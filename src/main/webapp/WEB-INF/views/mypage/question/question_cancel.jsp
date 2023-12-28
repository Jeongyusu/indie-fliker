<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../../layout/header.jsp" %>

<body class="l_body">
    <div class="container l_main_margin_bottom">
        <div class="k_ask_container">
            <h1 class="k_ask_main">자주 묻는 질문</h1>
            <form action="/question/search">
                <div class="k_search-container">
                    <input type="text" class="k_search-input" name=keyword placeholder="검색어를 입력하세요">
                    <button class="j_search_magnifier" type="submit">
                        <img class="k_search-icon" src="/images/icons/icons8-search-50.png" alt="My Image">
                    </button>
                </div>
            </form>
        </div>
        <hr class="k_ask_hr">
        <div class="k_ask_s_container">
            <div class="k_btn_group">
                <a href="/question/user">회원정보</a>
                <a href="/question/pay">결제</a>
                <a href="/question/cancel">취소/환불</a>
                <a href="/question/reservation">영화예매</a>
                <a href="/question/VIP">VIP</a>
            </div>

            <c:forEach var="questionResponseDTO" items="${questionCancelPagingLists}">
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

            <div class="p_paging p_question_cancle_paging">
                <c:choose>
                    <%-- 현재 페이지가 1페이지이면 이전 글자만 보여줌 --%>
                    <c:when test="${paging.page <= 1}">
                        <a class="p_priveous">이전</a>
                    </c:when>

                    <c:otherwise>
                        <%-- 이전을 누르면 컨트롤러에 현재 페이지보다 1 작은 페이지로 요청 --%>
                        <a class="p_priveous" href="/question/cancel?page=${paging.page-1}">이전</a>
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
                            <a class="page_number" href="/question/cancel?page=${i}" style="color: #7f7f7f">${i}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>

                <%-- 현재 페이지가 가장 끝 페이지이면 다음이라는 text만 나오게 함 --%>
                <c:choose>
                    <c:when test="${paging.page >= paging.maxPage}">
                        <a class="p_next">다음</a>
                    </c:when>
                    <%-- 다음을 누르면 현재 페이지보다 1 큰 페이지로 요청 --%>
                    <c:otherwise>
                        <a class="p_next" href="/question/cancel?page=${paging.page+1}">다음</a>
                    </c:otherwise>
                </c:choose>
            </div>

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

<%@ include file="../../layout/footer.jsp" %>
