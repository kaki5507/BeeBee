// const는 변수 재선언, 변수 재할당 불가능 let 변수 재할당 가능
let allchk = false; // 전부 선택 X -> 이용약관 읽어보기 위함 
const frm = document.forms['agForm']; 
console.log(frm.elements['agree-list'])
// == 두개하면 타입 구별 X 
// === 세개하면 타입 구별 가능
function allCheck(){ //onclick 이벤트 발생
    if(allchk===false){ //allchk가 false라면 전부 false로
        for(let i=0; i<4; i++){
            frm.elements['agree-list'][i].checked = true;
        }
        allchk = true;
    }else if(allchk===true){
        for(let i=0; i<4; i++){
            frm.elements['agree-list'][i].checked = false;
        }
        allchk = false;
    }
} 