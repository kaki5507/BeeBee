<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<link rel="stylesheet" href="../../../resources/board/css/board-list.css">
<!------ board-wrap ------>
<div class="board-wrap">
    <!---- board-side-menu ---->
    <div class="board-side-menu">
        <ul>
            <li><h3>공부 인증</h3></li>
            <li><a href="#">공부 인증</a></li>
            <li><a href="#">자유게시판</a></li>
            <li><a href="#">질문게시판</a></li>
            <li><a href="#">자격증</a></li>
        </ul>
    </div>
    <!---- //board-side-menu ---->
    
    <!---- board-option ---->
    <form class="board-option" action="">
        <div><h2>게시판</h2></div>
        <div>
            <input type="text" class="form-search" placeholder="검색하기">
        </div>
        <div>
            <button id='board-regBtn' type="button" class="btn btn-reg">글 작성하기</button>
        </div>
    </form>
    <!---- //board-option ---->
    
    <!---- board-center ---->
    <div class="board-center">
        <table class="board-table">
            <tr>
                <th class="bt-1">번호</th>
                <th class="bt-2">제목</th>
                <th class="bt-3">아이디</th>
                <th class="bt-4">작성일</th>
                <th class="bt-5">조회 수</th>
            </tr>
            <c:forEach items="${list}" var="board">
            <tr>
                <td class="bt-1"><c:out value="${board.bno}" /></td>
                <td class="bt-2">
                	<a class='move' href='<c:out value="${board.bno}"/>'>
                		<c:out value="${board.title}" />
                	</a>
                </td>
                <td class="bt-3"><c:out value="${board.writer}" /></td>
                <td class="bt-4"><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}" /></td>
                <td class="bt-5"><fmt:formatDate pattern="yyyy-MM-dd" value="${board.updateDate}" /></td>
            </tr>
            </c:forEach>
        </table>

        <ul class="pagination">
        	<c:if test="${pageMaker.prev}">
            	<li class="paginate_button page-pre"><a href="${pageMaker.startPage -1}">&lt;</a></li>
            </c:if>
            <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
            	<li class="paginate_button page-num ${pageMaker.cri.pageNum == num ? "page-active":""}"><a href="${num}">${num}</a></li>
            </c:forEach>
            <c:if test="${pageMaker.next}">
            	<li class="paginate_button page-next"><a href="${pageMaker.endPage +1}">&gt;</a></li>
            </c:if>	
        </ul>
    </div>
    <!---- //board-center ---->
    
    <!---- actionForm 게시글 이동용 form ---->
	<form id='actionForm' action="/board/board-list" method='get'>
		<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
		<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
	</form>
	<!---- //actionForm ---->
    
    <!---- modal-content 모달 ---->
    <div class="modal-content">
        <div class="modal-content-back">
            <div class="modal-content-message"></div>
            <button type="button" class="modal-close">닫기</button>
        </div>
    </div>
    <!---- //.modal-content ---->

    <!-- result값 가져오기 -->
    <input type="hidden" class="result" value='<c:out value="${result}"/>' />
</div>
<!------ //board-wrap ------>    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="../../../resources/board/js/board-list.js" type="text/javascript"></script>