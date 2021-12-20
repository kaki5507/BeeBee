<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ include file="/WEB-INF/views/admin/admin-header.jsp" %>

<div class="admin-wrap">
    <!------ admin-contents ------>
    <form class="admin-contents" action="/admin/admin-mem" method="post">    
        <h2>회원 관리</h2>
        <!---- admin-total ---->
        <div class="admin-total">
            <div class="admin-total-info">
                <span>오늘 가입 : <b><c:out value="${memToday}"/></b></span>
                <span>주간 가입 : <b><c:out value="${memWeek}"/></b></span>
                <span>총 회원 수 : <b><c:out value="${memToTal}"/></b></span>
            </div>
            <div class="admin-total-rounge">
                그래프 형태 표시
            </div>
        </div>
        <!---- // .admin-total ---->
        <!---- admin-management ---->
        <div class="admin-management">
            <div class="searchBar">
                <select name="type" class="type-search">
                    <option value="" <c:out value="${pageMaker.cri.type == null ? 'selected' : ''}"/>>--</option>
                    <option value="E" <c:out value="${pageMaker.cri.type eq 'E' ? 'selected' : ''}"/>>이메일</option>
                    <option value="N" <c:out value="${pageMaker.cri.type eq 'N' ? 'selected' : ''}"/>>닉네임</option>
                    <option value="R" <c:out value="${pageMaker.cri.type eq 'R' ? 'selected' : ''}"/>>가입일</option>
                    <option value="G" <c:out value="${pageMaker.cri.type eq 'G' ? 'selected' : ''}"/>>등급</option>
                    <option value="EN" <c:out value="${pageMaker.cri.type eq 'EN' ? 'selected' : ''}"/>>이메일 or 닉네임</option>
                    <option value="ENRU" <c:out value="${pageMaker.cri.type eq 'ENRU' ? 'selected' : ''}"/>>통합 검색</option>
                </select>
                <input type="text" class="form-search" name="keyword" placeholder="검색하기" value='<c:out value="${pageMaker.cri.keyword}"/>' />
                <button id='searchBtn' type="button" class="btn btn-search">검색</button>
            </div>
            <!-- admin-table -->
            <table class="admin-table">
                <tr>
                    <th>이름</th>
                    <th>이메일</th>
                    <th>휴대폰번호</th>
                    <th>가입 일</th>
                    <th>등급</th>
                    <th>관리</th>
                </tr>
                <tr>
                    <td>이름 좌라락</td>
                    <td>이메일 좌라락</td>
                    <td>010</td>
                    <td>201515151</td>
                    <td>꿀벌</td>
                    <td>
                        <button>수정</button>
                        <button>탈퇴</button>
                    </td>
                </tr>
                <tr>
                    <td>이름 좌라락</td>
                    <td>이메일 좌라락</td>
                    <td>010</td>
                    <td>201515151</td>
                    <td>꿀벌</td>
                    <td>
                        <button>수정</button>
                        <button>탈퇴</button>
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