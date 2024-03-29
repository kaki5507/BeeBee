<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ include file="/WEB-INF/views/admin/admin-header.jsp" %>

<div class="admin-wrap">
    <!---- admin-contents ---->
    <div class="admin-contents">
        <h2>관리자 홈</h2>
        <!--- contents-menu --->
        <ul class="contents-menu">
            <!-- 회원 관리 -->
            <li>
                <a href="#">
                    <div class="menu-img"><i class="fas fa-user-tie"></i></div>
                    <div class="menu-info">회원 관리</div>
                </a>
            </li>
            <!-- 게시판 관리 -->
            <li>
                <a href="#">
                    <div class="menu-img"><i class="fas fa-chalkboard"></i></div>
                    <div class="menu-info">게시판 관리</div>
                </a>
            </li>
            <!-- 재고 관리 -->
            <li>
                <a href="#">
                    <div class="menu-img"><i class="fas fa-dolly-flatbed"></i></div>
                    <div class="menu-info">재고 관리</div>
                </a>
            </li>
            <!-- 쿠폰 관리 -->
            <li>
                <a href="#">
                    <div class="menu-img"><i class="fas fa-gifts"></i></div>
                    <div class="menu-info">쿠폰 관리</div>
                </a>
            </li>
            <!-- 할인 관리 -->
            <li>
                <a href="#">
                    <div class="menu-img"><i class="fas fa-tags"></i></div>
                    <div class="menu-info">할인 관리</div>
                </a>
            </li>
            <!-- 적립금 관리 -->
            <li>
                <a href="#">
                    <div class="menu-img"><i class="fas fa-donate"></i></div>
                    <div class="menu-info">적립금 관리</div>
                </a>
            </li>
            <!-- 비속어 관리 -->
            <li>
                <a href="#">
                    <div class="menu-img"><i class="fas fa-comment-slash"></i></div>
                    <div class="menu-info">비속어 관리</div>
                </a>
            </li>
        </ul>
        <!--- .contents-menu --->
    </div>
    <!---- admin-contents ---->
    <div class="admin-contents-side">
        <%@ include file="/WEB-INF/views/admin/admin-sidemenu.jsp" %>
    </div>
</div>