<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!---- gnb ---->
<div class="gnb">
    <div class="wrap">
        <!-- h1 -->
        <h1><a href="#"><img src="<%=request.getContextPath() %>/resources/common/img/beelogo.png" alt="로고"></a></h1>
        <section id="fixed-bar-search">
            <div class="search-input-wrap">
                <span class="search-info">검색</span>
                <input type="text" name="header-search-input" id="header-search-input" class="fixed-search-input" placeholder="검색어를 입력해보세요!">
            </div>
        </section>
        <nav>
            <!-- big menu-->
            <ul class="menu">
                <li>
                    <a onclick="">게 시 판</a>
                    <ul class="d-menu">
                        <li><a href="#">공부 인증</a></li>
                        <li><a href="#">자유게시판</a></li>
                        <li><a href="#">질문게시판</a></li>
                        <li><a href="#">자격증</a></li>
                    </ul>
                </li>
                <li>
                    <a onclick="">스터디 매칭</a>
                    <ul class="d-menu">
                        <li><a href="#">정보처리기사</a></li>
                        <li><a href="#">정보처리산업기사</a></li>
                        <li><a href="#">컴퓨터활용능력</a></li>
                        <li><a href="#">팀 포트폴리오</a></li>
                    </ul>
                </li>
                <li class="beetalk"><a onclick="">비비 톡</a></li>
                <li>
                    <a href="#">내 정보</a>
                    <ul class="d-menu">
                        <li><a href="#">알림</a></li>
                        <li><a href="#">매칭 팀 :</a></li>
                        <li><a href="#">내 등급 :</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
    </div>
</div>
<!---- //gnb ---->