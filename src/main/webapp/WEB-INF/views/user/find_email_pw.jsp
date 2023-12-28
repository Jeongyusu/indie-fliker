<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<body class="l_body">
    <div class="container k_login_container">
        <div id="k_search_user">
            <div class="text-left k_login">이메일/비밀번호 찾기</div>
            <div class="k_radio_group">
                <input type="radio" id="emailRadio" name="screen" checked>
                <label for="emailRadio">이메일 찾기 </label>
                <input type="radio" id="passwordRadio" name="screen">
                <label for="passwordRadio">비밀번호 찾기</label>
            </div>
            <div id="emailScreen">
                <div class="k_form_group">
                    <label class="k_input_label">이름</label><br>
                    <input type="text" class="form-control" name="username" id="username">
                </div>
                <div class="k_form_group">
                    <label class="k_input_label">전화번호</label><br>
                    <input type="text" class="form-control" name="tel" id="tel">
                </div>
                <div class="k_input_button">
                    <button name="findEmail" id="findEmail">이메일 찾기</button>
                </div>
            </div>
            <form action="/user/send-email" method="post" name="sendEmail" id="sendEmail">
                <div id="passwordScreen" style="display: none;">
                    <div class="k_form_group">
                        <label class="k_input_label">이메일</label><br>
                        <input type="text" class="form-control" name="userEmail" id="userEmail"><br>
                    </div>
                    <div class="l_email_info">
                        <p>입력하신 이메일로 임시 비밀번호가 전송됩니다.</p>
                    </div>
                    <div class="k_input_button">
                        <button type="submit" name="sendPassword" id="sendPassword">임시 비밀번호 전송</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
<script src="../../../../js/png/find_email_pw.js"></script>
<%@ include file="../layout/footer.jsp" %>
