<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link href="/css/khy_style.css" rel="stylesheet">
    <title>아이디 비밀번호 찾기</title>
</head>

<body>

<div>
    <h2>이메일/비밀번호 찾기</h2>

    <label>
        <input type="radio" name="screen" id="emailRadio" checked> 이메일 찾기
    </label>

    <label>
        <input type="radio" name="screen" id="passwordRadio"> 비밀번호 찾기
    </label>


        <div id="emailScreen">
            <label>이름</label><br>
            <input type="text" name="username" id="username"><br>
            <label>전화번호</label><br>
            <input type="text" name="tel" id="tel"><br>
            <button type="submit" id="findEmail">이메일 찾기</button>
        </div>

    <form action="" method="post">
        <div id="passwordScreen" style="display: none;">
            <p>입력하신 이메일로 임시 비밀번호가 전송됩니다.</p>
            <label>이메일</label><br>
            <input type="text"><br>
            <button type="submit" id="">임시 비밀번호 전송</button>
        </div>
    </form>


</div>

<!--------------------------------- 라디오 버튼 --------------------------------------------->
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
<!--------------------------------- 라디오 버튼 --------------------------------------------->
<!--------------------------------- 회원 이메일 찾기 ------------------------------------------->
<script>
    // 회원 이메일 찾기
    $("#findEmail").click(function(){
        console.log("진입확인")
        //	var query = {userEmail : $("#userEmail").val()};
        $.ajax({
            url : "/user/find-email",
            type : "post",
            dataType : "jSON",
            data : {"username" : $("#username").val(), "tel" : $("#tel").val()},
            success : function(userEmail) {

                alert("회원님의 이메일은 " + userEmail + ' 입니다.');
            }
        });
    });
</script>
<!--------------------------------- 회원 이메일 찾기 ------------------------------------------->

</body>

</html>