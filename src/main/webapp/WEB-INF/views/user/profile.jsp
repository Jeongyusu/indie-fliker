<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link href="/css/khy_style.css" rel="stylesheet">
    <title></title>
</head>

<body>

<div class="k_profile_main">
    <h1 class="k_profile_info_set">프로필 정보 설정</h1>
    <h2 class="k_profile_pic">프로필 사진</h2>
    <form action="/user/profile" method="post" enctype="multipart/form-data">
    <input type="hidden" name="id" id="id" value ="${user.id}">
    <img id="preview" class="k_profile" alt="" name="pic" id="pic" src="${user.pic}" onclick="return false;">
    <input type="file" id="file" name="file" onchange="changeUserPic(event)">
    <button class="k_profile_bttn">삭제</button>
    <div class="k_profile_first_container">
        <div>닉네임</div>
        <input type="text" class="k_profile_nicknmae" id="username" name="username" placeholder="${user.username}">
        <div class="k_profile_tel_div">전화번호</div>
        <input type="text" class="k_profile_tel_input" id="tel" name="tel" placeholder="${user.tel}">
    </div>
    <div>
        <div class="k_profile_password_div">비밀번호</div>
        <input type="password" placeholder="비밀번호 입력" class="k_profile_tel_input" id="password1" name="password1">
        <div class="k_profile_password_div">
            <input type="password" placeholder="비밀번호 확인" class="k_profile_tel_input" id="password2" name="password2">
        </div>
    </div>
    <div class="k_profile_bttns_margin">
        <button class="k_profile_bttn_cancle">취소</button>
        <button type="submit" class="k_profile_bttn_ok">확인</button>
    </div>
    </form>

</div>

	<script>
		function changeUserPic(e1) {
		    let f = e1.srcElement.files[0];
		    console.log(f.type);
		    if (!f.type.match("image.*")) {
		      alert("이미지를 등록해주세요");
		      return;
		    }
		    let reader = new FileReader();
		    reader.onload = function (e2) { // 파일이 다 읽어지면 콜백됨
		      let previewEl = document.querySelector("#preview");
		      previewEl.setAttribute("src", e2.target.result);
		    }
		    reader.readAsDataURL(f); // 파일 읽기 onload()
		  	}
	</script>


</body>


</html>


