<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ include file="../layout/header.jsp" %>
<body class="l_body">

<div class="container k_login_container">
    <div class="text-left k_login">이메일 간편 가입</div>

    <form action="/user/join" method="post" enctype="multipart/form-data">
        <div class="k_form_group">
            <label class="k_input_label">이메일</label><br>
            <div class="k_input_group input">
                <input type="email" class="form-control k_join_radius" id="userEmail" name="userEmail"
                       value="ssar@nate.com"
                       placeholder="이메일 형식에 맞게 입력하세요."
                       onfocus="this.placeholder = ''" onblur="this.placeholder = '이메일을 입력하세요.'">
                <input class="k_validation k_validation_button" type="button" id="emailCheck" value="중복 확인">
            </div>
            <p id="userEmailCkeck"></p>
        </div>

        <div class="k_form_group">
            <label class="k_input_label">닉네임</label><br>

            <input type="text" class="form-control input" id="username" name="username" value=""

                   placeholder="닉네임을 입력하세요."
                   onfocus="this.placeholder = ''" onblur="this.placeholder = '닉네임을 입력하세요.'">
            <p id="usernameCkeck"></p>
        </div>

        <div class="k_form_group">
            <label class="k_input_label">비밀번호</label><br>
            <div class="input-group k_input">

                <input type="password" class="form-control k_pwd_backcolor" id="password1" name="password1" value=""

                       placeholder="비밀번호를 입력하세요."
                       onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호 입력를 입력하세요.'"
                       style="border-radius: 0.25rem">
                <p id="password1Ckeck"></p>
                <div class="eyes" id="togglePassword1">
                    <img src="/images/icons/eye.png" alt="비밀번호 표시">
                </div>
            </div>
            <div class="input-group k_input">

                <input type="password" class="form-control k_pwd_backcolor k_pwd_input_margin" id="password2"
                       name="password2" value=""

                       placeholder="비밀번호 확인"
                       onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호 확인'"
                       style="border-radius: 0.25rem">
                <p id="password2Ckeck"></p>
                <div class="eyes2" id="togglePassword2">
                    <img src="/images/icons/eye.png" alt="비밀번호 표시">
                </div>
            </div>
        </div>

        <div class="k_form_group">
            <label class="k_input_label">전화번호</label><br>

            <input type="text" class="form-control input" id="tel" name="tel" value=""

                   placeholder="전화번호 입력를 입력하세요."
                   onfocus="this.placeholder = ''" onblur="this.placeholder = '전화번호를 입력해주세요. (- 생략)'">
            <p id="telCkeck"></p>
        </div>

        <div class="k_complete text-center">
            <button type="submit" class="btn btn-primary btn-block" id="p_join">약관 동의 후 가입 완료하기</button>
        </div>
    </form>
</div>

<script>
    // 이메일 중복 검사
    $("#emailCheck").click(function () {
        //	var query = {userEmail : $("#userEmail").va;
        $.ajax({
            url: "/emailCkeck",
            type: "post",
            dataType: "json",
            data: {"userEmail": $("#userEmail").val()},
            success: function (data) {
                if (data == 1) {
                    alert("이미 존재하는 이메일입니다.");
                } else {
                    alert("사용 가능한 이메일입니다.");
                }
            }

        })
    });
</script>
<%--<script>--%>
<%--    // 이메일 정규표현식으로 유효성 검사--%>
<%--    $('#userEmail').focusout(function() {--%>
<%--        let email = $('#userEmail').val()--%>
<%--        let emailCheck =  /^[a-zA-Z0-9+-\_.]+@[a-zA-Z0-9-]+\.[a-zA-Z0-9-.]+$/--%>
<%--        if (!emailCheck.test(email)){--%>
<%--            $('#userEmailCkeck').html('이메일을 형식에 맞게 정확히 입력하세요.').css('color', 'red');--%>
<%--            return false--%>
<%--        }--%>
<%--        $('#userEmailCkeck').html('')--%>
<%--    });--%>
<%--</script>--%>
<%--<script>--%>
<%--    // 이름 정규표현식으로 유효성 검사--%>
<%--    $('#username').focusout(function() {--%>

<%--        let nickname = $('#username').val()--%>
<%--        let nicknameCheck =  /^[가-힣a-zA-Z]{2,15}$/--%>
<%--        if (!nicknameCheck.test(nickname)){--%>
<%--            $('#usernameCkeck').html('한글, 영문 이름 2~15자 이내로 입력해주세요.').css('color', 'red');--%>
<%--            return false--%>
<%--        }--%>
<%--        $('#usernameCkeck').html('')--%>
<%--    });--%>
<%--</script>--%>
<%--<script>--%>
<%--    // 비밀번호 정규표현식으로 유효성 검사--%>
<%--    $('#password1').focusout(function() {--%>
<%--        let pwdval = $('#password1').val()--%>
<%--        let pwdcheck =  /^[a-zA-Z0-9~!@#$%^&*()`_+?:;'"{}]{1,16}$/--%>

<%--        if (!pwdcheck.test(pwdval) || pwdval.length<8){--%>
<%--            $('#password1Ckeck').html('비밀번호는 영대소문자,숫자로 구성된 8글자 이상으로 조합하세요.').css('color', 'red');--%>
<%--            return false--%>
<%--        }--%>
<%--        $("#password1Ckeck").html('')--%>
<%--    });--%>
<%--    $('#password2').focusout(function() {--%>
<%--        let pwdval = $('#password2').val()--%>
<%--        let pwdcheck =  /^[a-zA-Z0-9~!@#$%^&*()`_+?:;'"{}]{1,16}$/--%>

<%--        if (!pwdcheck.test(pwdval) || pwdval.length<8){--%>
<%--            $('#password2Ckeck').html('비밀번호는 영대소문자,숫자로 구성된 8글자 이상으로 조합하세요.').css('color', 'red');--%>
<%--            return false--%>
<%--        }--%>
<%--        $("#password2Ckeck").html('')--%>
<%--    });--%>
<%--</script>--%>
<%--<script>--%>
<%--    // 전화번호 정규표현식으로 유효성 검사--%>
<%--    $('#tel').focusout(function() {--%>
<%--        let mobile = $('#tel').val()--%>
<%--        let mobileCheck =  /^\d{8}$/--%>
<%--        if (!mobileCheck.test(mobile)){--%>
<%--            $('#telCkeck').html('전화번호 8자리를 올바르게 입력하세요.').css('color', 'red');--%>
<%--            return false--%>
<%--        }--%>
<%--        $('#telCkeck').html('')--%>
<%--    });--%>
<%--</script>--%>
<%@ include file="../layout/footer.jsp" %>

