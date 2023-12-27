<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<body class="l_body">

<<<<<<< HEAD
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="/css/khy_style.css" rel="stylesheet">
    <title>아이디 비밀번호 찾기</title>
</head>

<body>

<div class="p_find_email_pw_main">

    <div class="p_menu">
        <label>
            <input type="radio" name="screen" id="emailRadio" checked> 이메일 찾기
        </label>

        <label>
            <input type="radio" name="screen" id="passwordRadio"> 비밀번호 찾기
        </label>
    </div>

    <div class="p_find_email" id="emailScreen">
        <label>이름</label><br>
        <input type="text" name="username" id="username"><br>
        <label>전화번호</label><br>
        <input type="text" name="tel" id="tel"><br>
        <button name="findEmail" id="findEmail">이메일 찾기</button>
    </div>

    <div class="p_find_password" id="passwordScreen" style="display: none;">
        <p>입력하신 이메일로 임시 비밀번호가 전송됩니다.</p>
        <label>이메일</label><br>
        <input type="text" name="userEmail" id="userEmail"><br>
        <button type="" name="sendPassword" id="sendPassword">임시 비밀번호 전송</button>
    </div>

</div>

<!----------------------------------- 라디오 버튼 --------------------------------------------->
<script>
    // 라디오 버튼에 대한 이벤트 리스너 추가
    document.getElementById('emailRadio').addEventListener('change', function() {
        document.getElementById('emailScreen').style.display = 'block';
        document.getElementById('passwordScreen').style.display = 'none';
    });

    document.getElementById('passwordRadio').addEventListener('change', function() {
        document.getElementById('emailScreen').style.display = 'none';
        document.getElementById('passwordScreen').style.display = 'block';
    });
</script>
<!----------------------------------- 라디오 버튼 --------------------------------------------->
<!--------------------------------- 회원 이메일 찾기 ------------------------------------------->
<script>
    $(document).ready(function(){
        $("#findEmail").click(function(){
            $.ajax({
                url : "/user/find-email",
                type : "post",
                data : {"username" : $("#username").val(), "tel" : $("#tel").val()},
                success : function(response) {
                    alert("회원님의 이메일은 " + response.response + ' 입니다.');
                },
                error: function (response){
                    alert(response.responseJSON.error.message);
                }
            });
        })
    });
</script>
<!---------------------------------- 회원 이메일 찾기 ------------------------------------------->
<!--------------------------------- 임시 비밀번호 발송 ----------------------------------------->
<script>
    $(document).ready(function(){
        $("#sendPassword").click(function () {
            console.log("진입 확인~");
            $.ajax({
                url: "/user/send-email",
                type: "post",
                data: {"userEmail" : $("#userEmail").val()},
                success: function (response) {
                    console.log("여기"+ response.response +"여기");
                    alert("회원님의 " + response.response + " 로 임시 비밀번호를 발송했습니다!");
                },
                error: function (response) {
                    alert(response.responseJSON.error.message);
                }
            })
        });
    });
</script>
<!--------------------------------- 임시 비밀번호 발송 ------------------------------------------->
</body>

</html>
=======
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
                    <input type="text" class="form-control" name="username" id="username"><br>
                    <label class="k_input_label">전화번호</label><br>
                    <input type="text" class="form-control" name="tel" id="tel"><br>
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
>>>>>>> dev
