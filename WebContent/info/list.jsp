<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>POOK</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi">
	<link rel="stylesheet" type="text/css" href="/css/style.css">
	<link rel="stylesheet" type="text/css" href="/css/jquery.bxslider.css">
	<script type="text/javascript" src="/js/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="/js/common.js"></script>
	<script type="text/javascript" src="/js/ui_common.js"></script>
	<script type="text/javascript" src="/js/jquery.bxslider.js"></script>
	<!--[if lt IE 9]>
		<script src="/js/respond.js"></script>
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
</head>
<body>
	<%
		String words = "";
		if(request.getParameter("words") != null){
			words = request.getParameter("words").toString();
		}
	%>
	<div class="container">
		<div id="header">
			<h1>
				<a href="/main">
					<img src="/images/common/h1.png" alt="POOK">
				</a>
			</h1>
			<ul class="gnb">
				<li>
					<c:if test="${sessionScope.user_id ne null and sessionScope.user_id ne ''}">
						<a href="/Logout">로그아웃</a>
					</c:if>
					<c:if test="${sessionScope.user_id eq null or sessionScope.user_id eq ''}">
						<a href="/Login">로그인</a>
					</c:if>
				</li>
			</ul>
			<div id="topMenu">
				<ul>
					<li class="on"><a href="/InfoList">맛집정보</a>
						<ul>
							<li><a href="/InfoList">맛집정보</a></li>
						</ul>
					</li>
					<li><a href="/ReviewList">맛집리뷰</a>
						<ul>
							<li><a href="/ReviewList">맛집리뷰</a></li>
						</ul>
					</li>
					<li><a href="/Map">맛지도</a>
						<ul>
							<li><a href="/Map">맛지도</a></li>
						</ul>
					</li>
					<li><a href="/CommunityList">맛커뮤니티</a>
						<ul>
							<li><a href="/CommunityList">맛커뮤니티</a></li>
						</ul>
					</li>
					<li><a href="/Qna">고객문의</a>
						<ul>
							<li><a href="/Qna">고객문의</a></li>
						</ul>
					</li>
				</ul>
			</div>
			<div class="gnb_bg"></div>
			<!-- 모바일 메뉴 -->
			<div class="menuBtn"><a href="#">메뉴 열기</a></div>
			<div class="mMenu_bg"></div>
			<div id="mMenu">
				<div class="title">
					<h2>전체 메뉴</h2>
					<c:if test="${sessionScope.user_id ne null and sessionScope.user_id ne ''}">
						<a href="/Logout">로그아웃</a>
					</c:if>
					<c:if test="${sessionScope.user_id eq null or sessionScope.user_id eq ''}">
						<a href="/Login">로그인</a>
					</c:if>
					<a href="#" class="close"><img src="/images/btn/btn_close.png" alt="전체 메뉴닫기"></a>
				</div>
				<ul>
					<li class="on"><a href="#a">맛집정보</a>
						<ul>
							<li><a href="/InfoList">맛집정보</a></li>
						</ul>
					</li>
					<li><a href="#a">맛집리뷰</a>
						<ul>
							<li><a href="/ReviewList">맛집리뷰</a></li>
						</ul>
					</li>
					<li><a href="#a">맛지도</a>
						<ul>
							<li><a href="/Map">맛지도</a></li>
						</ul>
					</li>
					<li><a href="#a">맛커뮤니티</a>
						<ul>
							<li><a href="/CommunityList">맛커뮤니티</a></li>
						</ul>
					</li>
					<li><a href="#a">고객문의</a>
						<ul>
							<li><a href="/Qna">고객문의</a></li>
						</ul>
					</li>
				</ul>
			</div>
		</div>
		<!-- 서브메뉴 -->
		<div id="subMenu">
			<ul>
				<li class="on"><a href="/InfoList">맛집정보</a></li>
			</ul>
		</div>
		<div id="contents">
			<h3>맛집정보<span>다양한 맛집에 대한 정보를 얻을수 있습니다.</span></h3>
			<ul class="location">
				<li>Home</li>
				<li>맛집정보</li>
				<li>맛집정보</li>
			</ul>
			<form name="searchFrm" action="/InfoList" method="get">
				<div class="searchBox">
					<select title="검색 조건 선택" name="conditions">
						<option value="title" <c:if test="${conditions eq 'title'}">selected</c:if>>제목</option>
						<option value="content" <c:if test="${conditions eq 'content'}">selected</c:if>>내용</option>
					</select>
					<span><input type="text" name="words" size="30" title="게시판 내 검색어 입력란" value="${words}"></span>
					<input type="submit" class="btn btnG" value="검색">
				</div>
			</form>
			<div class="cb"></div>
			<ul class="listType img">
				<c:forEach var="boardList" items="${BoardList}">
					<li>
						<div class="img">
							<a href="InfoView">
								<span class="icon_news">new</span>
								<img src="/images/contents/img_no.png" alt="">
							</a>
						</div>
						<div class="txt">
							<a href="info_view.html">${boardList.title}</a>
							<span>${fn:substring(boardList.contents,0,200) }</span>
						</div>
						<div class="date"><span>등록일</span> ${boardList.write_date}</div>
						<div class="cb"></div>
					</li>
				</c:forEach>
			</ul>
			<!-- <div class="dopco_page">
				<a href="#a" class="first"><img src="/images/btn/btn_first.png" alt="첫 페이지 보기"></a>
				<a href="#a"><img src="/images/btn/btn_prev.png" alt="이전 페이지 보기"></a>
				<ul>
					<li class="on"><a href="#">1</a></li>
					<li><a href="#">2</a></li>
					<li><a href="#">3</a></li>
					<li><a href="#">4</a></li>
					<li><a href="#">5</a></li>
				</ul>
				<div class="mTot"><span>/</span> 5</div>
				<a href="#a"><img src="/images/btn/btn_next.png" alt="다음 페이지 보기"></a>
				<a href="#a" class="last"><img src="/images/btn/btn_last.png" alt="마지막 페이지 보기"></a>
			</div> -->
			<c:if test="${sessionScope.user_id ne null and sessionScope.user_id ne ''}">
				<div class="btnAreaR">
					<a href="/InfoWrite" class="btn btnSubmit">글쓰기</a>
				</div>
			</c:if>
		</div>
		<div id="footer">
			<p>COPYRIGHTS 2017 BY HONG ALL RIGHTS RESERVED</p>
		</div>
		<div id="topBtn"><a href="#"><img src="/images/btn/btn_top.png" alt="상단으로 이동" class="over"></a></div>
	</div>
</body>
</html>