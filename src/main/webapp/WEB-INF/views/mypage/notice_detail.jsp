<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../layout/header.jsp" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 디테일</title>
</head>
<body>
	
    <div class="p_noticedetail_main">
        <div class="p_noticedetail_title">
            <h2>[서비스 안내] ${notice.noticeTitle} 안내</h2>
        </div>
    
        <div class="p_noticedetail_img">
            <img src="/images/logo/IndieFliker.png" alt="">
            <p>Indiepicter</p>
            <p>${notice.createdAt}</p>
        </div>
        
        <div class="p_noticedetail_coment">
            <p>안녕하세요. Indiepicter입니다.</p>
            <p>Indiepicter는 누구나 도전할 수 있는 세상을 만들기 위해 항상 고민하고, 노력하고 있습니다.</p>
            <p>모든 영화들의 도전의 장이 더욱 커질 수 있도록 서비스가 아래와 같이 변경되었음을 안내드립니다.</p>
        </div>
    </div>

    <div class="p_noticedetail_contnet">
        <h3>공지 사항 내용</h3>
        <p>${notice.content}</p>
    </div>
    
</body>
</html>