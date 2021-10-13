<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<link rel="stylesheet" href="../../../resources/board/css/board-default.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<form class="board-default-wrap" action="/board/board-register" method="post">
      <h2>게시글 작성하기</h2>

      <div class="get-group">
            <label for="">제목</label>
            <input type="text" class="form-control" name="title">
      </div>

      <div class="get-group">
            <label for="">텍스트 내용</label>
            <textarea class="form-control" name="content" cols="30" rows="3"></textarea>         
      </div>

      <div class="get-group">
            <label for=""></label>
            <input type="text" name="writer" class="form-control">
      </div>

      <div class="get-btn">
            <button type="submit" class="btn btn-modify">작성완료</button>
            <button type="reset" class="btn btn-remove">리셋</button>
            <button class="btn">게시판</button>
      </div>
</form>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>