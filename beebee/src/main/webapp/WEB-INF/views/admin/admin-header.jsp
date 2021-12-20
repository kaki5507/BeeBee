<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta content="yes" name="apple-mobile-web-app-capable" />  
    <meta name="viewport" content="width=device-width, height=device-height, initial-scale=1.0, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
    <meta author="name" content="kaki">
    <meta name="description" content="beebee">
    <meta name="keywords" content="beebee study admin page">
    <meta name="copyright" content="kaki5507">
    <title>main</title>
        <link rel="preconnect" href="https://fonts.gstatic.com"> <!-- 구굴 웹 폰트 더 빠르게 (?) 연결 하기 위함 주석 처리로 테스트  -->
        <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet"> <!-- 구글 웹 폰트 -->
        <link rel="stylesheet" href="../../../resources/common/css/default.css"> <!-- 기본 css -->
        <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.3/css/all.css" crossorigin="anonymous">
        <link rel="stylesheet" href="../../../resources/admin/css/admin-default.css">
</head>
<body>
<div class="admin-header">
    <!---- profile ---->
    <div class="profile">
        <div class="profile-img"></div>
        <div class="profile-info">
            <span>닉네임 : </span>
            <span>등급 : </span>
        </div>
    </div>
    <!---- //.profile ---->
</div>