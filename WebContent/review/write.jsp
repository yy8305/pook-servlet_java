<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	<script type="text/javascript" src="/nse_files/js/HuskyEZCreator.js" charset="utf-8"></script>
	<script>
		function reg(){
			// 에디터의 내용이 textarea에 적용됩니다.
		    
		    // 에디터의 내용에 대한 값 검증은 이곳에서 document.getElementById("ir1").value를 이용해서 처리하면 됩니다.
		 
		    /* try {
		        elClickedObj.form.submit();
		    } catch(e) {} */
		    
		    oEditors.getById["board_contents"].exec("UPDATE_CONTENTS_FIELD", []);
			if($.trim($("[name=title]").val()) == ""){
				alert("제목을 입력해주세요.");
				return false;
			}else if($.trim(document.getElementById("board_contents").value) == ""){
				alert("내용을 입력해주세요.");
				return false;
			}
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
				<li class="on"><a href="/CommunityList">맛커뮤니티</a></li>
			</ul>
		</div>
		<div id="contents">
			<form name="frm" action="/ReviewWrite" method="post" onSubmit="return reg()">
				<div class="viewType01 mt45 write">
					<table>
						<caption>맛커뮤니티 글쓰기</caption>
						<colgroup>
							<col class="w150px">
							<col>
						</colgroup>
						<tbody>
							<tr>
								<th>제목</th>
								<td><input type="text" name="title" title="제목 입력란" class="w100"></td>
							</tr>
							<tr>
								<th>내용</th>
								<td>
									<textarea name="board_contents" id="board_contents" class="nse_content" title="내용 입력란"></textarea>
									<script type="text/javascript">
										var oEditors = [];
										nhn.husky.EZCreator.createInIFrame({
										    oAppRef: oEditors,
										    elPlaceHolder: "board_contents",
										    sSkinURI: "/nse_files/SmartEditor2Skin.html",
										    fCreator: "createSEditor2"
										});
									</script>
								</td>
							</tr>
							<!-- <tr>
								<th>첨부파일</th>
								<td>
								</td>
							</tr> -->
						</tbody>
					</table>
				</div>
				<div class="btnAreaR">
					<input type="submit" class="btn btnSubmit" value="저장">
					<a href="#a" onClick="history.back();" class="btn btnCancel">취소</a>
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