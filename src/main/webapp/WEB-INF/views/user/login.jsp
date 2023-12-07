<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<link href="../../../../../resources/static/css/khy_style.css" rel="stylesheet">
	<title>Login Page</title>
</head>

<body class="k_body">

	<div class="container k_login-container">
		<h2 class="text-left k_login">로그인</h2>
		<form>
			<div class="k_form-group">
				<input type="text" class="form-control" id="username" placeholder="이메일 입력"
					onfocus="this.placeholder = ''" onblur="this.placeholder = '이메일 입력'">
			</div>
			<div class="k_form-group">
				<input type="password" class="form-control" id="password" placeholder="비밀번호 입력"
					onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호 입력'">
			</div>
			<a href="" class="k_forget">로그인
				정보를 잊으셨나요?</a>
			<div class="k_email">
				<button type="submit" class="btn btn-primary btn-block">이메일로 로그인</button>
			</div>
			<div class="k_kakao">
				<button type="submit" class="k_kakao-btn btn btn-block"></button>
			</div>
		</form>
		<div class="k_no_id_aligin">
			<div class="k_no_id">아직 인디픽터 계정이 없나요?</div>
			<a href="" class="k_join">회원가입</a>
		</div>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

</body>

</html>