<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
	<link rel="stylesheet" href="/css/khy_style.css">
	<!-- 제이쿼리 -->
	<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
	<script src='https://code.jquery.com/jquery-3.3.1.min.js'></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
	
	<title></title>
</head>

<body class="k_body">

	<div class="container k_login-container">
		<h2 class="text-left k_easyjoin">이메일 간편가입</h2>
		
		<form action="/user/join" method="post" enctype="multipart/form-data">
			<div class="k_form-group ">
				<div class="k_join_bottom">이메일</div>
				<div class="k_input-group input">
					<input type="email" class="form-control k_join_radius" id="userEmail" name="userEmail" value="123@123"
						placeholder="이메일 형식에 맞게 입력하세요."
						onfocus="this.placeholder = ''" onblur="this.placeholder = '이메일을 입력하세요.'">
					<p id="userEmailCkeck"></p>
					<input class="k_validation" type="button" id="emailCheck" value="이메일 중복 확인">
				</div>
				
			</div>
			
			<div class="k_form-group">
				<div class="k_join_bottom">비밀번호</div>
				<div class="input-group k_input">
					<input type="password" class="form-control input k_pwd_backcolor" id="password1" name="password1" value="1234"
						placeholder="비밀번호를 입력하세요."
						 onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호 입력를 입력하세요.'">
					<p id="password1Ckeck"></p>
					<div class="eyes" id="togglePassword1">
						<i class="fa fa-eye fa-lg"></i>
					</div>
				</div>
				
				<input type="password" class="form-control input k_pwd_backcolor k_pwd_input_margin" id="password2" name="password2" value="1234"
					placeholder="비밀번호 확인" 
					onfocus="this.placeholder = ''" onblur="this.placeholder = '비밀번호 확인'">
				<p id="password2Ckeck"></p>
				<div class="eyes2" id="togglePassword2">
					<i class="fa fa-eye fa-lg"></i>
				</div>
			</div>
			
			<div class="k_form-group">
				<div class="k_join_bottom">이름</div>
				<input type="text" class="form-control input" id="username" name="username" value="123"
					placeholder="이름을 입력하세요."
					onfocus="this.placeholder = ''" onblur="this.placeholder = '이름 입력을 입력하세요.'">
				<p id="usernameCkeck"></p>
			</div>
			
			<div class="k_form-group">
				<div class="k_join_bottom">전화번호</div>
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
		$("#emailCheck").click(function(){
		 
	//	var query = {userEmail : $("#userEmail").val()};
		 
			$.ajax({
				url : "/emailCkeck",
				type : "post",
				dataType : "jSON",
				data : {"userEmail" : $("#userEmail").val()},
				success : function(data) {
		  
					if(data == 1) {
						alert("이미 존재하는 이메일입니다.");
					} else {
						alert("사용 가능한 이메일입니다.");
					}
					
					$('#submitBtn').attr( 'onclick','alert("이메일 인증은 필수입니다.")');
					$('#username').attr('readonly','');
				}		
			});
		});
	</script>
	
</body>
</html>