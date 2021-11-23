<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>    

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
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
                <c:if test="${sessionScope.login_info eq null}"><!-- eq 같으면 참 -->
                <li><a href="<c:url value='/register/register-welcome'/>">회원가입</a></li>
                	
                <li>
                    <a href="<c:url value='/login/login-custom'/>">로그인</a>
                </li>
                </c:if>
                
                <c:if test="${sessionScope.login_info ne null}"><!-- ne는 반대이면 참 -->
                <li>
                    <a href="#">${member.nickName }님</a>
                    <ul class="d-menu">
                        <li><a href="#">알림</a></li>
                        <li><a href="<c:url value='/login/logout'/>">로그아웃</a></li>
                    </ul>
                </li>
                </c:if>
            </ul>
            
        </nav>

        <form action="" class="side-menu-form">
            <div class="side-menu-wrap">
                <nav class="side-menu">
                    <ul>
                        <li><a href="../main/index.html">비비 홈</a></li>
                        <li><a href="../main/index.html">게시판</a></li>
                        <li><a href="../main/index.html">스터디매칭</a></li>
                        <li><a href="../main/index.html">비비 톡</a></li>
                        <li><a href="../main/index.html">내 정보</a></li>
                    </ul>
                    
                    <div>
                        <h2>로그인, 로그아웃</h2>
                    </div>
                </nav>
            </div>
        </form>
    </div>
</div>
<!---- //gnb ---->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>