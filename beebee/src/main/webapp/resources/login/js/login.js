document.getElementById('btn-login').onclick = function(){
    document.getElementById('login-wrap').submit();
    // let email = $('#email').val();
    // let pwd = $('#pwd').val();
    // $.ajax({
    //     type : 'POST',
    //     data : {"email":email, "pwd":pwd},
    //     url : '/login/loginCheck',
    //     success:function(data){
    //         if(data != 1){
    //             alert("아이디와 비밀번호를 다시 확인해주세요");
    //         }else{
    //             document.getElementById('login-wrap').submit();
    //         }
    //     },
    //     error:function(){
    //         console.log("에러입니다.");
    //     }
    // });
};