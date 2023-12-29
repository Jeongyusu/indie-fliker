// -------------------------------- 라디오 버튼 -------------------------------------------<script>
    // 라디오 버튼에 대한 이벤트 리스너 추가
    document.getElementById('emailRadio').addEventListener('change', function() {
    document.getElementById('emailScreen').style.display = 'block';
    document.getElementById('passwordScreen').style.display = 'none';
});

    document.getElementById('passwordRadio').addEventListener('change', function() {
    document.getElementById('emailScreen').style.display = 'none';
    document.getElementById('passwordScreen').style.display = 'block';
});
// -------------------------------- 라디오 버튼 -------------------------------------------<script>

// -------------------------------- 회원 이메일 찾기 -------------------------------------------<script>
    // 회원 이메일 찾기
$(document).ready(function(){
    $("#findEmail").click(function(){
        console.log("진입확인")
        $.ajax({
            url : "/user/find-email",
            type : "post",
            data : {"username" : $("#username").val(), "tel" : $("#tel").val()},
            success : function(response) {
                alert("회원님의 이메일은 " + response.response + ' 입니다.');
            },
            error: function (){
                alert("에러");
            }
        });
    })
});
// -------------------------------- 회원 이메일 찾기 -------------------------------------------<script>

// -------------------------------- 임시 비밀번호 발송 -------------------------------------------<script>
$("#sendPassword").click(function () {
    const userEmail = $("#userEmail").val();
    const sendEmail = document.forms["sendEmail"];
    $.ajax({
        type: 'post',
        url: 'emailDuplication',
        data: {
            'memberEmail': userEmail
        },
        dataType: "text",
        success: function (result) {
            if (result == "no") {
                // 중복되는 것이 있다면 no == 일치하는 이메일이 있다!
                alert('임시비밀번호를 전송 했습니다.');
                sendEmail.submit();
            } else {
                alert('가입되지 않은 이메일입니다.');
            }

        }, error: function () {
            console.log('에러 체크!!')
        }
    })
});

// -------------------------------- 임시 비밀번호 발송 -------------------------------------------