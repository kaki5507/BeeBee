<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" href="../../../resources/common/css/default.css">
<link rel="stylesheet" href="../../../resources/common/css/custom404.css">
	
    <div class="notFoundWrap">
        <img src="../../../resources/common/img/404bee.png" alt="404image">
        <h1>페이지를 <em>찾을 수 없습니다.</em></h1>
        <p>
            페이지가 존재하지 않거나, 사용할 수 없는 페이지입니다.
            입력하신 주소가 정확한지 다시 한번 확인해 주시기 바랍니다.
        </p>
        <div class="movePage">
            <a href="javascript:history.back();">이전 화면</a>
            <a href="<c:url value='/home'/>">홈으로 가기</a>
        </div>
    </div>