<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<meta name="viewport" content="width=device-width, user-scalable=no" />
<!-- 이 사이트는 모바일웹에 대비해서 만들어졌어!! 브라우저야 내 레이아웃에 손대지 말아줄래? -->

<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link href="<c:url value="../res/css/main/header.css" />"
	rel="stylesheet">

<title>Movie Picker</title>

</head>
<body>
	<div id="headerWrapper">
		<div class="header">

			<div class="headerContentsWrapper">
				<div class="mainCgvMark">
					<a href="/mvProject/main/index.do"> <img
						src="../res/image/main/realrealMoviePicker.png">
					</a>
				</div>

				<div class="centerMenu">
					<div class="theater">
						<img src="../res/image/main/realCulturePlex.png">
					</div>

					<div class="totalDropDown">
						<div class="dropdown">
							<button class="dropbtn">영화</button>
							<div class="dropdown-content">
								<a href="/mvProject/movieChart/movieChart.do">무비차트</a> <a
									href="/mvProject/movieFinder/movieFinderIndex.do">무비파인더</a> <a
									href="/mvProject/moviePoint/moviePoint.do">평점</a>
							</div>
						</div>
						<div class="dropdownRight">
							<button class="reservationBtn"
								onclick="window.location.href='/mvProject/ticket/ticketingStep1.do'">예매</button>
							<button class="theaterBtn"
								onclick="window.location.href='/mvProject/theaters/theaters.do'">극장</button>
						</div>
					</div>
				</div>

				<div class="searchPartDiv">

					<div class="memberGroup">
						<ul>
							<c:choose>
								<c:when test="${loginId==null }">
									<li class="loginLi"><a href="/mvProject/main/loginForm.do">로그인</a></li>
									<li class="joinLi"><a
										href="/mvProject/member/registerForm.do">회원가입</a></li>
								</c:when>
								<c:otherwise>
									<li class="loginLi"><a href="/mvProject/member/logout.do">로그아웃</a></li>
									<li class="joinLi"><a href="/mvProject/myPage/index.do">My
											Page</a></li>
								</c:otherwise>
							</c:choose>
							<li class="HelpCenterLi"><a
								href="/mvProject/helpCenter/index.do">고객센터</a></li>
						</ul>
					</div>

					<div class="searchPartContents">
					<form action="/mvProject/movieFinder/movieFinderResult.do" method="get">
						<div class="inputTextFieldDiv">
							<input type="text" id="inputText" name="searchtext">
						</div>

						<div class="clickSearchButtonDiv">
							<input type="submit" id="searchButton" name="searchButton" value="검색">
						</div>
					</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>