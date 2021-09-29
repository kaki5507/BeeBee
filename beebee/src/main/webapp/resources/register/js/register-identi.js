const id = $('#mId');
const pwd = $('#mPwd');
const pwdc = $('#mPwdc');

// 회원가입 버튼
function joinClear(){
    console.log("확인");
    let _mId_error = document.getElementById('mId_error');
    let _mAuthen_error = $('.mAuthen_error');
    let _mName_error = $('.mName_error');
    let _mPwd_error = $('.mPwd_error');
    let _mPwdc_error = $('.mPwdc_error');

    _mId_error.innerHTML = "dd";
}

/*
function idCheckFunction(){
    let mId = $('#mId').val();
    $.ajax({
        type : 'POST',
        url :
        data : 
    })
}
*/

/*
유효하지 않은 이메일입니다.
이미 가입되어 있는 이메일입니다.
인증번호가 맞지 않습니다.
이미 사용중인 닉네임 입니다.
비밀번호를 다시 확인해주세요.
비밀번호가 일치하지 않습니다.

맞으면(초록색)
좋은 이메일입니다.
인증번호가 맞습니다.
좋은 닉네임입니다.
비밀번호가 일치합니다.
*/ 

// 닉네임 자음 x 영문,숫자,한글조합
// 마지막에 통과후 .submit으로 정보를 보낸다.