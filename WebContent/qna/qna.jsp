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
	<script>
		function reg(){
			if(!$("#agree").is(":checked")){
				alert("이용약관에 동의해주세요.");
				return false;
			}
		}
	</script>
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
					<li><a href="/InfoList">맛집정보</a>
						<ul>
							<li><a href="/InfoList">맛집정보</a></li>
						</ul>
					</li>
					<li class="on"><a href="/ReviewList">맛집리뷰</a>
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
					<li><a href="#a">맛집정보</a>
						<ul>
							<li><a href="/InfoList">맛집정보</a></li>
						</ul>
					</li>
					<li class="on"><a href="#a">맛집리뷰</a>
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
				<li class="on"><a href="/Qna">고객문의</a></li>
			</ul>
		</div>
		<div id="contents">
			<h3>고객문의<span>고객님의 문의에 정성껏 답변드리겠습니다.</span></h3>
			<ul class="location">
				<li>Home</li>
				<li>고객문의</li>
				<li>고객문의</li>
			</ul>
			<p class="pointTxt3">개인정보보호를 위한 이용자 동의사항</p>
			<div class="agreeBox">
				<div>
					<ul class="dotList">
						<li>개인정보의 수집 이용 목적 – <span>고객문의 내용에 대한 의사소통 경로확보</span></li>
						<li>수집하는 개인정보의 항목 – <span>고객의 이름, 전화번호, 이메일</span></li>
						<li>개인정보의 보유 및 이용 기간 – <span>목적 달성 후 즉시 파기</span></li>
					</ul>
				</div>
				<div class="agree"><input type="checkbox" id="agree"> <label for="agree">위 내용에 대해 동의합니다.</label></div>
			</div>
			<form name="frm" action="/Qna" method="post" onSubmit="return reg()">
				<div class="viewType01 mt45 write">
					<table>
						<caption>고객문의 작성 폼</caption>
						<colgroup>
							<col class="w150px">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th>이름</th>
								<td><input type="text" title="이름 입력란" name="name"></td>
							</tr>
							<tr>
								<th>전화번호</th>
								<td><input type="text" title="전화번호 입력란" name="phone"> <span>예)031-779-9356, 0317799356</span></td>
							</tr>
							<tr>
								<th>이메일</th>
								<td><input type="text" title="이메일 입력란" name="email"></td>
							</tr>
							<tr>
								<th>제목</th>
								<td><input type="text" title="제목 입력란" class="w100" name="title"></td>
							</tr>
							<tr>
								<th>내용</th>
								<td><textarea name="contents" id="" cols="30" rows="5" title="내용 입력란"></textarea></td>
							</tr>
						</tbody>
					</table>
				</div>
				<div class="btnAreaR">
					<input type="submit" class="btn btnSubmit" value="보내기">
					<input type="reset" class="btn btnCancel" value="취소하기">
					<!-- <a href="#a" class="btn btnSubmit" onClick="">보내기</a>
					<a href="#a" class="btn btnCancel">취소하기</a> -->
				</div>
			</form>
		</div>
		<div id="footer">
			<p>COPYRIGHTS 2017 BY HONG ALL RIGHTS RESERVED</p>
		</div>
		<div id="topBtn"><a href="#"><img src="/images/btn/btn_top.png" alt="상단으로 이동" class="over"></a></div>
	</div>
</body>
</html>