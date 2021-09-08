<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<link rel="stylesheet" href="../../../resources/idpassword/css/idpass.css">


    <!------ fidp-wrap -------->
    <form id="idp-wrap" name="FidpForm" action="#" method="post">

        <h3><img class="find" src="../../../resources/idpassword/img/findidp.png" alt=""></h3>

        <div class="idp-box">   
            <div class="idp-btn">
                <a href="#">아이디 찾기</a>
                <a href="#">비밀번호 찾기</a>
            </div>

            <!-- 이메일 -->
            <div class="email-info idp-info">
                <label for="mId">비비ID</label>
                <input type="text" class="find-form" id="mId" name="mId" maxlength="40" placeholder="비비ID ( 이메일 )">
                <button type="button" class="authentic-n">인증번호 발송</button> <!-- 인증번호 누르면 ★ 다시 발송 ★ 이라고 바뀌게-->
            </div>
            <!-- 인증번호 -->
            <div class="authentic-info idp-info">
                <label for="mAuthen">인증번호</label>                
                <input type="text" class="find-form" id="mAuthen" name="mAuthen" placeholder="인증번호 입력 ( 유효시간 5분 )">
            </div>
            <!-- 확인 -->
            <div class="find-btn">
                <button type="button" class="btn-check" id="idp-clear" onClick="idpclear();" value="찾기">확인</button>
            </div>

        </div>


        
    </form>
    <!------ //fidp-wrap -------->
<%@ include file="/WEB-INF/views/common/footer.jsp" %>