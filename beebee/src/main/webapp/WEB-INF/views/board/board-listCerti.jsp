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
            <li><h3>자격증게시판</h3></li>
            <li><a href="<c:url value='/board/board-list'/>">통합 게시판</a></li>
            <li><a href="<c:url value='/board/board-listStudy'/>">공부 인증</a></li>
            <li><a href="<c:url value='/board/board-listFree'/>">자유게시판</a></li>
            <li><a href="<c:url value='/board/board-listQnA'/>">질문게시판</a></li>
            <li><a href="<c:url value='/board/board-listCerti'/>">자격증</a></li>
        </ul>
    </div>
    <!---- //board-side-menu ---->
    
    <!---- searchForm ---->
    <form class="searchForm" action="/board/board-listCerti" method="get">
        <div><h2>게시판</h2></div>
        <div class="searchBar">
            <select name="type" class="type-search">
                <option value="" <c:out value="${pageMaker.cri.type == null ? 'selected' : ''}"/>>--</option>
                <option value="T" <c:out value="${pageMaker.cri.type eq 'T' ? 'selected' : ''}"/>>제목</option>
                <option value="C" <c:out value="${pageMaker.cri.type eq 'C' ? 'selected' : ''}"/>>내용</option>
                <option value="W" <c:out value="${pageMaker.cri.type eq 'W' ? 'selected' : ''}"/>>작성자</option>
                <option value="TC" <c:out value="${pageMaker.cri.type eq 'TC' ? 'selected' : ''}"/>>제목 or 내용</option>
                <option value="TW" <c:out value="${pageMaker.cri.type eq 'TW' ? 'selected' : ''}"/>>제목 or 작성자</option>
                <option value="TWC" <c:out value="${pageMaker.cri.type eq 'TWC' ? 'selected' : ''}"/>>제목 or 내용 or 작성자</option>
            </select>
            <input type="text" class="form-search" name="keyword" placeholder="검색하기" value='<c:out value="${pageMaker.cri.keyword}"/>' />
            <input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum}"/>' />
            <input type="hidden" name="amount" value='<c:out value="${pageMaker.cri.amount}"/>' />
            <button id='searchBtn' type="button" class="btn btn-search">검색</button>
            <button id='board-regBtn' type="button" class="btn btn-reg">글 작성하기</button>
        </div>
    </form>
    <!---- //searchForm ---->
    
    <!---- board-center ---->
    <div class="board-center">
        <table class="board-table">
            <tr>
                <th class="bt-1">번호</th>
                <th class="bt-2">제목</th>
                <th class="bt-3">아이디</th>
                <th class="bt-4">작성일</th>
                <th class="bt-5">조회수</th>
            </tr>
            <c:forEach items="${list}" var="board">
                <c:if test="${board.category eq 'Certi'}">
                <tr>
                    <td class="bt-1"><c:out value="${board.bno}" /></td>
                    <td class="bt-2">
                        <a class='move' href='<c:out value="${board.bno}"/>'>
                            <c:out value="${board.title}" />
                            <span>[ <c:out value="${board.replyCnt}" /> ]</span>
                        </a>
                    </td>
                    <td class="bt-3"><c:out value="${board.writer}" /></td>
                    <td class="bt-4"><fmt:formatDate pattern="yyyy-MM-dd" value="${board.regdate}" /></td>
                    <td class="bt-5"><c:out value="${board.hit}" /></td>
                </tr>
                </c:if>
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
	<form id='actionForm' action="/board/board-listCerti" method='get'>
		<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
		<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
        <input type='hidden' name='type' value='<c:out value="${pageMaker.cri.type}"/>'>
        <input type='hidden' name='keyword' value='<c:out value="${pageMaker.cri.keyword}"/>'>
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