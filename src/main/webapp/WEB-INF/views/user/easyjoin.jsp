<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<link rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
	<link href="../../../../../../resources/static/css/khy_style.css" rel="stylesheet">
	<title></title>
</head>

<body class="k_body">

	<div class="container k_login-container k_easyjoin_main">
		<h2 class="text-left k_easyjoin_font">간편가입</h2>
		<div class="k_s_info" >최소한의 정보만 받고 있습니다.</div>
		<form>
			<div class="k_form-group">
				<div class="k_tel">전화번호</div>
				<div class="input-group k_input">
					<input type="text" class="form-control k_change" style="border-radius: 5px;" id="tel" placeholder="010-0000-0000"
						onfocus="this.placeholder = ''" onblur="this.placeholder = '010-0000-0000'">
					<button class="k_easy_validation">변경하기</button>
					<div class="sub-text">
						<sub>해당 번호로 알림 및 영화가 발송됩니다. 사용하는 이메일이 아닌 경우, 변경하시길 바랍니다.</sub>
					</div>
				</div>
			</div>
			<div class="k_form-group name k_tel">이름
				<input type="text" class="form-control input " id="username" placeholder="이름 입력"
					onfocus="this.placeholder = ''" onblur="this.placeholder = '이름입력'">

			</div>

			<div class="k_complete text-center">
				<button type="submit" class="btn btn-primary btn-block">약관 동의 후 가입 완료하기</button>
			</div>
		</form>
	</div>

	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>




</body>

</html>