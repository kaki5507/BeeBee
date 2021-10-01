<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="../../../resources/main/js/index.js"></script>
<link rel="stylesheet" href="../../../resources/main/css/index.css">

<div class="main">
    <!-- 슬라이드 -->
    <div class="main_contents_list main_slide">
        <input type="radio" name="slide" id="slide01" checked>
        <input type="radio" name="slide" id="slide02">
        <input type="radio" name="slide" id="slide03">
        <div class="slidewrap">
            
            <ul class="slidelist">
                <!-- 슬라이드 영역 -->
                <li class="slideitem">
                    <a class="slideitem01" href="https://leetcode.com/problemset/algorithms/">
                        <div class="textbox">
                            <h3>어떻게 공부해야 되지?</h3>
                            <p>리트코드를 이용해서 알고리즘을 풀어보아요🧡</p>
                        </div>
                        <img src="../../../resources/main/img/slide_menu01.png" alt="슬라이드 메뉴1">
                    </a>
                </li>
                <li class="slideitem">
                    <a class="slideitem02" href="https://w-giraffe.tistory.com/">
                        <div class="textbox">
                            <h3>티스토리</h3>
                            <p>공부한 내용을 정리하며 성장해요</p>
                        </div>
                        <img src="../../../resources/main/img/slide_menu02.png" alt="슬라이드 메뉴2">
                    </a>
                </li>
                <li class="slideitem">
                    <a class="slideitem03" href="https://cafe.naver.com/chil9chil9line">
                        <div class="textbox">
                            <h3>스터디 커뮤니케이션 (Study Communication)</h3>
                            <p>자격증 정보를 공유하며 스터디를 매칭해요</p>
                        </div>
                        <img src="../../../resources/main/img/slide_menu03.png" alt="슬라이드 메뉴3">
                    </a>
                </li class="slideitem">
    
                <!-- 좌,우 슬라이드 버튼 -->
                <div class="slide-control">
                    <div>
                        <label for="slide03" class="left"></label>
                        <label for="slide02" class="right"></label>
                    </div>
                    <div>
                        <label for="slide01" class="left"></label>
                        <label for="slide03" class="right"></label>
                    </div>
                    <div>
                        <label for="slide02" class="left"></label>
                        <label for="slide01" class="right"></label>
                    </div>
                </div>
    
            </ul>
            <!-- 페이징 -->
            <ul class="slide-pagelist">
                <li><label for="slide01">리트코드</label></li>
                <li><label for="slide02">티스토리</label></li>
                <li><label for="slide03">스터디</label></li>
            </ul>
        </div>
    </div>
    <!-- // .main_contents_list -->

    <!-- 등급 소개 -->
    <div class="main_contents_list">
        <div class="rate_about">
            <ul class="rate_kinds">
                <li class="rate_level">
                    <div class="level_img">
                        <div class="level_img_cir"><img class=".bee_img" src="../../../resources/main/img/Bee-kinds/b-bee.png" alt=""></div>
                    </div>
                    <!-- // .level_img_cir -->
                    <div class="level_explain">
                        <dl>
                            <dt>아기벌</dt>
                            <dd>게시글 0개</dd>
                            <dd>댓글 0개</dd>
                            <dd>방문수 1회</dd>
                        </dl>
                    </div>
                    <!-- // .level_explain-->
                </li>
                <li class="rate_level">
                    <div class="level_img">
                        <div class="level_img_cir"><img class=".bee_img" src="../../../resources/main/img/Bee-kinds/s-bee.png" alt=""></div>
                    </div>
                    <!-- // .level_img_cir -->
                    <div class="level_explain">
                        <dl>
                            <dt>청소년벌</dt>
                            <dd>게시글 3개</dd>
                            <dd>댓글 5개</dd>
                            <dd>방문수 50회</dd>
                        </dl>
                    </div>
                    <!-- // .level_explain-->
                </li>
                <li class="rate_level">
                    <div class="level_img">
                        <div class="level_img_cir"><img class=".bee_img" src="../../../resources/main/img/Bee-kinds/g-bee.png" alt=""></div>
                    </div>
                    <!-- // .level_img_cir -->
                    <div class="level_explain">
                        <dl>
                            <dt>꿀벌</dt>
                            <dd>게시글 10개</dd>
                            <dd>댓글 100개</dd>
                            <dd>방문수 100회</dd>
                        </dl>
                    </div>
                    <!-- // .level_explain-->
                </li>
                <li class="rate_level">
                    <div class="level_img">
                        <div class="level_img_cir"><img class=".bee_img" src="../../../resources/main/img/Bee-kinds/p-bee.png" alt=""></div>
                    </div>
                    <!-- // .level_img_cir -->
                    <div class="level_explain">
                        <dl>
                            <dt>여왕벌</dt>
                            <dd>게시글 50개</dd>
                            <dd>댓글 500개</dd>
                            <dd>방문수 2000회</dd>
                        </dl>
                    </div>
                    <!-- // .level_explain-->
                </li>
                <li class="rate_level">
                    <div class="level_img">
                        <div class="level_img_cir"><img class=".bee_img" src="../../../resources/main/img/Bee-kinds/d-bee.png" alt=""></div>
                    </div>
                    <!-- // .level_img_cir -->
                    <div class="level_explain">
                        <dl>
                            <dt>장수말벌</dt>
                            <dd>게시글 200개</dd>
                            <dd>댓글 2000개</dd>
                            <dd>방문수 5000회</dd>
                        </dl>
                    </div>
                    <!-- // .level_explain-->
                </li>
            </ul>
            <!-- // .rate_kinds -->
        </div>
        <!-- // .rate_about -->
    </div>
    <!-- // .main_contents_list -->

    <!-- 게시판 -->
    <div class="main_contents_list">
        <div class="board_peek">
            <div class="board_peek_study">
                <h3>시간 인증</h3>
                <table>
                    <thead>
                        <tr>
                            <th>제목</th>
                            <th>내용</th>
                            <th>아이디</th>
                            <th>1시간 전 이런식으로</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>제목 thy</td>
                            <td>내용 thy</td>
                            <td>아이디 thy</td>
                            <td>시간 thy</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- // .board_peek_study -->

            <div class="board_peek_free">
                <h3>자유게시판</h3>
                <table>
                    <thead>
                        <tr>
                            <th>제목</th>
                            <th>내용</th>
                            <th>아이디</th>
                            <th>1시간 전 이런식으로</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>제목 thy</td>
                            <td>내용 thy</td>
                            <td>아이디 thy</td>
                            <td>시간 thy</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <!-- // .board_peek_free -->
        </div>
        <!-- // .board_peek-->
    </div>
    <!-- // .main_contents_list -->

    <!-- 웹 소개 -->
    <div class="main_contents_list">
        <div class="web_about">
            <img src="../../../resources/main/img/main-first.PNG" alt="">
            <img src="../../../resources/main/img/main-third-group.PNG" alt="">
            <img src="../../../resources/main/img/main-third-chat.PNG" alt="">
            <div class="web_about_info">
                <p class="web_about_info_p">Study Application</p>
                <span class="web_about_info_span">스터디 어플을 이용해서<br>더욱 편안하게</span>
            </div>
        </div>
        <!-- // .web_about -->
    </div>
    <!-- // .main_contents_list -->
</div>
<!------ // .main ------>
<%@ include file="/WEB-INF/views/common/footer.jsp" %> 