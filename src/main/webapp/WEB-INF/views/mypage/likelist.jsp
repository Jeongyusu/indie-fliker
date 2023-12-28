<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="../layout/header.jsp" %>

<body class="l_body">
<div class="h1" style="margin: 5rem;">찜한 목록</div>
<!-- 영화 목록 (많지 않을 것으로 예상 -> 다 받아올 예정) -->
<div class="container">
    <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 row-cols-lg-4 row-cols-xl-5">
        <c:forEach var="scrab" items="${scrabDTOs}">
            <div class="col my-4">
                <div class="card">
                    <img src=${scrab.thumbnail} class="card-img" alt="...">
                    <div class="card-img-overlay">
                        <button type="button" onclick="removeScrab(${scrab.fundingId})">
                            <i class="l_like_icon">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24">
                                    <path d="M20.205 4.791a5.938 5.938 0 0 0-4.209-1.754A5.906 5.906 0 0 0 12 4.595a5.904 5.904 0 0 0-3.996-1.558 5.942 5.942 0 0 0-4.213 1.758c-2.353 2.363-2.352 6.059.002 8.412L12 21.414l8.207-8.207c2.354-2.353 2.355-6.049-.002-8.416z"></path>
                                </svg>
                            </i>
                        </button>
                    </div>
                </div>
                <div class="h4 card-title l_mint mt-3">${scrab.calculateAndSetAchievementRate()}% 달성</div>
                <div class="h5 card-text mt-2">${scrab.movieName}</div>
                <div class="p card-text mt-2">${scrab.synopsis}</div>
            </div>
        </c:forEach>
    </div>
    <!-- 만약 10개씩만 불러오고 페이지로 처리한다면, page navigation 사용 (funding.jsp 확인) -->
</div>
<!-- footer -->

<script>
    function removeScrab(fundingId) {
        console.log('펀딩아이디 - fundingId:', fundingId);
        if (confirm("찜 목록에서 삭제하시겠습니까?")) {
            // Ajax 요청 보내기
            var xhr = new XMLHttpRequest();
            xhr.open("POST", "/api/scrabs/delete", true);
            xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");

            var scrab = {
                fundingId: fundingId
            };

            xhr.onreadystatechange = function () {
                if (xhr.readyState === 4) {
                    if (xhr.status === 200) {
                        console.log("Successfully removed from scrab list");
                        // 페이지 새로고침
                        refreshPage();
                    } else {
                        console.error("Failed to remove from scrab list");
                    }
                }
            };

            xhr.send(JSON.stringify(scrab));
        }
    }

    // 페이지 새로고침
    function refreshPage() {
        location.reload();
    }
</script>
<%@ include file="../layout/footer.jsp" %>
