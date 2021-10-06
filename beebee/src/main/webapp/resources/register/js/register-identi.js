// input id
const _email = document.getElementById('email');
const _authen = document.getElementById('authen');
const _nickName = document.getElementById('nickName');
const _pwd = document.getElementById('pwd');
const _pwdc = document.getElementById('pwdc');

// 유효성 검사 통과
var okEmail = false;
var okAuthen = false;
var okNickName = false;
var okPwd = false;
var okPwdc = false;


// 회원가입 버튼
function joinClear(){
	
    if(!okEmail){
        _email.focus();
        return false;
    }else if(!okAuthen){
        _authen.focus();
        return false;
    }else if(!okNickName){
        _nickName.focus();
        return false;
    }else if(!okPwd){
        _pwd.focus();
        return false;
    }else if(!okPwdc){
        _pwdc.focus();
        return false;
    }else{
    	document.getElementById('btn-join').onclick = function(){
    		document.getElementById('m-wrap').submit();
    		return false;
    	};
    }

}

// 이메일 체크
function checkEmail(){
    let _email_error = document.getElementById('email_error');
    let emailExp = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
    let email = $('#email').val();

    if(_email.value === ""){
        _email_error.style.color = 'red';
        _email_error.innerHTML = "이메일을 입력해주세요.";
        return false;
    }else if(!emailExp.test(_email.value)){
        _email_error.style.color = 'red';
        _email_error.innerHTML = "이메일 형식에 맞게 입력해주세요.";
        return false;        
    }
    
    $.ajax({
        type : 'POST',
        data : {"email":email}, // data email이라는 String으로 보냄
        url : '/register/emailCheck',
        success:function(data){
            if(data != 1){
                _email_error.style.color = '#08a600';
            	_email_error.innerHTML = "멋진 이메일 이에요!";
                okEmail = true;
            }else{
                _email_error.style.color = 'red';
                _email_error.innerHTML = "이미 가입되어 있는 이메일 입니다.";
                return false;
            }
        },
        error:function(){
            console.log("에러입니다.");
        }
    });
}

// 닉네임 체크
function checkNickName(){
    let _nickName_error = document.getElementById('nickName_error');
    let nickNameExp = /^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{2,20}$/;
    let nickName = $('#nickName').val();

    if(_nickName.value === ""){
        _nickName_error.style.color = 'red';
        _nickName_error.innerHTML = "닉네임을 입력해주세요.";
        return false;
    }else if(!nickNameExp.test(_nickName.value)){
        _nickName_error.style.color = 'red';
        _nickName_error.innerHTML = "닉네임은 2~20자로 만들어주세요.";
        return false;        
    }

    $.ajax({
        type : 'POST',
        data : {"nickName":nickName}, // data email이라는 String으로 보냄
        url : '/register/nickNameCheck',
        success:function(data){
            if(data != 1){
                _nickName_error.style.color = '#08a600';
            	_nickName_error.innerHTML = "멋진 닉네임 이에요!!!";
                okNickName = true;
            }else{
                _nickName_error.style.color = 'red';
                _nickName_error.innerHTML = "아쉽게도 누군가 사용중이에요.";
                return false;
            }
        },
        error:function(){
            console.log("에러입니다.");
        }
    });    
}
var _authenChlick = false;
// 인증번호 체크
function checkAuthen(){
    let _authen_error = document.getElementById('authen_error');
    if(_authen.value === ""){
        _authen_error.style.color = 'red';
        _authen_error.innerHTML = "인증번호를 입력해주세요.";
        return false;
    }else if(_authenClick){
    	$.ajax({
    		type : 'GET',
            url : '/register/emailConfirm',
            success:function(result){
            	console.log("이메일 검증 성공");
            	console.log(result);
            	if(_authen.value === result){
                    _authen_error.style.color = '#08a600';
                    _authen_error.innerHTML = "인증번호가 일치합니다!";
                    okAuthen = true;
            	}
            },
            error:function(){
                console.log("인증 에러");
            }           
    	});
    }
        
}

function authenClick(){
    let email = $("#email").val();
    let _authen_error = document.getElementById('authen_error');
    let bool = true;
    
    if(bool){
        $.ajax({
            type : 'POST',
            data : {"email":email},
            url : '/register/emailSend',
            success:function(result){
                _authen_error.style.color = 'brown';
                _authen_error.innerHTML = "인증번호가 전송되었습니다.";
                bool = false;
                _authenClick = true;
            },
            error:function(){
                console.log("인증 에러");
            }            
        });

    }else{
        event.preventDefault();
    }
}

// 비밀번호 체크
function checkPwd(){
     // 대문자 1, 소문자1, 숫자1, 특수문자1
    let pwdExp = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{10,16}$/;
    let _pwd_error = document.getElementById('pwd_error');

    if(_pwd.value === ""){
        _pwd_error.style.color = 'red';
        _pwd_error.innerHTML = "비밀번호를 입력해주세요.";
        return false;
    }else if(!pwdExp.test(_pwd.value)){
        _pwd_error.style.color = 'red';
        _pwd_error.innerHTML = "비밀번호 양식에 맞지 않아요.";
        return false;
    }else{
        _pwd_error.innerHTML = "&nbsp";
        okPwd = true;
    }
}

// 비밀번호 재확인 체크(blur 여서 각자 만듬)
function checkPwdc(){
    let _pwdc_error = document.getElementById('pwdc_error');
    if(_pwd.value != _pwdc.value){
        _pwdc_error.style.color = 'red';
        _pwdc_error.innerHTML = "비밀번호가 일치하지 않아요!";
    }else{
        _pwdc_error.style.color = '#08a600';
        _pwdc_error.innerHTML = "비밀번호가 일치해요!";
        okPwdc = true;
    }
}

/*
●●●●●●●●●●●이메일 로직●●●●●●●●●●●
★1
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

★2
유효성이 맞으면 true로 전환하고 
btn 클릭했을 때 안맞는 정보가 있다면 focus()해서 입력창으로 가게 만들어 준다.

★3
마지막에 통과후 .submit으로 정보를 보낸다.
*/ 
