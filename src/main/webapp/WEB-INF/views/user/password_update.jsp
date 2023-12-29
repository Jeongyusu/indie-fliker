<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<body class="l_body">
    <div class="container k_login_container">
        <div id="k_search_user">
            <div class="text-left k_login">비밀번호 변경</div>
            <form id="form" action="/user/password-update" method="post">
                <div id="emailScreen">
                    <div class="k_form_group">
                        <label class="k_input_label">이메일</label><br>
                        <input type="text" class="form-control" name="userEmail" id="userEmail" value=""><br>
                        <p id="userEmailCkeck"></p>
                        <label class="k_input_label">변경할 비밀번호</label><br>
                        <input type="password" class="form-control" name="password1" id="password1" value=""><br>
                        <p id="password1Ckeck"></p>
                        <label class="k_input_label">변경할 비밀번호 확인</label><br>
                        <input type="password" class="form-control" name="password2" id="password2" value="">
                        <p id="password2Ckeck"></p>
                    </div>
                    <div class="k_input_button">
                        <button type="submit">변경하기</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <script>
        // 이메일 정규표현식으로 유효성 검사
        $('#userEmail').focusout(function() {
            let email = $('#userEmail').val()
            let emailCheck =  /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/
            if (!emailCheck.test(email)){
                $('#userEmailCkeck').html('이메일을 형식에 맞게 정확히 입력하세요.').css('color', 'red');
                return false
            }
            $('#userEmailCkeck').html('')
        });
        $('#form').on('submit', function() {
            let email = $('#userEmail').val()
            let emailCheck =  /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/
            if (!emailCheck.test(email)){
                $('#userEmailCkeck').html('이메일을 형식에 맞게 정확히 입력하세요.').css('color', 'red');
                $('#userEmail').focus()
                return false
            }
            $('#userEmailCkeck').html('')
        });
    </script>
    <script>
        // 비밀번호 정규표현식으로 유효성 검사
        $('#password1').focusout(function() {
            let pwdval = $('#password1').val()
            let pwdcheck =  /^[a-zA-Z0-9~!@#$%^&*()`_+?:;'"{}]{1,16}$/

            if (!pwdcheck.test(pwdval) || pwdval.length<8){
                $('#password1Ckeck').html('비밀번호는 영대소문자,숫자로 구성된 8글자 이상으로 조합하세요.').css('color', 'red');
                return false
            }
            $("#password1Ckeck").html('')
        });
        $('#form').on('submit', function() {
            let pwdval = $('#password1').val()
            let pwdcheck =  /^[a-zA-Z0-9~!@#$%^&*()`_+?:;'"{}]{1,16}$/

            if (!pwdcheck.test(pwdval) || pwdval.length<8){
                $('#password1Ckeck').html('비밀번호는 영대소문자,숫자로 구성된 8글자 이상으로 조합하세요.').css('color', 'red');
                $('#password1').focus()
                return false
            }
            $("#password1Ckeck").html('')
        })
        $('#password2').focusout(function() {
            let pwdval = $('#password2').val()
            let pwdcheck =  /^[a-zA-Z0-9~!@#$%^&*()`_+?:;'"{}]{1,16}$/

            if (!pwdcheck.test(pwdval) || pwdval.length<8){
                $('#password2Ckeck').html('비밀번호는 영대소문자,숫자로 구성된 8글자 이상으로 조합하세요.').css('color', 'red');
                return false
            }
            $("#password2Ckeck").html('')
        });
        $('#form').on('submit', function() {
            let pwdval = $('#password2').val()
            let pwdcheck =  /^[a-zA-Z0-9~!@#$%^&*()`_+?:;'"{}]{1,16}$/

            if (!pwdcheck.test(pwdval) || pwdval.length<8){
                $('#password2Ckeck').html('비밀번호는 영대소문자,숫자로 구성된 8글자 이상으로 조합하세요.').css('color', 'red');
                $('#password2').focus()
                return false
            }
            $("#password2Ckeck").html('')
        })
    </script>


<%@ include file="../layout/footer.jsp" %>

