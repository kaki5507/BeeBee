<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link rel="stylesheet" href="../../../resources/register/css/register-identi.css">

<%@ include file="/WEB-INF/views/common/header.jsp" %>

<!-- input의 oninput은 사용자의 입력을 받으면 실행되는 이벤트. 커서를 다른 곳으로 옮기지 않아도 입력 즉시 DB에서 id를 비교 가능-->

	<!------ reg-identi-wrap -------->
    <div class="reg-identi-wrap">
        <!---- reglevel ---->
        <div class="reglevel">
            <div class="identi-title">
                <img src="../../../resources/register/img/info-bee.png" alt="벌 사진">
                <img src="../../../resources/register/img/info-left.png" alt="더듬이">
                <img src="../../../resources/register/img/info-right.png" alt="날개">
                <img src="../../../resources/register/img/info-q-left.png" alt="왼쪽?">
                <img src="../../../resources/register/img/info-q-middle.png" alt="가운데?">
                <img src="../../../resources/register/img/info-q.right.png" alt="오른쪽?">
                <img src="../../../resources/register/img/info-text.png" alt="정보입력">
            </div>
            <h2>정보 입력</h2>
        </div>
        <!---- //reglevel ---->

        <!---- m-wrap ---->
        <form id="m-wrap" name="mForm" action="/register/register-identi" method="post">
            <p>(<b class="m-must">필수입력</b>)표시된 항목은 필수 입력사항 입니다.</p>

            <!-- id-wrap -->
            <div class="id-wrap">
                <label for="email">비비ID<b class="m-must">필수입력</b></label>
                <input type="text" class="info-form" id="email" name="email" maxlength="40" placeholder="비비ID ( 이메일 )" onblur="checkEmail()">
                <button type="button" class="authentic-n">인증번호 발송</button>
                <span id="email_error"></span>
            </div>

            <span>보유하신 <strong>이메일</strong>을 입력해주세요.</span>

            <!-- authen-wrap -->
            <div class="authen-wrap">
                <label for="authen">인증번호<b class="m-must">필수입력</b></label>
                <input type="text" class="info-form" id="authen" name="authen" placeholder="인증번호 입력 ( 유효시간 5분 )" onblur="checkAuthen()">
                <span id="authen_error"></span>
            </div>

            <span><strong>[인증번호 발송]</strong>을 먼저 진행해주세요.</span>

            <!-- name-wrap -->
            <div class="name-wrap">
                <label for="nickName">닉네임<b class="m-must">필수입력</b></label>
                <input type="text" class="info-form" id="nickName" name="nickName" minlength="2" maxlength="20" placeholder="닉네임" onblur="checkNickName()">
                <span id="nickName_error"></span>
            </div>

            <!-- pwd-wrap -->
            <div class="pwd-wrap">
                <label for="pwd">비밀번호<b class="m-must">필수입력</b></label>
                <input type="text" class="info-form" id="pwd" name="pwd" minlength="10" maxlength="16" placeholder="비밀번호" onblur="checkPwd()">
                <span id="pwd_error"></span>
            </div>

            <span>대문자/소문자/숫자/특수문자를 조합하여 10~16자로 입력해주세요.</span>

            <!-- pwdc-wrap -->
            <div class="pwdc-wrap">
                <label for="pwdc">비밀번호 확인<b class="m-must">필수입력</b></label>
                <input type="text" class="info-form" id="pwdc" name="pwdc" minlength="10" maxlength="16" placeholder="비밀번호 확인" onblur="checkPwdc()">
                <span id="pwdc_error"></span>
            </div>

            <span><strong>비밀번호</strong>를 다시 한번 입력해주세요.</span>

            <!-- reg-btn -->
            <div class="reg-btn">
                <button type="button" class="bee-join" id="btn-join" onclick="joinClear();" value="작성완료">NEXT</button>
                <a href="#" class="btn-cancel">CANCEL</a>
            </div>
            <!-- //reg-btn -->
        </form>

    </div>
    <!------ //reg-identi-wrap -------->
    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script defer src="../../../resources/register/js/register-identi.js"></script>