<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<body class="l_body">

    <div class="container k_login_container">
        <div id="k_search_user">
            <div class="text-left k_login">비밀번호 변경</div>
            <form action="/user/password-update" method="post">
                <div id="emailScreen">
                    <div class="k_form_group">
                        <label class="k_input_label">이메일</label><br>
                        <input type="text" class="form-control" name="userEmail" id="userEmail" value=""><br>
                        <label class="k_input_label">변경할 비밀번호</label><br>
                        <input type="text" class="form-control" name="password1" id="password1" value=""><br>
                        <label class="k_input_label">변경할 비밀번호 확인</label><br>
                        <input type="text" class="form-control" name="password2" id="password2" value="">
                    </div>
                    <div class="k_input_button">
                        <button type="submit">변경하기</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
<%@ include file="../layout/footer.jsp" %>