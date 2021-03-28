<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>POOK</title>
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi">
	<link rel="stylesheet" type="text/css" href="/css/style_main.css">
	<link rel="stylesheet" type="text/css" href="/css/jquery.bxslider.css">
	<script type="text/javascript" src="/js/jquery-1.10.2.min.js"></script>
	<script type="text/javascript" src="/js/common.js"></script>
	<script type="text/javascript" src="/js/ui_common.js"></script>
	<script type="text/javascript" src="/js/jquery.bxslider.js"></script>
	<!--[if lt IE 9]>
		<script src="/js/respond.js"></script>
		<script src="http://html5shiv.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->
	<script type="text/javascript">
	window.onload=function(){
		$('.pauseBtn a').click(function(){
			slider.stopAuto();
			$(this).parent().css("display","none");
			$(this).parent().parent().find(".playBtn").css("display","block");
		});
		$('.playBtn a').click(function(){
			slider.startAuto();
			$(this).parent().css("display","none");
			$(this).parent().parent().find(".pauseBtn").css("display","block");
		});
	}
	</script>
</head>
<body>
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
					<li><a href="#a">맛집정보</a>
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
		<div id="contents" class="main">
			<div class="mainVisual">
				<ul class="bxslider">
					<li>
						<p>POOK</p>
						<p>POOK은 맛집들의 음식을 푹 찍어 먹는 다는 의미를 가지고 있습니다. <br>
						당신이 못가봤던 맛집에 대해 리뷰를 통해 생생하게 느껴보세요.</p>
						<div><img src="/images/main/mainVisual_01.jpg" alt=""></div>
					</li>
					<li>
						<p>맛집 리뷰 사이트</p>
						<p>POOK은 맛집들의 음식을 푹 찍어 먹는 다는 의미를 가지고 있습니다. <br>
						당신이 못가봤던 맛집에 대해 리뷰를 통해 생생하게 느껴보세요.</p>
						<div><img src="/images/main/mainVisual_02.jpg" alt=""></div>
					</li>
					<li>
						<p>POOK</p>
						<p>POOK은 맛집들의 음식을 푹 찍어 먹는 다는 의미를 가지고 있습니다. <br>
						당신이 못가봤던 맛집에 대해 리뷰를 통해 생생하게 느껴보세요.</p>
						<div><img src="/images/main/mainVisual_03.jpg" alt=""></div>
					</li>
				</ul>
				<div class="pauseBtn"><a href="#a"></a></div>
				<div class="playBtn"><a href="#a"></a></div>
			</div>
			<div class="mainCont">
				<div class="mainL">
					<div class="mainBox01" onclick="location.href='/info/info.html'">
						<h3>맛집정보</h3>
						<p>대한민국 안에있는 모든 맛집 정보를 빅데이터에 저장하여
							고객님이 원하시는 맛집 정보를 얻을 수 있습니다.
							보기편한 게시판 형태로 하여 간편하게 확인 하실수 있습니다.
							여기서 고객님께서 원하는 맛집을 찾으시면 좋겠습니다.</p>
						<span></span>
					</div>
					<div class="mainBox07 mainBox07_color">
						<h3>맛집리뷰</h3>
						<ul>
							<li>
								<a href="/review/review_view.html">정왕동 삼겹살 맛집</a>
								<p>2016-08-31</p>
							</li>
							<li>
								<a href="/review/review_view.html">정왕동 삼겹살 맛집</a>
								<p>2016-08-31</p>
							</li>
							<li>
								<a href="/review/review_view.html">정왕동 삼겹살 맛집</a>
								<p>2016-08-31</p>
							</li>
							<li>
								<a href="/review/review_view.html">정왕동 삼겹살 맛집</a>
								<p>2016-08-31</p>
							</li>
						</ul>
						<span></span>
					</div>
					<div class="mainBox04" onclick="location.href='/map/map.html'">
						<h3>맛지도</h3>
						<p>서울<br>
							경기도<br>
							강원도<br>
							충청도<br>
							전라도<br>
							부산<br>
							제주
						</p>
						<span></span>
					</div>
				</div>
				<div class="mainR">
					<div class="mainRL">
						<div class="mainBox05" onclick="location.href='#a'">
							<h3>편의점음식</h3>
							<p>편의점음식 레시피에 대한 정보를 얻을수 있는 메뉴로 현재 중비중입니다.</p>
							<span></span>
						</div>
						<div class="mainBox06" onclick="location.href='#a'">
							<h3>맛집TOP10</h3>
							<p>홈페이지에 있는 맛집들을<br> TOP10으로 정리한 메뉴로 현재 중비중입니다.</p>
							<span></span>
						</div>
					</div>
					<div class="mainBox07">
						<h3>맛커뮤니티</h3>
						<ul>
							<li>
								<a href="/comunity/comunity_view.html">맛집 정모 하실 분들 연락 주세요.</a>
								<p>2016-08-31</p>
							</li>
							<li>
								<a href="/comunity/comunity_view.html">맛집 정모 하실 분들 연락 주세요.</a>
								<p>2016-08-31</p>
							</li>
							<li>
								<a href="/comunity/comunity_view.html">맛집 정모 하실 분들 연락 주세요.</a>
								<p>2016-08-31</p>
							</li>
							<li>
								<a href="/comunity/comunity_view.html">맛집 정모 하실 분들 연락 주세요.</a>
								<p>2016-08-31</p>
							</li>
						</ul>
						<span></span>
					</div>
					<div class="mainBox08" onclick="location.href='/qna/qna.html'">
						<h3>고객문의</h3>
						<p>고객님의 의견에 귀담아 들을 준비가 되있습니다.<br>고객님의 문의에 정성껏 답변드리겠습니다.</p>
						<span></span>
					</div>
					<!-- <div class="mainBox09" onclick="location.href='/support/counsel.html'">
						<h3>고객문의</h3>
						<p>고객님의 문의에 정성껏 답변드리겠습니다.</p>
						<span></span>
					</div> -->
				</div>
			</div>
		</div>
		<div id="footer">
			<p>COPYRIGHTS 2017 BY HONG ALL RIGHTS RESERVED</p>
		</div>
		<div id="topBtn"><a href="#"><img src="/images/btn/btn_top.png" alt="상단으로 이동" class="over"></a></div>
	</div>
	<script type="text/javascript">
		var slider = $('.bxslider').bxSlider({
		  auto: true, 
		  speed:100
		});
		var cnt = (($('.bxslider li').length-2)*10)+'px';
		var number = '-' + (($('.bxslider li').length-2)*10)+'px';
		$('.bx-wrapper .bx-pager').css('margin-left',number);
		$('.pauseBtn a').css('margin-left',cnt);
		$('.playBtn a').css('margin-left',cnt);
		for(var i=1;i<=9;i++) {
			$('.mainBox0'+i).mouseover(function(){
				$('.mainCont div span').css('display','none');
				$(this).find('span').css('display','block');
			});
			$('.mainBox0'+i).mouseout(function(){
				$('.mainCont div span').css('display','none');
			});
		}
	</script>
</body>
</html>