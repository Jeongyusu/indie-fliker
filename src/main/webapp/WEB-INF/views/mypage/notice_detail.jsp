<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../layout/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<body class="l_body">
    <div class="container l_main_margin_bottom">
        <div class="p_noticedetail_main">
            <div class="p_noticedetail_title">
                <h2>[서비스 안내] ${notice.noticeTitle} 안내</h2>
            </div>

            <div class="p_noticedetail_img">
                <img src="/images/logo/IndieFliker.png" alt="">
                <div>
                    <p>Indiepicter</p>
                    <p>${notice.formatNoticeDate()}</p>
                </div>
            </div>

            <div class="p_noticedetail_coment">
                안녕하세요. Indiepicter입니다.<br>
                Indiepicter는 누구나 도전할 수 있는 세상을 만들기 위해 항상 고민하고, 노력하고 있습니다.<br>
                모든 영화들의 도전의 장이 더욱 커질 수 있도록 서비스가 아래와 같이 변경되었음을 안내드립니다.
            </div>
        </div>
        <div class="p_noticedetail_contnet">
            <h3>공지 사항 내용</h3>
            <p>${notice.content}</p>
        </div>
    </div>


    <%@ include file="../layout/footer.jsp" %>
