<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<link rel="stylesheet" href="../../../resources/board/css/board-default.css">

<div class="board-default-wrap">
      <h2>게시글 읽기</h2>

      <div class="get-group">
            <label for="">번호</label>
            <input type="text" class="form-control" name="bno" value='<c:out value="${board.bno}"/>' readonly='readonly'>
      </div>

      <div class="get-group">
            <label for="">제목</label>
            <input type="text" class="form-control" name="title" value='<c:out value="${board.title}"/>' readonly='readonly'>
      </div>

      <div class="get-group">
            <label for="">텍스트 내용</label>
            <textarea class="form-control" name="content" cols="30" rows="3" readonly='readonly'>
            	<c:out value="${board.bno}" />
            </textarea>         
      </div>

      <div class="get-group">
            <label for="">작성자</label>
            <input type="text" class="form-control" name="writer" value='<c:out value="${board.writer}"/>' readonly='readonly' />
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