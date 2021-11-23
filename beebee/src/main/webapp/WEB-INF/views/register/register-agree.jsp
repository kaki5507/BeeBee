<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<link rel="stylesheet" href="../../../resources/register/css/register-agree.css">
 
<script defer src="../../../resources/register/js/register-agree.js"></script>

<!------ ag-wrap -------->
<form id="ag-wrap" name="agForm" action="#" method="post">
    
    <!---- reglevel ---->
    <div class="reglevel">
        <img class="agree" src="../../../resources/register/img/agree.png" alt="약관 동의">
        <h2>이용 약관</h2>
    </div>
    <!---- //reglevel ---->

    <!---- reg-ag ---->
    <div class="reg-ag">
        <!-- all-chk-wrap -->
        <div class="all-chk-wrap">
            <input type="checkbox" id="all-chk" value="전체선택" onclick="allCheck(this);">
            <label for="all-chk">
                비비 서비스 이용약관, 개인정보 수집 및 이용, 유효기간 5년(선택),<br>
                이벤트 등 프로모션 안내 메일 수신(선택)에 <strong>모두 동의</strong>합니다.
            </label>
        </div>
        <!-- //all-chk-wrap -->

        <!-- serv-chk-wrap -->
        <div class="serv-chk-wrap">
            <input type="checkbox" id="serv-chk" value="비비 서비스 이용약관 동의" name="agree-list">
            <label for="serv-chk">비비 서비스 이용약관 동의</label>
            <div class="serv-agree-info">
                <%@ include file="/WEB-INF/views/register/stipulation/service.jsp" %>
            </div>
        </div>
        <!-- //serv-chk -->

        <!-- priv-chk-wrap -->
        <div class="priv-chk-wrap">
            <input type="checkbox" id="priv-chk" value="개인정보 수집 및 이용 동의" name="agree-list">
            <label for="priv-chk">개인정보 수집 및 이용 동의</label>
            <div class="serv-agree-info">
                <%@ include file="/WEB-INF/views/register/stipulation/privacy.jsp" %>
            </div>
        </div>
        <!-- //priv-chk-wrap -->

        <!-- valid-chk-wrap -->
        <div class="valid-chk-wrap">
            <input type="checkbox" id="valid-chk" value="개인정보 유효기간 5년" name="agree-list">
            <label for="valid-chk"><span class="ag-choose">(선택)</span>개인정보 유효기간을 5년으로 선택합니다.</label>
            <span>선택하지 않으시면 1년으로 설정됩니다.<a class="valid-detail">자세히보기</a></span>
        </div>
        <!-- //valid-chk-wrap -->

        <!-- event-chk-wrap -->
        <div class="event-chk-wrap">
            <input type="checkbox" id="event-chk" value="이벤트, 프로모션" name="agree-list">
            <label for="event-chk"><span class="ag-choose">(선택)</span>이벤트 등 프로모션 안내 메일을 수신합니다.</label>
        </div>
        <!-- //event-chk-wrap -->
    </div>
    <!---- //reg-ag ---->

    <!---- reg-btn ---->
    <div class="reg-btn">
        <button type="button" onclick="nextClick();">NEXT</button>
    </div>
    <!---- //reg-btn ---->
</form>
<!------ //ag-wrap -------->

<%@ include file="/WEB-INF/views/common/footer.jsp" %>