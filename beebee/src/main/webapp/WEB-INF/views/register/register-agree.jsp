<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<link rel="stylesheet" href="../../../resources/register/css/register-agree.css">
 
<script defer src="../../../resources/register/js/register-agree.js"></script>
<!-- 그냥 script만 설정해주면 parsing HTML fetching js executing js 식으로 실행되는데 이러면 
     단점은 사용자가 기본적인 html은 빨리 볼 수 있는데, javscript에 의존적이면 js가 늦게 들어와서
     피칭하는 시간(실행하는 시간) 을 기다려야 된다.

     asyn 설정해주면 html을 파싱하다가 병렬로 asyn을 확인하고, 다운로드하자 해놓고 다운로드가 다되면
     다시 실행주는 방식 피칭하는 시간을 아낄수는 있지만, html이 되면서 js가 실행되기 때문에
     html이 중간만 뿌려지는 상태에서 js가 뿌려질 수 있음.

     defer 은 가장 좋은 옵션인거 같고 html파일을 다 파싱해주고 그다음에 js를 실행 시키는 방법
     asyn 는 순서에 상관없이 다운로드가 빨리 된거 부터 피칭이 되기 때문에 defer을 이용하면
     순서대로 할 수 있어서 defer을 쓰는게 효과적!!
-->

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
            <iframe src="register/stipulation/service.html"  title="비비 서비스 이용약관" frameborder="0"></iframe>
        </div>
        <!-- //serv-chk -->

        <!-- priv-chk-wrap -->
        <div class="priv-chk-wrap">
            <input type="checkbox" id="priv-chk" value="개인정보 수집 및 이용 동의" name="agree-list">
            <label for="priv-chk">개인정보 수집 및 이용 동의</label>
            <iframe src="register/stipulation/privacy.html" frameborder="0"></iframe>
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
        <a href="<c:url value='/register/register-identi'/>">NEXT</a>
    </div>
    <!---- //reg-btn ---->
</form>
<!------ //ag-wrap -------->

<%@ include file="/WEB-INF/views/common/footer.jsp" %>
 