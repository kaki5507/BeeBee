<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<nav class="admin-sidemenu">
    <ul>
        <li><a href="<c:url value='/admin/admin-mem'/>">회원 관리</a></li>
        <li><a href="<c:url value='/admin/admin-board'/>">게시판 관리</a></li>
        <li><a href="<c:url value='/admin/admin-stock'/>">재고 관리</a></li>
        <li><a href="<c:url value='/admin/admin-coupon'/>">쿠폰 관리</a></li>
        <li><a href="<c:url value='/admin/admin-sale'/>">할인 관리</a></li>
        <li><a href="<c:url value='/admin/admin-stamp'/>">적립금 관리</a></li>
        <li><a href="<c:url value='/admin/admin-slang'/>">비속어 관리</a></li>
    </ul>
</nav>