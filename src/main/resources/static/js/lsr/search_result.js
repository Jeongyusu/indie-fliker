function removeScrab(fundingId) {
    console.log('펀딩아이디 - fundingId:', fundingId);
    if (confirm("찜 목록에서 삭제하시겠습니까?")) {
        // Ajax 요청 보내기
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "/api/scrabs/delete", true);
        xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");

        var scrab = {
            userId: userId, // 서버에서 올바른 유저 아이디로 대체해야 함
            fundingId: fundingId
        };

        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4) {
                if (xhr.status === 200) {
                    console.log("Successfully removed from scrab list");
                    // 페이지 새로고침
                    refreshPage();
                } else {
                    console.error("Failed to remove from scrab list");
                }
            }
        };

        xhr.send(JSON.stringify(scrab));
    }
}

// 페이지 새로고침
function refreshPage() {
    location.reload();
}