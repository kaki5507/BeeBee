<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<link rel="stylesheet" href="../../../resources/board/css/board-default.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

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
            <button data-oper="modify" class="btn btn-modify" onclick="location.href='/board/board-modify?bno=<c:out value="${board.bno}"/>'">수정하기</button>
            <button data-oper="list" class="btn" onclick="location.href='/board/board-list'">게시판</button>
      </div>
</div>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>