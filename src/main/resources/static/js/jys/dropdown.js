$(function(){
    console.log("실행중1");
    $(".j_navi > ul > li").mouseover(function(){
        $(this).find(".j_submenu").stop().slideDown();
    });
    console.log("실행중2");
    $(".j_navi > ul > li").mouseout(function(){
        $(this).find(".j_submenu").stop().slideUp();
    });
    console.log("실행중3");

})


// window.onload = function(){
//     let navList = document.querySelectorAll(".j_navi > ul > li");
//
//     navList.forEach(function(navItem){
//         navItem.addEventListener("mouseover", function(){
//             this.querySelector(".submenu").style.height = "155px";
//         });
//     });
//     navList.forEach(function(navItem){
//         navItem.addEventListener("mouseout", function(){
//             this.querySelector(".submenu").style.height = "0px";
//         });
//     });
// }
