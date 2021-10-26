<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<link rel="stylesheet" href="../../../resources/board/css/board-default.css">

<div class="board-default-wrap">
      <div class="get-group-title">
            <input type="text" class="form-control" id="title" name="title" value='<c:out value="${board.title}"/>' readonly='readonly'>
            <input type="text" class="form-control info-post" name="bno" value='<c:out value="${board.bno}"/>' readonly='readonly'>
            <input type="text" class="form-control info-post" id="writer" name="writer" value='<c:out value="${board.writer}"/>' readonly='readonly' />
      </div>
      <textarea class="form-control" id="content" name="content" cols="30" rows="3" readonly='readonly'>
            <c:out value="${board.bno}" />
      </textarea>
      <h3>댓글</h3>
      <ul class="reply">
            <li class="reply-args">
                  <div class="reply-top">
                        <strong>작성자</strong>
                        <span>날짜</span>
                        <button type="button" class="replyTool"><i class="fas fa-ellipsis-v"></i></button>
                        <div class="reply-event">
                              <button type="button" class="replyBtnForm" id="replyModifyBtn">수정</button>
                              <button type="button" class="replyBtnForm" id="replyRemoveBtn">삭제</button>
                        </div>
                  </div>
                  <p class="reply-content">내용테스트</p>
                  <div class="vote-ui">
                        <a>👍 2</a>
                        <a>👎</a>
                  </div>
            </li>
      </ul>

      <div class="new-reply">
            <input type="text" name="replyer" placeholder="작성자">
            <textarea name="reply" cols="5" rows="3"></textarea>
            <input type="button" id="addReplyBtn" value="등록">
            <input type="hidden" name="replyDate">
      </div>

      <div class="get-btn">
            <button data-oper="modify" class="btn btn-modify">수정하기</button>
            <button data-oper="list" class="btn">게시판</button>
      </div>

      <!---- 데이터 전송 operForm ---->
	<form role="operForm" id='operForm' action="/board/board-modify" method='get'>
            <input type='hidden' id="bno" name='bno' value='<c:out value="${board.bno}"/>'>
		<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
		<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
            <input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
            <input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
	</form>
	<!---- //#operForm ---->
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="../../../resources/board/js/board-get.js" type="text/javascript"></script>
<script type="text/javascript">

$(document).ready(function() {
      // c:out value jsp에서 작동 안그러면 또 hidden해서 값을 가져와야 함
      var bnoValue = '<c:out value="${board.bno}"/>';
      var replyUL = $(".reply");
      
      showList(1);

      function showList(page){
            replyService.getList({bno:bnoValue, page:1},function(list){
                  console.log("list 의 값 !" + list);
                  let str = "";
                  // 콜백함수 list가 null이면 아무것도 보여지지 않아야함
                  if(list == null || list.length == 0){
                        replyUL.html("");

                        return; 
                  }
                  // 반복문을 통하여 댓글을 보여주는 곳
                  // str을 이용해서 li 태그를 만들어 준다.
                  for(var i = 0, len = list.length || 0; i < len; i++){
                        str +="<li class = 'reply-args' data-rno='"+ list[i].rno+"'>";
                        str +="<div class='reply-top'><strong>"+list[i].replyer+"</strong>";
                        str +="<span>"+replyService.displayTime(list[i].replyDate)+"</span>";
                        str +="<button type='button' class='replyTool'><i class='fas fa-ellipsis-v'></i></button>";
                        str +="<div class='reply-event'><button type='button' class='replyBtnForm' id='replyModifyBtn'>수정</button>"
                              +"<button type='button' class='replyBtnForm' id='replyRemoveBtn'>삭제</button>"
                              +"</div></div>";
                        str +="<p class='reply-content'>"+list[i].reply+"</p>";
                        str +="<div class='vote-ui'><a href='#'>👍" + list[i].replyBoom + "</a>"
                              + "<a href='#'>👎</a></div></li>";
                  }
                  replyUL.html(str);

                  // ul reply 태그 클릭 안에 li 태그에 data-rno 존재
                  $(".reply").on("click","li",function(){
                        let rno = $(this).data("rno");
                        console.log(rno);
                  });                  
            });
      }

	let newreply = $(".new-reply");
	let newInputReplyer = newreply.find("input[name='replyer']");
	let newInputReply = newreply.find("textarea[name='reply']");
	let newInputReplyDate = newreply.find("input[name='replyDate']");
    
	// 등록 버튼 클릭시 일어나는 이벤트
	$("#addReplyBtn").on("click",function(e){
		let reply = {
			reply : newInputReply.val(),
			replyer : newInputReplyer.val(),
			bno : bnoValue
		};

		replyService.add(reply,function(result){
			alert("result : " + result);

			showList(1);
		});
	});      
});
</script>