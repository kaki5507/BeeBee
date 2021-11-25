
//DOM 로딩이 다 되지 않았는데 DOM을 조작하는 자바스크립트 코드가 실행되면 원하는 결과를 내지 못할 것이다.

//DOMContentLoaded 이벤트로 이런 불상사를 막을 수 있다.
document.addEventListener('DOMContentLoaded', function(){
    document.querySelector(".side-btn").addEventListener("click", function(e){
        if ( document.querySelector('.side-menu-wrap').classList.contains('on') ){
            //메뉴닫힘
            document.querySelector('.side-menu-wrap').classList.remove('on');
            document.querySelector('.side-btn img').src = "../../../resources/common/img/menu-2.png";
            document.querySelector('.side-btn img').src = "../../../resources/common/img/menu-1.png";
            
            //페이지 스크롤 락 해제
            document.querySelector('#dimmed').remove();
        } else {
            //메뉴펼침
            document.querySelector('.side-menu-wrap').classList.add('on');
            document.querySelector('.side-btn img').src = "../../../resources/common/img/menu-1.png";
            document.querySelector('.side-btn img').src = "../../../resources/common/img/menu-2.png";

            //페이지 스크롤 락 레이어 추가
            let div = document.createElement('div');
            div.id = 'dimmed';
            document.body.append(div);

            //페이지 스크롤 락  모바일 이벤트 차단
            document.querySelector('#dimmed').addEventListener('scroll touchmove touchend mousewheel', function(e){
                e.preventDefault();
                e.stopPropagation();
                return false;
            });

            //페이지 스크롤 락 레이어 클릭 메뉴 닫기
            document.querySelector('#dimmed').addEventListener('click', function(e){
                document.querySelector(".side-btn").click();
            });             

        }
    });
});

function userInfo(){
    let userInfoBtn = document.getElementById("userInfo-menu");
    console.log(userInfoBtn);
    if(userInfoBtn.style.display == 'none'){
        userInfoBtn.style.display = 'block';
    }else{
        userInfoBtn.style.display = 'none';
    }
}