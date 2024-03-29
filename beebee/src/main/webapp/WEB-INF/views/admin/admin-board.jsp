<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ include file="/WEB-INF/views/admin/admin-header.jsp" %>

<div class="admin-wrap">
    <!------ admin-contents ------>
    <form class="admin-contents" action="/admin/admin-mem" method="post">    
        <h2>게시판 관리</h2>
        <!---- admin-total ---->
        <div class="admin-total">
            <div class="admin-total-info">
                <span>오늘 작성글 : <b>5</b></span>
                <span>주간 작성글 : <b>400</b></span>
                <span>총 게시글 : <b>1000</b></span>
            </div>
            <div class="admin-total-rounge">
                그래프 형태 표시
            </div>
        </div>
        <!---- // .admin-total ---->
        <!---- admin-management ---->
        <!-- <div class="admin-management">
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
                <button id='searchBtn' type="button" class="btn btn-search">검색</button>
            </div> -->
            <!-- admin-table -->
            <table class="admin-table">
                <tr>
                    <th>번호</th>
                    <th>제목</th>
                    <th>닉네임</th>
                    <th>작성일</th>
                    <th>조회수</th>
                    <th>댓글수</th>
                    <th>관리</th>
                </tr>
                <tr>
                    <td>번호 좌라락</td>
                    <td>제목 좌라락</td>
                    <td>닉네임</td>
                    <td>201515151</td>
                    <td>조회수</td>
                    <td>댓글수</td>
                    <td>
                        <button>수정</button>
                        <button>삭제</button>
                    </td>
                </tr>
            </table>
            <!-- //.admin-table -->
        </div>
        <!---- //.admin-management ---->
    </form>
    <!------ //.admin-contents ------>
    <div class="admin-contents-side">
        <%@ include file="/WEB-INF/views/admin/admin-sidemenu.jsp" %>
    </div>
</div>