<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<link rel="stylesheet" href="../../../resources/board/css/board-default.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>


<form role="form" class="board-default-wrap" action="/board/board-modify" method="post">
      <h2>게시글 수정하기</h2>

      <div class="get-group">
            <label>번호</label>
            <input type="text" name="bno" class="form-control" value='<c:out value="${board.bno}"/>' readonly='readonly'>
      </div>

      <div class="get-group">
            <label>제목</label>
            <input type="text" class="form-control" name="title" value='<c:out value="${board.title}"/>'>
      </div>

      <div class="get-group">
            <label>텍스트 내용</label>
            <textarea class="form-control" name="content" cols="30" rows="3">
                  <c:out value="${board.bno}" />
            </textarea>         
      </div>

      <div class="get-group">
            <label>작성자</label>
            <input type="text" class="form-control" name="writer" value='<c:out value="${board.writer}"/>' readonly='readonly'>
      </div>

      <div class="get-group">
            <label>작성일</label>
            <input type="text" class="form-control" name="regDate" value='<fmt:formatDate pattern = "yyyy/MM/dd" value = "${board.regdate}" />' readonly='readonly'>
      </div>

      <div class="get-group">
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
</form>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<script src="../../../resources/board/js/board-modify.js" type="text/javascript"></script>
