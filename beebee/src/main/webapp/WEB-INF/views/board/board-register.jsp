<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<link rel="stylesheet" href="../../../resources/board/css/board-default.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>

<form class="board-default-wrap" action="/board/board-register" method="post">
      <div class="get-group">
            <div class="get-group-title">
                  <input type="text" class="form-control" id="title" name="title" placeholder="제목을 입력해주세요">
            </div>
            <textarea class="form-control" id="content" name="content" cols="30" rows="3" placeholder="내용을 입력해주세요"></textarea>         
            <input type="text" id="writer" name="writer" class="form-control" placeholder="작성자">
            <button type="submit" class="btn btn-modify">작성완료</button>
            <button type="reset" class="btn btn-remove">리셋</button>
            <button class="btn">게시판</button>
      </div>
</form>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>