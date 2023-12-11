<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
	<link href="../../../../../resources/static/css/khy_style.css" rel="stylesheet">
	<title></title>
</head>

<body>

	<div class="container k_update_login-container">
		<h2 class="text-left k_profile_set" >프로필 정보 설정</h2>
		<div class="k_font_weight_bold">프로필 사진</div>
		<div class="k_profile-container">
			<img class="k_profile" src="../../../../../resources/static/images/icons/gamst.jpg" alt="My Image">
		</div>
		<div class="k_button-container">
			<button type="button" class="k_change_delete">바꾸기</button>
			<button type="button" class="k_change_delete">삭제</button>
		</div>
		<form>
			<div class="k_form-group">
			</div>
			<div class="k_form-group k_font_weight_bold">닉네임
				<input type="text" class="form-control k_input" id="username" placeholder="이름 입력"
					onfocus="this.placeholder = ''" onblur="this.placeholder = '이름입력'">
			</div>
			<div class="k_font_weight_bold k_p_margin">전화번호</div>
			<div class="input-group k_input">
				<input type="text" class="form-control" id="tel" placeholder="010-0000-0000"
					onfocus="this.placeholder = ''" onblur="this.placeholder ='010-0000-0000'"
					style="border-radius: 5px; background-color: #f6f6f6;">
				<button class="k_p_validation">변경하기</button>
			</div>
			<div class="form-group  k_font_weight_bold k_p_margin">간단한 한 마디로 나를 소개해주세요
				<textarea class="form-control k_input" id="intro" placeholder="" onfocus="this.placeholder = ''"
					onblur="this.placeholder = ''" style="height: 150px;"></textarea>
			</div>
			<div class="complete text-center">
				<button type="submit" class="btn btn-primary" style="background-color: gray;">취소</button>
				<button type="submit" class="btn btn-primary">확인</button>
			</div>

		</form>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>

</html>