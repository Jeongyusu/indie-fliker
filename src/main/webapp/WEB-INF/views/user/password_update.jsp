<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="/css/khy_style.css" rel="stylesheet">
    <title>비밀번호 수정</title>
</head>

<body>

    <div class="p_password_update_main">
        <div class="p_title">
            <h2>비밀번호 변경하기</h2>
        </div>
        <form class="p_menu" action="/user/password-update" method="post">
            <div>
                <label>이메일</label><br>
                <input type="text" name="userEmail" id="userEmail" value="">
            </div>
            <div>
                <label>변경할 비밀번호</label><br>
                <input type="text" name="password1" id="password1" value="">
            </div>
            <div>
                <label>변경할 비밀번호 확인</label><br>
                <input type="text" name="password2" id="password2" value="">
            </div>
            <button type="submit">변경하기</button>
        </form>
    </div>


</body>

</html>