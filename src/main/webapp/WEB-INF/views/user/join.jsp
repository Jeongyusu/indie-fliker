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
					<button class="k_validation">인증하기</button>
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
				<button type="submit" class="btn btn-primary btn-block">약관 동의 후 가입 완료하기</button>
			</div>	
		</form>
	</div>
	

	<script>
		// 이메일 유효성 검사
		$('#userEmail').focusout(function() {
	    	let userEmail = $('#userEmail').val()
	        let userEmailCheck =  /^[a-zA-Z0-9]+$/
		
	        if (!userEmailCheck.test(userEmail)){
				$('#userEmailCkeck').html('이메일을 정확하게 입력하세요.')
	        	return false
	        }
	        $("#userEmailCkeck").html('')
		});
		
		$('#form').on('submit', function() {
			let userEmail = $('#userEmail').val()
	        let userEmailCheck =  /^[a-zA-Z0-9]+$/
		
	        if (!userEmailCheck.test(userEmail)){
				$('#userEmailCkeck').html('이메일을 정확하게 입력하세요.')
				$('#userEmail').focus()
	        	return false
	        }
	        $("#userEmailCkeck").html('')
		})
		
		// 비동기 통신으로 이메일 중복 체크
		$(document).ready(function() {

	    	$("#userEmailCkeck").on("focusout", function() {
	    		
	    		var userEmail = $("#userEmail").val();
	    		
	    		if(id == '' || userEmail.length == 0) {
	    			$("#userEmailCkeck").css("color", "red").text("이메일을 입력해주세요.");
	    			return false;
	    		}
	    		
	        	//Ajax로 전송
	        	$.ajax({
	        		url : './user/userEmailCheck',
	        		data : {
	        			id : userEmail
	        		},
	        		type : 'POST',
	        		dataType : 'json',
	        		success : function(result) {
	        			if (result == true) {
	        				$("#userEmailCkeck").css("color", "black").text("사용 가능한 이메일 입니다.");
	        			} else{
	        				$("#userEmailCkeck").css("color", "red").text("사용 불가능한 이메일 입니다.");
	        				$("userEmail").val('');
	        			}
	        		}
	        	}); //End Ajax
	    	});
	    })
		
	</script>
		
	<script>
		// 비밀번호1 유효성 검사
		$('#password1').focusout(function() {
	    	let password1 = $('#password1').val()
	        let password1Ckeck =  /^[a-zA-Z0-9~!@#$%^&*()`_+?:;'"{}]{1,16}$/
	        if (!password1Ckeck.test(password1) || password1.length<10){
				$('#password1Ckeck').html('비밀번호는 영대소문자,숫자로 구성된 10글자 이상으로 조합하세요.')
	        	return false
	        }
	        $("#password1Ckeck").html('')
		});
		
		$('#form').on('submit', function() {
			let password1 = $('#password1').val()
	        let password1Ckeck =  /^[a-zA-Z0-9~!@#$%^&*()`_+?:;'"{}]{1,16}$/
		
	        if (!password1Ckeck.test(password1) || password1.length<10){
				$('#password1Ckeck').html('비밀번호는 영대소문자,숫자로 구성된 10글자 이상으로 조합하세요.')
				$('#password1').focus()
	        	return false
	        }
	        $("#password1Ckeck").html('')
		})
		
		// 비밀번호2 유효성 검사
		$('#password2').focusout(function() {
	    	let password2 = $('#password2').val()
	        let password2Ckeck =  /^[a-zA-Z0-9~!@#$%^&*()`_+?:;'"{}]{1,16}$/
		
	        if (!password2Ckeck.test(password2) || password2.length<10){
				$('#password2Ckeck').html('비밀번호는 영대소문자,숫자로 구성된 10글자 이상으로 조합하세요.')
	        	return false
	        }
	        $("#password2Ckeck").html('')
		});
		
		$('#form').on('submit', function() {
			let password2 = $('#password2').val()
	        let password2Ckeck =  /^[a-zA-Z0-9~!@#$%^&*()`_+?:;'"{}]{1,16}$/
		
	        if (!password2Ckeck.test(password2) || password2.length<10){
				$('#password2Ckeck').html('비밀번호는 영대소문자,숫자로 구성된 10글자 이상으로 조합하세요.')
				$('#password2').focus()
	        	return false
	        }
	        $("#password2Ckeck").html('')
		})
	</script>
		
	<script>
		// 이름 유효성 검사
		$('#username').focusout(function() {
	    	let username = $('#username').val()
	        let usernameCkeck =  /^[가-힣a-zA-Z]{2,15}$/
		
	        if (!usernameCkeck.test(username) || username.length<10){
				$('#usernameCkeck').html('한글, 영문으로 이름 2~15자 이내로 입력하세요.')
	        	return false
	        }
	        $("#usernameCkeck").html('')
		});
		
		$('#form').on('submit', function() {
			let username = $('#username').val()
	        let usernameCkeck =  /^[가-힣a-zA-Z]{2,15}$/
		
	        if (!usernameCkeck.test(username) || username.length<10){
				$('#usernameCkeck').html('한글, 영문으로 이름 2~15자 이내로 입력하세요.')
				$('#username').focus()
	        	return false
	        }
	        $("#usernameCkeck").html('')
		})
	</script>
		
	<script>
		// 전화번호 유효성 검사
		$('#tel').focusout(function() {
	    	let tel = $('#tel').val()
	        let telCkeck =  /^\d{8}$/
		
	        if (!telCkeck.test(tel) || tel.length<10){
				$('#telCkeck').html('전화번호 8자리를 올바르게 입력하세요.')
	        	return false
	        }
	        $("#telCkeck").html('')
		});
		
		$('#form').on('submit', function() {
			let tel = $('#tel').val()
	        let telCkeck =  /^\d{8}$/
		
	        if (!telCkeck.test(tel) || tel.length<10){
				$('#telCkeck').html('전화번호 8자리를 올바르게 입력하세요.')
				$('#tel').focus()
	        	return false
	        }
	        $("#telCkeck").html('')
		})
	</script>


		
	
	
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