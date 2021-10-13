$(document).ready(function(){
    // rttr 값 result로 받음 
    let result = $(".result").val(); 
    
    // result 값 체크 모델에 넣어서 있는지 없는지 확인
    checkModal(result);

    // history.pushState()와 동일하게 동작 새로운 히스토리를 하나 생성하는 대신에, 현재의 히스토리 엔트리를 변경함
    history.replaceState({},null,null);

    // 체크 모달 함수
    function checkModal(result){ // history.state 현재 히스토리 상태 보여줍니다.
        if(result === '' || history.state){
            return;
        }

        if(parseInt(result) > 0){
            $(".modal-content-message").html("게시글 " + parseInt(result) + " 번이 등록되었습니다.");        
        }else if(result === 'success'){ // 수정 완료하면 success value에 넣어줬음
            $(".modal-content-message").html("처리가 완료되었습니다.");
        }
        $(".modal-content").show();
        
    }
    // 모달 닫기
    $(".modal-close").on("click",function(){
        $(".modal-content").hide();
    });

    // 버튼 클릭시 이동
    $("#board-regBtn").on("click",function(){		
        self.location ="/board/board-register";
    });
    
    // 액션 폼
    let actionForm = $("#actionForm");
    
    /* 게시물 조회를 위한 이벤트 처리 추가 */
    $(".move").on("click", function(e){
        e.preventDefault(); // 이벤트 취소
        actionForm.append("<input type='hidden' name='bno' value='"+$(this).attr("href")+"'>"); //href 속성값 가져와서 이동
        actionForm.attr("action","/board/board-get"); // attr 속성 변경(jQuery)
        actionForm.submit();
    });
});