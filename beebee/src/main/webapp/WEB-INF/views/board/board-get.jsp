<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="../../../resources/board/css/board-default.css">

<div class="board-default-wrap">
      <!-- 게시글 제목,번호,내용 -->
      <div class="get-group-title">
            <input type="text" class="form-control" id="title" name="title" value='<c:out value="${board.title}"/>' readonly='readonly'>
            <input type="text" class="form-control info-post" name="bno" value='<c:out value="${board.bno}"/>' readonly='readonly'>
            <input type="text" class="form-control info-post" id="writer" name="writer" value='<c:out value="${board.writer}"/>' readonly='readonly' />
      </div>
      <!-- 내용 -->
      <textarea class="form-control" id="content" name="content" cols="30" rows="3" readonly='readonly'><c:out value="${board.content}"/></textarea>
      <!-- 첨부 파일 리스트 -->
      <div class="uploadPreview">

      </div>
      <h3>댓글</h3>
      <ul class="reply">
      
      </ul>

      <div class="replyPage">

      </div>
      <sec:authorize access="isAuthenticated()">
      <div class="new-reply">
            <input type="text" name="replyer" readonly="readonly" value='<sec:authentication property="principal.member.userNickName"/>'>
            <textarea name="reply" cols="5" rows="3"></textarea>
            <input type="button" id="addReplyBtn" value="등록">
            <input type="hidden" name="replyDate">
      </div>
      </sec:authorize>

      <sec:authentication property="principal" var="pinfo"/>
      <sec:authorize access="isAuthenticated()">
      <div class="get-btn">
            <c:if test="${pinfo.member.userNickName eq board.writer}">
            <button data-oper="modify" class="btn btn-modify">수정하기</button>
            </c:if>
            <button data-oper="list" class="btn">게시판</button>
      </div>
      <input type="hidden" id="secreplyer" value='<sec:authentication property="principal.member.userNickName"/>'>
      </sec:authorize>
      <!---- 데이터 전송 operForm ---->
	<form role="operForm" id='operForm' action="/board/board-modify" method='get'>
            <input type='hidden' id="bno" name='bno' value='<c:out value="${board.bno}"/>'>
		<input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
		<input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
            <input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
            <input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
	</form>
	<!---- //#operForm ---->
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="../../../resources/board/js/board-get.js" type="text/javascript"></script>
<script>
      $(document).ready(function(){
            (function(){

                  var bno = '<c:out value="${board.bno}"/>';

                  $.getJSON("/board/getAttachList", {bno: bno},function(arr){
                        
                        console.log(arr);

                        var str = "";

                        if(arr != null && arr.length > 0){
                              $(".uploadPreview").html("<h5>첨부파일</h5><ul></ul>");
                        }
                        
                        // 각각의 첨부 파일들을 처리
                        $(arr).each(function(i, attach){
                              
                              // image type
                              if(attach.fileType){
                                    var fileCallPath = encodeURIComponent(attach.uploadPath + "/s_" + attach.uuid + "_" + attach.fileName);
                                    
                                    str += "<li data-path='" + attach.uploadPath +"' data-uuid='"
                                          + attach.uuid + "' data-filename='" + attach.fileName + "' data-type='" + attach.fileType
                                          + "'><div>";
                                    str += "<img src='/display?fileName=" + fileCallPath + "'>";
                                    str += "</div></li>";
                              }else{
                                    str += "<li data-path='" + attach.uploadPath + "' data-uuid='" + attach.uuid + "' data-filename='"
                                          + attach.fileName + "' data-type='" + attach.fileType + "'><div>";
                                    str += "<span>" + attach.fileName + "</span><br/>";
                                    str += "<img class='attachImg' src='/resources/board/img/attach.png'>";
                                    str += "</div></li>"
                              }
                        });

                        $(".uploadPreview ul").html(str);
                  });// end getjson
            })(); // end function
      })
