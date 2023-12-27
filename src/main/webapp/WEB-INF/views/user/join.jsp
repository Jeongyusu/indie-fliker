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
                       value="sssar@nate.com"
                       placeholder="이메일 형식에 맞게 입력하세요."
                       onfocus="this.placeholder = ''" onblur="this.placeholder = '이메일을 입력하세요.'">
                <p id="userEmailCkeck"></p>
                <input class="k_validation k_validation_button" type="button" id="emailCheck" value="중복 확인">
            </div>
        </div>

        <div class="k_form_group">
            <label class="k_input_label">닉네임</label><br>
            <input type="text" class="form-control input" id="username" name="username" value="123"
                   placeholder="닉네임을 입력하세요."
                   onfocus="this.placeholder = ''" onblur="this.placeholder = '닉네임을 입력하세요.'">
            <p id="usernameCkeck"></p>
        </div>

        <div class="k_form_group">
            <label class="k_input_label">비밀번호</label><br>
            <div class="input-group k_input">
                <input type="password" class="form-control k_pwd_backcolor" id="password1" name="password1" value="1234"
                       placeholder="비밀번호를 입력하세요."
                       onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호 입력를 입력하세요.'"
                       style="border-radius: 0.25rem">
                <p id="password1Ckeck"></p>
                <div class="eyes" id="togglePassword1">
                    <i class="fa fa-eye fa-lg"></i>
                </div>
            </div>
            <div class="input-group k_input">
                <input type="password" class="form-control k_pwd_backcolor k_pwd_input_margin" id="password2"
                       name="password2" value="1234"
                       placeholder="비밀번호 확인"
                       onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호 확인'"
                       style="border-radius: 0.25rem">
                <p id="password2Ckeck"></p>
                <div class="eyes2" id="togglePassword2">
                    <i class="fa fa-eye fa-lg"></i>
                </div>
            </div>
        </div>

        <div class="k_form_group">
            <label class="k_input_label">전화번호</label><br>
            <input type="text" class="form-control input" id="tel" name="tel" value="123"
                   placeholder="전화번호 입력를 입력하세요."
                   onfocus="this.placeholder = ''" onblur="this.placeholder = '전화번호를 입력하세요.'">
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
        //	var query = {userEmail : $("#userEmail").val()};
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

                $('#submitBtn').attr('onclick', 'alert("이메일 인증은 필수입니다.")');
                $('#username').attr('readonly', '');
            }
        });
    });
</script>
<%@ include file="../layout/footer.jsp" %>

