<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link rel="stylesheet" href="../../../resources/register/css/register-clear.css">

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<!------ reg-clear-wrap -------->
<div class="reg-clear-wrap">
    <h3>회원가입이 완료되었습니다.</h3>
    <div class="clear-bee-home">
        <img src="../../../resources/register/img/bee-home.png" alt="벌집">
        <img src="../../../resources/register/img/bee-fly1.png" alt="벌 나는모습1">
        <img src="../../../resources/register/img/bee-fly2.png" alt="벌 나는모습2">
        <img src="../../../resources/register/img/bee-fly3.png" alt="벌 들어가는 모습">
        <a href="<c:url value='/home'/>">메인으로</a>
    </div>
</div>
<!------ //reg-clear-wrap -------->

<%@ include file="/WEB-INF/views/common/footer.jsp" %>