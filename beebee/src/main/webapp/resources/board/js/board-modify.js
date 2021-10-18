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
			// list 페이지로 이동 파라미터도 같이 전달되어야 함
			formObj.attr("action","/board/board-list").attr("method","get");
			let pageNumTag = $("input[name='pageNum']").clone(); // 임시 저장 empty로 삭제하기 때문에
			let amountTag = $("input[name='amount']").clone();
			let keywordTag = $("input[name='keyword']").clone();
			let typeTag = $("input[name='type']").clone();
			
			formObj.empty();

			formObj.append(pageNumTag);
			formObj.append(amountTag);
			formObj.append(keywordTag);
			formObj.append(typeTag);
		}
		formObj.submit();
	});
	
});