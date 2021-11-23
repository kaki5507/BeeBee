<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<link rel="stylesheet" href="../../../resources/login/css/login.css">
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<h1><c:out value="${error}"/></h1>
<h1><c:out value="${logout}"/></h1>

<!------ login-wrap -------->
<form id="login-wrap" name="loginForm" action="/login/login-custom" method="post">
    <img class="checkpoint" src="../../../resources/login/img/checkpoint.png" alt="로그인 검문소">
    <h3>로그인</h3>
    
    <!---- idpass ---->
    <div class="idpass">
        <!-- saveid -->
        <div class="saveid">
            <input type="checkbox" id="chkSaveId" name="remember-me">
            <label for="chkSaveId">비비ID 저장</label>
        </div>
        <!-- //saveid -->

        <!-- login-id -->
        <div class="login-id">
            <label for="email" class="idpwd-label">아이디</label>
            <input type="text" id="email" name="email" class="info-login" placeholder="비비ID(아이디 또는 이메일)를 입력해주세요.">
        </div>
        <!-- //login-id -->

        <!-- login-pwd -->            
        <div class="login-pwd">
            <label for="pwd" class="idpwd-label">비밀번호</label>
            <input type="password" id="pwd" name="pwd" class="info-login" placeholder="비밀번호를 입력해주세요.">
        </div>
        <!-- //login-pwd -->
    </div>
    <!---- //idpass ---->
    
    <!---- btnlogin ---->
    <div class="btnlogin">
        <button type="submit" id="btn-login">비비ID 로그인</button>
    </div>
    <!---- //btnlogin ---->

    <!---- login-menu ---->
    <span class="login-menu">
        <a href="#">비비ID 찾기</a>
        <span>|</span>
        <a href="#">비밀번호 찾기</a>
        <span>|</span>
        <a href="#">비비 회원가입</a>
    </span>
    <!---- //login-menu ---->

    <p class="another">다른 방법으로 로그인</p>

    <!-- login-way -->
    <ul class="login-way">
        <!-- login-way-facebook -->
        <li class="login-way-facebook">
            <a href="#">
                <div class="login-img"><i class="fab fa-facebook"></i></div>
                <div class="login-title">Facebook 로그인</div>
            </a>
        </li>
        <!-- login-way-google -->
        <li class="login-way-google">
            <a href="#">                       
                <div class="login-img"><i class="fab fa-google"></i></div>
                <div class="login-title">Google 로그인</div>
            </a>
        </li>
        <!-- login-way-naver -->
        <li class="login-way-naver">
            <a href="#"> 
                <div class="login-img"><span>N</span></div>
                <div class="login-title">Naver 로그인</div>
            </a>
        </li>
        <!-- login-way-apple -->
        <li class="login-way-apple">
            <a href="#">                   
                <div class="login-img"><i class="fab fa-apple"></i></div>
                <div class="login-title">Apple 로그인</div>
            </a>
        </li>
    </ul>
    <!-- //login-way -->
    
    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
    
</form>
<!------ //login-wrap -------->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script defer src="../../../resources/login/js/login.js"></script>