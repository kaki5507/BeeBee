<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<link rel="stylesheet" href="../../../resources/board/css/board-default.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<form role="form" class="board-default-wrap" action="/board/board-modify" method="post">
      <h2>게시글 수정하기</h2>
      <div class="get-group-title">
            <input type="text" class="form-control" id="title" name="title" value='<c:out value="${board.title}"/>'>
            <input type="text" class="form-control info-post" name="bno" value='<c:out value="${board.bno}"/>' readonly='readonly'>
            <input type="text" class="form-control info-post" id="writer" name="writer" value='<c:out value="${board.writer}"/>' readonly='readonly'>
      </div>
      <textarea class="form-control" id="content" name="content" cols="30" rows="3"><c:out value="${board.content}" /></textarea>     
      <div class="get-group-date">
            <label>작성일</label>
            <input type="text" class="form-control" name="regDate" value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${board.regdate}" />' readonly='readonly'>
            <label>최근수정일</label>
            <input type="text" class="form-control" name="updateDate" value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${board.updateDate}" />' readonly='readonly'>
      </div>

      <div class="get-btn">
            <button data-oper='modify' class="btn btn-modify">수정하기</button>
            <button data-oper='remove' class="btn btn-remove">삭제</button>
            <button data-oper='list' class="btn">게시판</button>
      </div>
      
      <!-- 페이지 값과 페이지 양 이동용 input -->
      <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
      <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
      <input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
      <input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
</form>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<script src="../../../resources/board/js/board-modify.js" type="text/javascript"></script>
