<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<link rel="stylesheet" href="../../../resources/register/css/register-welcome.css">

 <%@ include file="/WEB-INF/views/common/header.jsp" %>
 
<!------ reg-wrap -------->
<form id="reg-wrap" name="regForm" action="#" method="get">
    <!---- reglevel ---->
    <div class="reglevel">
        <img class="welcome" src="../../../resources/register/img/welcome.png" alt="환영이미지">
        <h2>비비에 오신 것을 환영합니다!</h2>
        <h3>비비 회원가입 방식을 선택해주세요.</h3>
        <!-- reg-way -->
        <ul class="reg-way">
            <!-- reg-way-email -->
            <li class="reg-way-email">
                <a href="<c:url value='/register/register-agree'/>" id="reg-m">
                    <div class="way-img"><i class="fas fa-envelope"></i></div>
                    <div class="way-title">이메일로 회원가입</div>
                    <div class="way-explain">이메일ID 와 비밀번호로 비비 회원가입</div>
                </a>
            </li>
            <!-- reg-way-facebook -->
            <li class="reg-way-facebook">
                <a href="#">
                    <div class="way-img"><i class="fab fa-facebook"></i></div>
                    <div class="way-title">Facebook으로 회원가입</div>
                    <div class="way-explain">페이스북으로 인증하여 비비 회원가입</div>
                </a>
            </li>
            <!-- reg-way-google -->
            <li class="reg-way-google">
                <a href="#">                       
                    <div class="way-img"><i class="fab fa-google"></i></div>
                    <div class="way-title">Google로 회원가입</div>
                    <div class="way-explain">구글로 인증하여 비비 회원가입</div>
                </a>
            </li>
            <!-- reg-way-naver -->
            <li class="reg-way-naver">
                <a href="#"> 
                    <div class="way-img"><span>N</span></div>
                    <div class="way-title">Naver로 회원가입</div>
                    <div class="way-explain">네이버로 인증하여 비비 회원가입</div>
                </a>
            </li>
            <!-- reg-way-apple -->
            <li class="reg-way-apple">
                <a href="#">                   
                    <div class="way-img"><i class="fab fa-apple"></i></div>
                    <div class="way-title">Apple로 회원가입</div>
                    <div class="way-explain">애플로 인증하여 비비 회원가입</div>
                </a>
            </li>
        </ul>
        <!-- //reg-way -->
    </div>
    <!---- //reglevel ---->
</form>
<!------ //reg-wrap -------->