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
                              <button type="button" class="replyBtnForm replyModifyBtn">수정</button>
                              <button type="button" class="replyBtnForm replyRemoveBtn">삭제</button>
                        </div>
                  </div>
                  <p class="reply-content">내용테스트</p>
                  <div class="vote-ui">
                        <a>👍 2</a>
                        <a>👎</a>
                  </div>
            </li>
      </ul>

      <div class="replyPage">

      </div>

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
            replyService.getList({bno:bnoValue, page:page||1},function(replyCnt, list){

                  console.log("replyCnt : " + replyCnt);
                  console.log("list : " + list);

                  // -1이면 페이지 첫 번째 보여주기
                  if(page == -1){
                        pageNum = Math.ceil(replyCnt/10.0);
                        showList(pageNum);
                        return;
                  }

                  var str = "";
                  // 콜백함수 list가 null이면 아무것도 보여지지 않아야함
                  if(list == null || list.length == 0){
                        return; 
                  }
                  // 반복문을 통하여 댓글을 보여주는 곳
                  // str을 이용해서 li 태그를 만들어 준다.
                  for(var i = 0, len = list.length || 0; i < len; i++){
                        str +="<li class = 'reply-args' data-rno='"+ list[i].rno+"'>";
                        str +="<div class='reply-top'><strong>"+list[i].replyer+"</strong>";
                        str +="<span>"+replyService.displayTime(list[i].replyDate)+"</span>";
                        str +="<button type='button' class='replyTool' data-rno='"+ list[i].rno+"'><i class='fas fa-ellipsis-v'></i></button>";
                        str +="<div class='reply-event' data-rno='"+ list[i].rno+"'><button type='button' class='replyBtnForm replyModifyBtn'>수정</button>"
                              +"<button type='button' class='replyBtnForm replyRemoveBtn'>삭제</button>"
                              +"</div></div>";
                        str +="<p class='reply-content'>"+list[i].reply+"</p>";
                        str +="<div class='vote-ui'><a href='#'>👍" + list[i].replyBoom + "</a>"
                              + "<a href='#'>👎</a></div></li>";
                  }
                  replyUL.html(str);
                  
                  showReplyPage(replyCnt);
                  /* replyTool위에 마우스 올려졌을 시*/
                  $(".reply").on("mouseenter",".replyTool",function(e){
                        e.preventDefault();

                        let replyevent = $(this).siblings(".reply-event");
                        replyevent.show();

                        $(this).hide();
                        var rno = $(this).data("rno");

                        // 수정창 나오는 코드
                        $(replyevent).children(".replyModifyBtn").click(function(e){
                              // replyevent의 부모의 형제들에 있는 .reply-content의 댓글 내용을 textarea 태그로 바꾼다.
                              $(replyevent).parent().siblings(".reply-content")
                                    .html("<textarea class='modreply' name='modreply' cols='5' rows='3'></textarea>")
                                    .append("<button type='button' class='updateReplyBtn'>수정</button>"); 
                              // rno값과 function을 실행해주는데 function 안에는 댓글들을 가져와야한다.
                              // 댓글을 가져와서 수정 창이 열리면 그 밸류를 새로운 textarea class인 modreply에 넣어준다.
                              replyService.get(rno, function(reply){
                                    $(".modreply").val(reply.reply);
                              });

                              // 댓글 수정 replyevent가 this로 만들어져있어서 동적 각자의 태그를 분별해줌.
                              $(".updateReplyBtn").on("click",function(e){
                                    var modreply = $(".modreply");
                                    var reply = {rno:rno, reply: modreply.val()};
                                    replyService.update(reply, function(result){
                                          alert(result);
                                          showList(pageNum); // 댓글 업데이트하고 새로운 댓글이 달릴 수 있으므로 showList(1); 로 가져와줌
                                    });
                              });
                        });
                        // 삭제 클릭
                        $(replyevent).find(".replyRemoveBtn").click(function(e){
                              console.log(rno);
                              replyService.remove(rno, function(result){
                                    alert("remove" + result);
                                    showList(pageNum);
                              });
                        });
                  });
                  /* 마우스가 li 태그를 벗어났을 때*/
                  $(".reply").on("mouseleave","li",function(e){
                        e.preventDefault();
                        $(this).find(".reply-event").hide();
                        $(this).find(".replyTool").show();
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

                  showList(-1); // 전체 댓글 파악
            });
      });    

      var pageNum = 1;
      let replyPage = $(".replyPage");
      function showReplyPage(replyCnt){
    	  	console.log("showReplyPage" + replyCnt);
            let endNum = Math.ceil(pageNum / 10.0) * 10;
            let startNum = endNum - 9;

            // 앞에 버튼 11이면 2페이지 이므로 앞에 버튼 보여줌
            let prev = startNum != 1;
            let next = false;

            // 댓글이 더 적으면 마지막 숫자 올림 해서 보여준다.
            if(endNum * 10 >= replyCnt){
                  endNum = Math.ceil(replyCnt/10.0);
            }
            
            // 댓글이 더 많으면 next 버튼 true
            if(endNum * 10 < replyCnt){
                  next = true;
            }

            let str = "<ul class='pagination'>";
            
            if(prev){
                  str += "<li class='paginate_button page-pre'><a href='"+(startNum - 1)+"'>&lt;</a></li>";
            }

            for(var i = startNum; i <= endNum; i++){
                  var active = pageNum == i? "page-active" : "";

                  str += "<li class='paginate_button page-num " + active 
                        + "'><a href='"+i+"'>" + i + "</a></li>";
            }

            if(next){
                  str += "<li class='paginate_button page-next><a href='" + (endNum +1) + "'>&gt;</a></li>";                  
            }

            str += "</ul></div>";
            
            replyPage.html(str);
      }
      
      // 댓글 번호 클릭 시 이동
      replyPage.on("click","li a",function(e){
    	      e.preventDefault();
            console.log("page click");
            
            var targetPageNum = $(this).attr("href");

            console.log("targetPageNum : " + targetPageNum);

            pageNum = targetPageNum;

            showList(pageNum);
      });
});

</script>