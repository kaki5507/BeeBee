<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta author="name" content="kaki">
    <meta name="description" content="beebee study-matching">
    <meta name="keywords" content="study crud">
    <meta name="copyright" content="kaki5507">
    <title>login</title>
        <script src="https://use.fontawesome.com/releases/v5.15.2/js/all.js" data-observe-mutations></script><!-- 폰트어썸 -->
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/common/css/default.css">
        <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/login/css/login.css">
</head>
<body>
    <!------ login-wrap -------->
    <form id="login-wrap" name="loginForm" action="#" method="post">
        <img class="checkpoint" src="<%=request.getContextPath() %>resources/login/img/checkpoint.png" alt="로그인 검문소">
        <h3>로그인</h3>
        
        <!---- idpass ---->
        <div class="idpass">
            <!-- saveid -->
            <div class="saveid">
                <input type="checkbox" id="chkSaveId" name="chkSaveId">
                <label for="chkSaveId">비비ID 저장</label>
            </div>
            <!-- //saveid -->

            <!-- login-id -->
            <div class="login-id">
                <label for="beeId" class="idpwd-label">아이디</label>
                <input type="text" id="beeId" class="info-login" placeholder="비비ID(아이디 또는 이메일)를 입력해주세요.">
            </div>
            <!-- //login-id -->

            <!-- login-pwd -->            
            <div class="login-pwd">
                <label for="beePwd" class="idpwd-label">비밀번호</label>
                <input type="text" id="beePwd" class="info-login" placeholder="비밀번호를 입력해주세요.">
            </div>
            <!-- //login-pwd -->
        </div>
        <!---- //idpass ---->
        
        <!---- btnlogin ---->
        <div class="btnlogin">
            <button type="button" id="btn-login">비비ID 로그인</button>
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
        
    </form>
    <!------ //login-wrap -------->
</body>
</html>