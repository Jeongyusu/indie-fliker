<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
	<link href="/css/khy_style.css" rel="stylesheet">
	<title></title>
</head>

<body>

	<div class="container k_update_login-container">
		<h2 class="text-left k_profile_set" >프로필 정보 설정</h2>
		<div class="k_font_weight_bold">프로필 사진</div>
		<form action="/user/profile" method="post" enctype="multipart/form-data">
		<div class="k_profile-container">
			<img id="preview" class="k_profile" alt="" src="${user.pic}" onclick="return false;">
		</div>
		<div class="k_button-container">
			<input type="file" id="file" name="file" onchange="changeUserPic(event)">
			<input type="hidden" name="id" value ="${user.id}">
		</div>
			<div class="k_form-group">
			</div>
			<div class="k_form-group k_font_weight_bold">닉네임
				<input type="text" class="form-control k_input" id="username" placeholder="" name="username"
					onfocus="this.placeholder = ''" onblur="this.placeholder = ''" value="${user.username}">
			</div>
			<div class="k_font_weight_bold k_p_margin">비밀번호</div>
			<div class="input-group k_input">
				<input type="text" class="form-control" id="password1" placeholder="" name="password1"
					onfocus="this.placeholder = ''" onblur="this.placeholder =''"
					style="border-radius: 5px; background-color: #f6f6f6">
			</div>
			<div class="k_font_weight_bold k_p_margin">비밀번호 확인</div>
			<div class="input-group k_input">
				<input type="text" class="form-control" id="password2" placeholder="" name="password2"
					onfocus="this.placeholder = ''" onblur="this.placeholder =''"
					style="border-radius: 5px; background-color: #f6f6f6">
			</div>
	
			<div class="complete text-center">
				<button type="submit" class="btn btn-primary" style="background-color: gray">수정하기</button>
			</div>

		</form>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

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


