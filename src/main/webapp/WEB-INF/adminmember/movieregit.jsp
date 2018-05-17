<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="../css/adminstyle.css">
">
<form action="/mvProject/adminmember/movieregit.do?pg=${pg}" method="post">
	<jsp:include page="../admininclude/admintop.jsp" />

	<table border=1>
		<tr>
			<td>영화 이름(한글)</td>
			<td><input type=text placeholder="영화 이름(KR)" name=movienameforkr></td>
		</tr>
		<tr>
			<td>영화 이름(영어)</td>
			<td><input type=text placeholder="영화 이름(EN)"
				name=movienameforeng></td>
		</tr>
		<tr>
			<td>장르 이름</td>
			<td><input type=text placeholder="장르 입력 " name=moviegenre></td>
		</tr>
		<tr>
			<td>배우 이름</td>
			<td><input type=text placeholder="배우1,배우2..." name=movieactor></td>
		</tr>
		<tr>
			<td>감독 이름</td>
			<td><input type=text placeholder="감독 이름" name="moviemaker"></td>
		</tr>
		<tr>
			<td>영화 소개</td>
			<td><textarea rows="20" cols="60" placeholder="상새내용"
					name="moviecontent"></textarea></td>
		</tr>
		<tr>
			<td>영화 시간</td>
			<td><input type="text" placeholder="영화시간"
				name="movierunningtime"></td>
		</tr>
		<tr>
			<td>연령 제한</td>
			<td><input type="text" placeholder="..관람가" name="movieagelimit"></td>
		</tr>
		<tr>
			<td>영화 개봉일자</td>
			<td><input type="text" placeholder="xxxx-xx-xx"
				name="moviedate"></td>
		</tr>
		<tr>
			<td>제작 국가</td>										
			<td><input type="text" placeholder="제작 국가" name="moviemakecountry"></td>
		</tr>
		<tr>
			<td>영화 포스터 이름</td>
			<td><input type="text" placeholder="영화이름.jpg" name="moviepostimg"></td>
		</tr>
		<tr>
			<td>스틸컷 이미지 1</td>
			<td><input type="text" placeholder="스틸컷 이름1.jpg"
				name="moviesteelcutimg1"></td>
		</tr>
		<tr>
			<td>스틸컷 이미지 2</td>
			<td><input type="text" placeholder="스틸컷 이름2.jpg"
				name="moviesteelcutimg2"></td>
		</tr>
		<tr>
			<td>스틸컷 이미지 3</td>
			<td><input type="text" placeholder="스틸컷 이름3.jpg"
				name="moviesteelcutimg3"></td>
		</tr>
		<tr>
			<td>트레일러 영상</td>
			<td><input type="text" placeholder="영화이름.mp4" name="movietrailer"></td>
		</tr>
		<tr>
			<td colspan=2 align=right><input type="submit" value="등록">
			<input type="reset" value="다시 입력">
		</tr>
	</table>

	<jsp:include page="../admininclude/adminbottom.jsp" />
</form>