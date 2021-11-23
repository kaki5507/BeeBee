<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<link rel="stylesheet" href="../../../resources/board/css/board-default.css">

<form role="form" class="board-default-wrap" action="/board/board-modify" method="post">
      <h2>게시글 수정하기</h2>
      <div class="get-group-title">
            <input type="text" class="form-control" id="title" name="title" value='<c:out value="${board.title}"/>'>
            <input type="text" class="form-control info-post" name="bno" value='<c:out value="${board.bno}"/>' readonly='readonly'>
            <input type="text" class="form-control info-post" id="writer" name="writer" value='<c:out value="${board.writer}"/>' readonly='readonly'>
      </div>
      <textarea class="form-control" id="content" name="content" cols="30" rows="3"><c:out value="${board.content}" /></textarea>     
      <div class="file-control">
            <input class="uploadFileName" value="첨부파일" placeholder="첨부파일">
            <label for="attachFile">파일찾기</label>
            <input type="file" id="attachFile" name="uploadFile" multiple>
      </div>
      <div class="uploadPreview">

      </div>
      <div class="get-group-date">
            <label>작성일</label>
            <input type="text" class="form-control" name="regDate" value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${board.regdate}" />' readonly='readonly'>
            <label>최근수정일</label>
            <input type="text" class="form-control" name="updateDate" value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${board.updateDate}" />' readonly='readonly'>
      </div>
      <sec:authentication property="principal" var="pinfo" />
      <sec:authorize access="isAuthenticated()">
            <div class="get-btn">
                  <c:if test="${pinfo.username eq board.writer}">
                  <button type="submit" data-oper='modify' class="btn btn-modify">수정하기</button>
                  <button type="submit" data-oper='remove' class="btn btn-remove">삭제</button>
                  </c:if>
                  <button type="submit" data-oper='list' class="btn">게시판</button>
            </div>
      </sec:authorize>
      <!-- 페이지 값과 페이지 양 이동용 input -->
      <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
      <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
      <input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
      <input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
</form>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="../../../resources/board/js/board-modify.js" type="text/javascript"></script>
<script>
      $(document).ready(function(){
            (function(){
                  var bno = '<c:out value="${board.bno}"/>';

                  $.getJSON("/board/getAttachList", {bno: bno},function(arr){
                        var str = "";
                        if(arr != null && arr.length > 0){
                              $(".uploadPreview").html("<h5>첨부파일</h5><ul></ul>");
                        }
                        console.log(arr);
                        
                        // 각각의 첨부 파일들을 처리
                        $(arr).each(function(i, attach){
                              // image type
                              if(attach.fileType){
                                    var fileCallPath = encodeURIComponent(attach.uploadPath + "/s_" + attach.uuid + "_" + attach.fileName);
                                    
                                    str += "<li data-path='" + attach.uploadPath +"' data-uuid='"
                                          + attach.uuid + "' data-filename='" + attach.fileName + "' data-type='" + attach.fileType
                                          + "'><div>";
                                    str += "<span class='attachFileName'>" + attach.fileName + "</span>";
                                    str += "<button type='button' data-file=\'" + fileCallPath + "\' data-type='file' class='btn-circle'><i class='fa fa-times'></i></button><br>";            
                                    str += "<img src='/display?fileName=" + fileCallPath + "'>";
                                    str += "</div></li>";
                              }else{
                                    str += "<li data-path='" + attach.uploadPath + "' data-uuid='" + attach.uuid + "' data-filename='"
                                          + attach.fileName + "' data-type='" + attach.fileType + "'><div>";
                                    str += "<span class='attachFileName'>" + attach.fileName + "</span>";
                                    str += "<button type='button' data-file=\'" + fileCallPath + "\' data-type='file' class='btn-circle'><i class='fa fa-times'></i></button><br>";      
                                    str += "<img class='attachImg' src='/resources/board/img/attach.png'>";
                                    str += "</div></li>"
                              }
                        });
                        $(".uploadPreview ul").html(str);
                  });// end getjson
            })(); // end function

            // X 버튼 클릭
            $(".uploadPreview").on("click","button",function(e){
                  if(confirm("삭제하시겠습니까?")){
                        let targetLi = $(this).closest('li');
                        targetLi.remove();
                  }
            });

            var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
            var maxSize = 5242880; // 5MB

            // 파일 검사
            function checkExtension(fileName, fileSize){
                  if(fileSize >= maxSize){
                        alert("파일 사이즈 초과");
                        return false;
                  }

                  if(regex.test(fileName)){
                        alert("해당 종류의 파일은 업로드가 불가능 합니다.");
                        return false;
                  }
                  return true;
            }

            var csrfHeaderName = "${_csrf.headerName}";
            var csrfTokenValue = "${_csrf.token}";
            $("input[type='file']").change(function(e){
                  // 폼 객체를 만들어줌
                  var formData = new FormData();

                  var inputFile = $("input[name='uploadFile']");

                  var files = inputFile[0].files;

                  for(var i=0; i<files.length; i++){
                        if(!checkExtension(files[i].name, files[i].size)){
                              return false;
                        }
                        formData.append("uploadFile",files[i]);
                  }

                  $.ajax({
                        url: '/uploadAjaxAction',
                        processData: false,
                        contentType: false,
                        data:formData,type : 'POST',
                        beforeSend: function(xhr){
                              xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
                        },
                        dataType:'json',
                        success: function(result){
                              uploadPreviewResult(result);
                        }
                  });// $.ajax
            });// input change

            // 업로드 결과 화면에 보이기
            function uploadPreviewResult(uploadPreviewArr){
                  if(!uploadPreviewArr || uploadPreviewArr.length == 0){return;}

                  // ul 태그 만들기 없으면 안보여줬음
                  $(".uploadPreview").html("<ul></ul>");
                  // ul 태그에 추가하기
                  var uploadUL = $(".uploadPreview ul");

                  var str = "";

                  // 들어온 각각의 파일 객체들 obj로 만들어서
                  $(uploadPreviewArr).each(function(i,obj){
                        // obj의 이미지가 있으면
                        if(obj.image){
                              // fileCallPah라는 변수를 만들어서
                              var fileCallPath = encodeURIComponent( obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
                                    str += "<li data-path='" + obj.uploadPath + "'";
                                    str += "data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'data-type='" + obj.image + "'>";
                                    str += "<div>";
                                    str += "<span class='attachFileName'>" + obj.fileName + "</span>";
                                    str += "<button type='button' data-file=\'" + fileCallPath + "\' data-type='file' class='btn-circle'><i class='fa fa-times'></i></button><br>";
                                    str += "<img src='/display?fileName=" + fileCallPath + "'>";
                                    str += "</div></li>";                  
                        }else{
                              var fileCallPath = encodeURIComponent( obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
                                    str += "<li data-path='" + obj.uploadPath + "'";
                                    str += "data-uuid='" + obj.uuid + "' data-filename='" + obj.fileName + "'data-type='" + obj.image + "'>";
                                    str += "<div>";
                                    str += "<span class='attachFileName'>" + obj.fileName + "</span>";
                                    str += "<button type='button' data-file=\'" + fileCallPath + "\' data-type='file' class='btn-circle'><i class='fa fa-times'></i></button><br>";
                                    str += "<img class='attachImg' src='/resources/board/img/attach.png'>";
                                    str += "</div></li>";      
                        }
                  });
                  uploadUL.append(str);
            } // uploadPreviewResult
      })
</script>