<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>


<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta author="name" content="kaki">
    <meta name="description" content="beebee study-matching">
    <meta name="keywords" content="study crud">
    <meta name="copyright" content="kaki5507">
    <title>main</title>
        <link rel="preconnect" href="https://fonts.gstatic.com">
        <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/common/css/default.css">
        <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/main/css/index.css">  
        <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/common/css/header.css">
        <link rel="stylesheet" href="<%=request.getContextPath() %>/resources/common/css/footer.css">
</head>
<body>
    <%@ include file="/WEB-INF/views/common/header.jsp" %>
    
    <!------ main-wrap ------>
    <div class="main-wrap">
        <!---- home-main-wrap(0) ---->
        <div class="home-main-wrap">
            <div class="first-content main-contents">
                <h2>꿀벌<span>(Bee)</span>처럼<br>부지런하게<span>(Bee)</span>일하자</h2>
                <div class="first-img-wrap">
                    <img src="<%=request.getContextPath() %>/resources/main/img/main-first.PNG" alt="study maching system">
                </div>
            </div>
        </div>
        <!---- //home-main-wrap(0) ---->
        <!---- home-main-wrap(1) ---->
        <div class="home-main-wrap">
            <div class="second-content main-contents">
                <p>간편한 매칭 시스템을 이용한 스터디 모임!</p>
                <div class="second-matching">
                    <img src="<%=request.getContextPath() %>/resources/main/img/Bee-kinds/bee-home.png" alt="bee-home" class="bee-home">
                    <div class="bee-left-fly">
                        <img src="<%=request.getContextPath() %>/resources/main/img/Bee-kinds/b-bee.png" alt="bronze-bee" class="bee-flying">
                        <img src="<%=request.getContextPath() %>/resources/main/img/Bee-kinds/b-bee.png" alt="bronze-bee" class="bee-flying">
                        <img src="<%=request.getContextPath() %>/resources/main/img/Bee-kinds/b-bee.png" alt="bronze-bee" class="bee-flying">
                    </div>
                    <div class="bee-right-fly">
                        <img src="<%=request.getContextPath() %>/resources/main/img/Bee-kinds/b-bee.png" alt="bronze-bee" class="bee-flying">
                        <img src="<%=request.getContextPath() %>/resources/main/img/Bee-kinds/b-bee.png" alt="bronze-bee" class="bee-flying">
                        <img src="<%=request.getContextPath() %>/resources/main/img/Bee-kinds/b-bee.png" alt="bronze-bee" class="bee-flying">
                    </div>
                </div>
            </div>
        </div>
        <!---- //home-main-wrap(1) ---->
        <!---- home-main-wrap(2) ---->
        <div class="home-main-wrap">
            <div class="third-content main-contents">
                <p>비비톡으로 스터디원과의 빠른 연락</p>
                <div class="third-contents-info">
                    <div class="third-contents">
                        <img src="<%=request.getContextPath() %>/resources/main/img/main-third-chat.PNG" alt="비비톡">
                        <span>공부 인증</span>
                        <img src="<%=request.getContextPath() %>/resources/main/img/main-third-group.PNG" alt="그룹 정보">
                        <span>실시간 달성률</span>
                    </div>
                </div>
            </div>
        </div>
        <!---- //home-main-wrap(2) ---->
        <!---- home-main-wrap(3) ---->
        <div class="home-main-wrap">
            <div class="fourth-content main-contents">
                <h3>벌 등급 소개</h3>
                <div class="bee-kinds">
                    <div class="bee-info"><img src="<%=request.getContextPath() %>/resources/main/img/Bee-kinds/b-bee.png" alt="bronze-bee"></div>
                    <div class="bee-info"><img src="<%=request.getContextPath() %>/resources/main/img/Bee-kinds/s-bee.png" alt="silver-bee"></div>
                    <div class="bee-info"><img src="<%=request.getContextPath() %>/resources/main/img/Bee-kinds/g-bee.png" alt="gold-bee"></div>
                    <div class="bee-info"><img src="<%=request.getContextPath() %>/resources/main/img/Bee-kinds/p-bee.png" alt="platinum-bee"></div>
                    <div class="bee-info"><img src="<%=request.getContextPath() %>/resources/main/img/Bee-kinds/d-bee.png" alt="diamond-bee"></div>
                </div>
                <div class="bee-kinds-guide">
                    <dl class="bee-tier">
                        <dt>벌</dt>
                        <dd>
                            <table>
                                <thead>
                                    <tr>
                                        <th>등급</th>
                                        <td><span class="tier-color">BRONZE</span></td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th>스터디 완료</th>
                                        <td>없음</td>
                                    </tr>
                                    <tr>
                                        <th>시간 인증</th>
                                        <td>없음</td>
                                    </tr>
                                </tbody>
                            </table>
                        </dd>
                    </dl>
                    <dl class="bee-tier">
                        <dt>꿀벌</dt>
                        <dd>
                            <table>
                                <thead>
                                    <tr>
                                        <th>등급</th>
                                        <td><span class="tier-color">SILVER</span></td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th>스터디 완료</th>
                                        <td>5회 이상</td>
                                    </tr>
                                    <tr>
                                        <th>시간 인증</th>
                                        <td>100회 이상</td>
                                    </tr>
                                </tbody>
                            </table>
                        </dd>
                    </dl>
                    <dl class="bee-tier">
                        <dt>땅벌</dt>
                        <dd>
                            <table>
                                <thead>
                                    <tr>
                                        <th>등급</th>
                                        <td><span class="tier-color">GOLD</span></td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th>스터디 완료</th>
                                        <td>10회 이상</td>
                                    </tr>
                                    <tr>
                                        <th>시간 인증</th>
                                        <td>200회 이상</td>
                                    </tr>
                                </tbody>
                            </table>
                        </dd>
                    </dl>
                    <dl class="bee-tier">
                        <dt>여왕벌</dt>
                        <dd>
                            <table>
                                <thead>
                                    <tr>
                                        <th>등급</th>
                                        <td><span class="tier-color">DIAMOND</span></td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th>스터디 완료</th>
                                        <td>30회 이상</td>
                                    </tr>
                                    <tr>
                                        <th>시간 인증</th>
                                        <td>500회 이상</td>
                                    </tr>
                                </tbody>
                            </table>
                        </dd>
                    </dl>
                    <dl class="bee-tier">
                        <dt>장수말벌</dt>
                        <dd>
                            <table>
                                <thead>
                                    <tr>
                                        <th>등급</th>
                                        <td><span class="tier-color">MASTER</span></td>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <th>스터디 완료</th>
                                        <td>50회 이상</td>
                                    </tr>
                                    <tr>
                                        <th>시간 인증</th>
                                        <td>1000회 이상</td>
                                    </tr>
                                </tbody>
                            </table>
                        </dd>
                    </dl>
                </div>
            </div>
        </div>
        <!---- //home-main-wrap(3) ---->
        <!---- home-main-wrap(4) ---->
        <div class="home-main-wrap">
            <div class="fifth-content main-contents">
                <h4>스터디 매칭 하러가기</h4>
                <button class="study-matching">START</button>
            </div>
        </div>
        <!---- //home-main-wrap(4) ---->        
    </div>
    <!------ //main-wrap ------>
    
    <%@ include file="/WEB-INF/views/common/footer.jsp" %>
</body>
</html>