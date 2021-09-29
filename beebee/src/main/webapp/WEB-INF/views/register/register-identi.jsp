<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

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
        <form id="m-wrap" name="mForm" action="#" method="post">
            <p>(<b class="m-must">필수입력</b>)표시된 항목은 필수 입력사항 입니다.</p>

            <!-- id-wrap -->
            <div class="id-wrap">
                <label for="mId">비비ID<b class="m-must">필수입력</b></label>
                <input type="text" class="info-form" id="mId" name="mId" maxlength="40" placeholder="비비ID ( 이메일 )">
                <button type="button" class="authentic-n">인증번호 발송</button>
                <span id="mId_error"></span>
            </div>

            <span>보유하신 <strong>이메일</strong>을 입력해주세요.</span>

            <!-- authen-wrap -->
            <div class="authen-wrap">
                <label for="mAuthen">인증번호<b class="m-must">필수입력</b></label>
                <input type="text" class="info-form" id="mAuthen" name="mAuthen" placeholder="인증번호 입력 ( 유효시간 5분 )">
                <span id="mAuthen_error"></span>
            </div>

            <span><strong>[인증번호 발송]</strong>을 먼저 진행해주세요.</span>

            <!-- name-wrap -->
            <div class="name-wrap">
                <label for="mName">닉네임<b class="m-must">필수입력</b></label>
                <input type="text" class="info-form" id="mName" name="mName" maxlength="10" placeholder="닉네임">
                <span id="mName_error"></span>
            </div>

            <!-- pwd-wrap -->
            <div class="pwd-wrap">
                <label for="mPwd">비밀번호<b class="m-must">필수입력</b></label>
                <input type="text" class="info-form" id="mPwd" name="mPwd" minlength="10" maxlength="16" placeholder="비밀번호">
                <span id="mPwd_error"></span>
            </div>

            <span>영문/숫자/특수문자를 조합하여 10~16자로 입력해주세요.</span>

            <!-- pwdc-wrap -->
            <div class="pwdc-wrap">
                <label for="mPwdc">비밀번호 확인<b class="m-must">필수입력</b></label>
                <input type="text" class="info-form" id="mPwdc" name="mPwdc" minlength="10" maxlength="16" placeholder="비밀번호 확인">
                <span id="mPwdc_error"></span>
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
<script defer src="../../../resources/register/js/register-identi.js"></script>