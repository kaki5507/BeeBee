<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>    

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta content="yes" name="apple-mobile-web-app-capable" />  
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
    <meta author="name" content="kaki">
    <meta name="description" content="beebee study-matching">
    <meta name="keywords" content="study crud">
    <meta name="copyright" content="kaki5507">
    <title>main</title>
        <link rel="preconnect" href="https://fonts.gstatic.com"> <!-- 구굴 웹 폰트 더 빠르게 (?) 연결 하기 위함 주석 처리로 테스트  -->
        <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet"> <!-- 구글 웹 폰트 -->
        <link rel="stylesheet" href="../../../resources/common/css/default.css"> <!-- 기본 css -->
        <link rel="stylesheet" href="../../../resources/common/css/header.css">
        <link rel="stylesheet" href="../../../resources/common/css/footer.css">
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" crossorigin="anonymous">
</head>
<body>
<!---- gnb ---->
<div class="gnb">
    <div class="wrap">
        <!-- h1 -->
        <h1><a href="<c:url value='/home'/>"><img src="../../../resources/common/img/beelogo.png" alt="로고"></a></h1>
        <section id="fixed-bar-search">
            <div class="search-input-wrap">
                <span class="search-info">검색</span>
                <input type="text" name="header-search-input" id="header-search-input" class="fixed-search-input" placeholder="검색어를 입력해보세요!">
            </div>
        </section>
        <nav>
            <div class="side-btn"><img src="../../../resources/common/img/menu-1.png" alt="menu"></div>
            <!-- big menu-->
            <ul class="menu">
                <li>
                    <a href="<c:url value='/board/board-list'/>">게 시 판</a>
                    <ul class="d-menu">
                        <li><a href="#">공부 인증</a></li>
                        <li><a href="#">자유게시판</a></li>
                        <li><a href="#">질문게시판</a></li>
                        <li><a href="#">자격증</a></li>
                    </ul>
                </li>
                <sec:authorize access="isAnonymous()">
                <li><a href="<c:url value='/register/register-welcome'/>">회원가입</a></li>
                	
                <li>
                    <a href="<c:url value='/login/login-custom'/>">로그인</a>
                </li>
                </sec:authorize>
                
                <sec:authorize access="isAuthenticated()">
                <form class="logoutForm" action="/login/logout" method="post">    
                <li class="userInfo-wrap">
                    <button type="button" class="userNameBtn" onclick="userInfo()"><sec:authentication property="principal.member.userNickName"/>님</a>
                    <ul id="userInfo-menu">
                        <li><a href="#">알림</a></li>
                        <li>
                            <a class="btnLogout">로그아웃</li>
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                        </li>
                    </ul>
                </form>
                </sec:authorize>
            </ul>
            
        </nav>

        <form class="side-menu-form">
            <div class="side-menu-wrap">
                <nav class="side-menu">
                    <ul>
                        <li><a href="<c:url value='/home'/>">비비 홈</a></li>
                        <li><a href="<c:url value='/board/board-list'/>">게시판</a></li>
                    </ul>
                    
                    <div class="side-menu-log-wrap">
                        <sec:authorize access="isAnonymous()">
                            <a class="side-menu-log" href="<c:url value='/login/login-custom'/>">로그인</a>
                        </sec:authorize>
                        <sec:authorize access="isAuthenticated()">
                            <sec:authentication property="principal.member.userNickName"/>님
                            <a class="side-menu-log btnLogout">로그아웃</a>
                        </sec:authorize>
                    </div>

                </nav>
            </div>
        </form>
    </div>
</div>
<!---- //gnb ---->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script>
    $(document).ready(function(){
        $(".btnLogout").on("click",function(){
            $(".logoutForm").submit();
        });
    });
</script>