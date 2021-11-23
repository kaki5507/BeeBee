<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>


<link rel="stylesheet" href="../../../resources/board/css/board-default.css">
<form role="form" class="board-default-wrap" action="/board/board-register" method="post">
      <div class="get-group">
            <div class="get-group-title">
                  <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력해주세요">
            </div>
            <textarea class="form-control" id="content" name="content" cols="30" rows="3" placeholder="내용을 입력해주세요"></textarea>         
            <input type="text" id="writer" name="writer" class="form-control" value='<sec:authentication property="principal.username"/>' readonly="readonly">
            <div class="file-control">
                  <input class="uploadFileName" value="첨부파일" placeholder="첨부파일">
                  <label for="attachFile">파일찾기</label>
                  <input type="file" id="attachFile" name="uploadFile" multiple>
            </div>
            <div class="uploadPreview">
                  <ul>

                  </ul>
            </div>
            <button type="submit" class="btn btn-modify">작성완료</button>
            <button type="reset" class="btn btn-remove">리셋</button>
            <button type="button" class="btn" onclick="moveList();">게시판</button>
      </div>
      <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
</form>
<script>
$(document).ready(function(){
      // 파일 
      $("#attachFile").on('change',function(){
            var fileName = $("#attachFile").val();
            $(".uploadFileName").val(fileName);
      });            

      var formObj = $("form[role='form']");

      $("button[type='submit']").on("click",function(e){
            e.preventDefault();
            var str = "";

            $(".uploadPreview ul li").each(function(i, obj){
                  var jobj = $(obj);

                  str += "<input type='hidden' name='attachList[" + i + "].fileName' value='" + jobj.data("filename")+"'>";
                  str += "<input type='hidden' name='attachList[" + i + "].uuid' value='" + jobj.data("uuid") + "'>";
                  str += "<input type='hidden' name='attachList[" + i + "].uploadPath' value='" + jobj.data("path") + "'>";
                  str += "<input type='hidden' name='attachList[" + i + "].fileType' value='" + jobj.data("type") + "'>";
            });
            formObj.append(str).submit();
      });
      
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
var csrfHeaderName ="${_csrf.headerName}"; 
var csrfTokenValue="${_csrf.token}";
console.log("csrfHeaderName : " + csrfHeaderName);
console.log("csrfToken : " + csrfTokenValue);

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
            beforeSend: function(xhr) {
                  xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
            },
            data:formData,type : 'POST',
            dataType:'json',
            success: function(result){
                  uploadPreviewResult(result);
            }
      });// $.ajax
});// input change

// 업로드 결과 화면에 보이기
function uploadPreviewResult(uploadPreviewArr){
      if(!uploadPreviewArr || uploadPreviewArr.length == 0){return;}

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
}

$(".uploadPreview").on("click","button",function(e){
      var targetFile = $(this).data('file');
      var imageType = $(this).data('type');

      // 가장 가까운 li 태그를 찾음 this 기준
      var targetLi = $(this).closest('li');

      $.ajax({
            url: '/deleteFile',
            data: {fileName:targetFile, image:imageType},
            beforeSend: function(xhr) {
                  xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
            },
            dataType : 'text',
            type:'POST',
            success: function(result){
                  targetLi.remove();
            }
      });
});
// list 페이지로
function moveList(){
      location.href = "/board/board-list";
}
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>