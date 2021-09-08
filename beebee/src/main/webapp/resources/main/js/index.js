
const slideList = document.querySelector('.slide_list'); // 슬라이드 부모
const slideContents = document.querySelectorAll('.slide_content'); // 슬라이드 자식
const slideBtnNext = document.querySelector('.slide_btn_next'); // 다음 버튼
const slideBtnPrev = document.querySelector('.slide_btn_prev'); // 이전 버튼
const slideLen = slideContents.length; // 슬라이드 길이
const slideWidth = 800; // 슬라이드 넓이
const slideSpeed = 300; // 슬라이드 속도
const startNum = 0; // initial slide index (0 ~ 4)
slideList.style.width = slideWidth * (slideLen + 2) + "px";

// 처음 마지막 슬라이드 자식 복사
let firstChild = slideList.firstElementChild;
let lastChild = slideList.lastElementChild;
let clonedFirst = firstChild.cloneNode(true);
let clonedLast = lastChild.cloneNode(true);

// 복사 슬라이드 추가
slideList.appendChild(clonedFirst);
slideList.insertBefore(clonedLast, slideList.firstElementChild);
slideList.style.transform = "translate3d(-" + (slideWidth * (startNum + 1)) + "px, 0px, 0px)";
let curIndex = startNum; // 현재 슬라이드 인덱스
let curSlide = slideContents[curIndex]; // 현재 슬라이드 자식
curSlide.classList.add('slide_active');

/* 다음 버튼  */
slideBtnNext.addEventListener('click', function () {
    if (curIndex <= slideLen - 1) {
        slideList.style.transition = slideSpeed + "ms";
        slideList.style.transform = "translate3d(-" + (slideWidth * (curIndex + 2)) + "px, 0px, 0px)";
    }
    if (curIndex === slideLen - 1) {
        setTimeout(function () {
            slideList.style.transition = "0ms";
            slideList.style.transform = "translate3d(-" + slideWidth + "px, 0px, 0px)";
        }, slideSpeed);
        curIndex = -1;
    }
    curSlide.classList.remove('slide_active');
    curSlide = slideContents[++curIndex];
    curSlide.classList.add('slide_active');
});
/* 이전 버튼 */
slideBtnPrev.addEventListener('click', function () {
    if (curIndex >= 0) {
        slideList.style.transition = slideSpeed + "ms";
        slideList.style.transform = "translate3d(-" + (slideWidth * curIndex) + "px, 0px, 0px)";
    }
    if (curIndex === 0) {
        setTimeout(function () {
            slideList.style.transition = "0ms";
            slideList.style.transform = "translate3d(-" + (slideWidth * slideLen) + "px, 0px, 0px)";
        }, slideSpeed);
        curIndex = slideLen;
    }
    curSlide.classList.remove('slide_active');
    curSlide = slideContents[--curIndex];
    curSlide.classList.add('slide_active');
});
