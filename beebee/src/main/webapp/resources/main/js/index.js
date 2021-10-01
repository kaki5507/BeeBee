
/*------- 마우스 스크롤 -------*/
window.addEventListener('scroll',function(){
    // document.element 안됐음 why? IE, firefox만 지원
    // body를 이용하면 Chrome,safari 등등 가능
	
	//let currScroll = document.body.scrollTop; 현재 스크롤바 위치 html에서 작동 jsp 작동 X
    let currScroll = document.documentElement.scrollTop; // 현재 스크롤바 위치
    let _web_about_img1 = $('.web_about > img:nth-child(1)');
    let _web_about_img2 = $('.web_about > img:nth-child(2)');
    let _web_about_img3 = $('.web_about > img:nth-child(3)');
    let _web_about_info = $('.web_about_info');
    console.log(currScroll);

    if(currScroll > 800){
        _web_about_img1.addClass('img_show1');
        _web_about_img2.addClass('img_show2');
        _web_about_img3.addClass('img_show3');
        _web_about_info.addClass('text_show');
    }

    if(currScroll < 500){
        _web_about_img1.removeClass('img_show1');
        _web_about_img2.removeClass('img_show2');
        _web_about_img3.removeClass('img_show3');
        _web_about_info.removeClass('text_show');
    }
});