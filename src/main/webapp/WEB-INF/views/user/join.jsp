<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
	<link href="../../../../resources/static/css/khy_style.css" rel="stylesheet">
	<title></title>
</head>

<body class="k_body">

	<div class="container k_login-container">
		<h2 class="text-left k_easyjoin">이메일 간편가입</h2>
		
		<form action="/user/joinUp" method="post" enctype="multipart/form-data">
			<div class="k_form-group ">
				<div class="k_join_bottom">이메일</div>
				<div class="k_input-group input">
					<input type="email" class="form-control k_join_radius" id="userEmail" name="userEmail" value="123123@nate.com"
						placeholder="이메일 형식에 맞게 입력하세요."
						onfocus="this.placeholder = ''" onblur="this.placeholder = '이메일을 입력하세요.'">
					<button class="k_validation">인증하기</button>
				</div>
			</div>
			
			<div class="k_form-group">
				<div class="k_join_bottom">비밀번호</div>
				<div class="input-group k_input">
					<input type="password" class="form-control input k_pwd_backcolor" id="password1" name="password1" value="1234"
						placeholder="비밀번호를 입력하세요."
						 onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호 입력를 입력하세요.'">
					<div class="eyes" id="togglePassword1">
						<i class="fa fa-eye fa-lg"></i>
					</div>
				</div>
				
				<input type="password" class="form-control input k_pwd_backcolor k_pwd_input_margin" id="password2" name="password2" value="1234"
					placeholder="비밀번호 확인" 
					onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호 확인'">
				<div class="eyes2" id="togglePassword2">
					<i class="fa fa-eye fa-lg"></i>
				</div>
			</div>
			
			<div class="k_form-group">
				<div class="k_join_bottom">이름</div>
				<input type="text" class="form-control input" id="username" name="username" value="park"
					placeholder="이름을 입력하세요."
					onfocus="this.placeholder = ''" onblur="this.placeholder = '이름 입력을 입력하세요.'">
			</div>
			
			<div class="k_form-group">
				<div class="k_join_bottom">전화번호</div>
				<input type="text" class="form-control input" id="tel" name="tel" value="01020312"
					placeholder="전화번호 입력를 입력하세요."
					onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호 입력'">
			</div>
			
			<div class="k_complete text-center">
				<button type="submit" class="btn btn-primary btn-block">약관 동의 후 가입 완료하기</button>
			</div>	
		</form>
	</div>
<!--
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	<script>
		$(document).ready(function () {
			// 버튼을 클릭하면 비밀번호를 보이게 하거나 가립니다.
			$("#togglePassword1, #togglePassword2").click(function () {
				var $passwordInput = $(this).prev('input');
				var type = $passwordInput.attr('type') === 'password' ? 'text' : 'password';
				$passwordInput.attr('type', type);
			});
		});

	</script>
-->
</body>
</html>
