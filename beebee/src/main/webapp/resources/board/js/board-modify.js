$(document).ready(function(){
	
    // 폼 객체
	let formObj = $("form");
	
    // 버튼 클릭하면
	$('button').on("click", function(e){
		// 이벤트 기능 막는다
		e.preventDefault();
		
		let operation = $(this).data("oper");
		
		if(operation === 'remove'){
			formObj.attr("action", "/board/remove");
		}else if(operation === 'list'){
			// move to list
            self.location = "/board/board-list";
			return;
		}
		formObj.submit();
	});
	
});