</script>
<script type="text/javascript">
$(document).ready(function() {
      // 시큐리티 작성자
      var secreplyer = document.getElementById("secreplyer").value;
      // c:out value jsp에서 작동 안그러면 또 hidden해서 값을 가져와야 함
      var bnoValue = '<c:out value="${board.bno}"/>';
      var replyUL = $(".reply");
      
      showList(1);

      function showList(page){
            console.log("page " + page);
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
                	  	replyUL.html("");
                        return; 
                  }
                  // 반복문을 통하여 댓글을 보여주는 곳
                  // str을 이용해서 li 태그를 만들어 준다.
                  for(var i = 0, len = list.length || 0; i < len; i++){
                        console.log(list[i].replyer);
                        str +="<li class = 'reply-args' data-rno='"+ list[i].rno+"'>";
                        str +="<div class='reply-top'><strong class='reply-strong'>"+list[i].replyer+"</strong>";
                        str +="<span>"+replyService.displayTime(list[i].replyDate)+"</span>";
                        str +="<sec:authorize access='isAuthenticated()'>";
                        str +="<button type='button' class='replyTool' data-rno='"+ list[i].rno+"'><i class='fas fa-ellipsis-v'></i></button>";
                        str +="</sec:authorize>";
                        str +="<div class='reply-event' data-rno='"+ list[i].rno+"'><button type='button' class='replyBtnForm replyModifyBtn'>수정</button>"
                              +"<button type='button' class='replyBtnForm replyRemoveBtn'>삭제</button>"
                              +"</div></div>";
                        str +="<p class='reply-content'>"+list[i].reply+"</p>";
                        str +="<div class='vote-ui'><button type='button' name='boomUp' data-rno='"+ list[i].rno+"'>👍 " + list[i].replyBoomUp + "</button>"
                              + "<button type='button' name='boomDown' data-rno='"+ list[i].rno+"'>👎 " + list[i].replyBoomDown +"</button></div></li>";
                  }
                  replyUL.html(str);
                  showReplyPage(replyCnt);
            });// replyService.getList
      }// showList

      /* replyTool위에 마우스 올려졌을 시*/
      $(".reply").on("mouseenter",".replyTool",function(e){
      e.preventDefault();

      let replyevent = $(this).siblings(".reply-event");
      let replyStrong = $(this).siblings(".reply-strong");
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
                  var reply = {
                        rno:rno, 
                        reply: modreply.val().replace(/(?:\r\n|\r|\n)/g, '<br/>'),
                        replyer:secreplyer
                  };

                  if(!secreplyer){
                        alert("로그인 후 이용하세요.")
                        return;
                  }
                  if(secreplyer != replyStrong.text()){
                        alert("본인만 수정 가능합니다.");
                        return;
                  }
                  replyService.update(reply, function(result){
                        alert(result);
                        showList(pageNum); // 댓글 업데이트하고 새로운 댓글이 달릴 수 있으므로 showList(1); 로 가져와줌
                  });
            });
      });
      // 삭제 클릭
      $(replyevent).find(".replyRemoveBtn").click(function(e){
            e.preventDefault();
            if(!secreplyer){
                  alert("로그인 후 이용하세요.");
                  return false;
            }
            if(secreplyer != replyStrong.text()){
                  alert("본인만 수정 가능합니다.");
                  return;
            }
            replyService.remove(rno, secreplyer,function(result){
                  alert("remove" + result);
                  showList(pageNum);
            });
      });
});
// 추천 비추천 
$(".reply").on("click","button[name='boomUp']",function(e){
      e.preventDefault();
      var rno = $(this).data("rno");
      let boomUp = {
            reco : secreplyer,
            rno : rno
      };
      replyService.boomUp(boomUp,function(result){
            alert("추천하셨습니다.");
            showList(pageNum);
      });
});
$(".reply").on("click","button[name='boomDown']",function(e){
      e.preventDefault();
      var rno = $(this).data("rno");
      let boomDown = {
            reco : secreplyer,
            rno : rno
      };
      replyService.boomDown(boomDown,function(result){
            alert("비추천하셨습니다.");
            showList(pageNum);
      });
});
/* 마우스가 li 태그를 벗어났을 때*/
$(".reply").on("mouseleave","li",function(e){
      e.preventDefault();
      $(this).find(".reply-event").hide();
      $(this).find(".replyTool").show();
});
      let newreply = $(".new-reply");
      let newInputReplyer = newreply.find("input[name='replyer']");
      let newInputReply = newreply.find("textarea[name='reply']");
      let newInputReplyDate = newreply.find("input[name='replyDate']");
      
      var csrfHeaderName = "${_csrf.headerName}";
      var csrfTokenValue = "${_csrf.token}";
      $(document).ajaxSend(function(e, xhr, options){
            xhr.setRequestHeader(csrfHeaderName,csrfTokenValue);
      });
      // 등록 버튼 클릭시 일어나는 이벤트
      $("#addReplyBtn").on("click",function(e){
            let reply = {
                  reply : newInputReply.val().replace(/(?:\r\n|\r|\n)/g, '<br/>'),
                  replyer : newInputReplyer.val(),
                  bno : bnoValue
            };
            console.log("replyer " + reply);
            replyService.add(reply,function(result){
                  alert("result : " + result);
                  showList(-1); // 전체 댓글 파악
            });
            $(".modreply").html("");
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

      $(".uploadPreview").on("click","li",function(e){
            let liObj = $(this);

            var path = encodeURIComponent(liObj.data("path")+ "/" + liObj.data("uuid") + "_" + liObj.data("filename"));

            if(liObj.data("type")){
                  showImage(path.replace(new RegExp(/\\/g),"/"));
            }else{
                  self.location = "/download?fileName=" + path;
            }
      });

      // 이미지 클릭
      function showImage(fileCallPath){
            let url = "/display?fileName=" + fileCallPath;
            let title = "attachPopup";
            let status = "toolbar=no,scrollbars=no,resizable=yes,status=no,menubar=no";
            window.resizeTo(800, 800);
            window.open(url,title,status);
      }
});
$(document).ajaxSend(function(e, xhr, options){
      xhr.setRequestHeader("${_csrf.headerName}","${_csrf.token}");
});
</script>