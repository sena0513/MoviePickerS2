<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="../css/adminstyle.css">
">
<form action="/mvProject/adminmember/modifymovie.do?pg=${pg}" method="post">
	<jsp:include page="../admininclude/admintop.jsp" />

	<table border=1>
		<tr>
			<td>영화 이름(한글)<input type="hidden" value="${list.seq}" name="seq"></td>
			<td><input type=text name=movienameforkr value="${list.movienameforkr}"></td>
		</tr>
		<tr>
			<td>영화 이름(영어)</td>
			<td><input type=text name=movienameforeng value="${list.movienameforeng}"></td>
		</tr>
		<tr>
			<td>장르 이름</td>
			<td><input type=text name=moviegenre value="${list.moviegenre}"></td>
		</tr>
		<tr>
			<td>배우 이름</td>
			<td><input type=text name=movieactor value="${list.movieactor}"></td>
		</tr>
		<tr>
			<td>감독 이름</td>
			<td><input type=text name=moviemaker value="${list.moviemaker}"></td>
		</tr>
		<tr>
			<td>영화 소개</td>
			<td><textarea rows="20" cols="60" name=moviecontent>${list.moviecontent}</textarea></td>
		</tr>
		<tr>
			<td>영화 시간</td>
			<td><input type="text" name=movierunningtime value="${list.movierunningtime}"></td>
		</tr>
		<tr>
			<td>연령 제한</td>
			<td><input type="text" name=movieagelimit value="${list.movieagelimit}"></td>
		</tr>
		<tr>
			<td>영화 개봉일자</td>
			<fmt:parseDate var="parsedDate" value="${list.moviedate}" pattern="yyyy-MM-dd HH:mm:ss"/>
			<fmt:formatDate value="${parsedDate}" pattern="yyyy-MM-dd" var="realDate"/>
			<td><input type="text" name=moviedate value="${realDate }"></td>
		</tr>
		<tr>
			<td>제작 국가</td>										
			<td><input type="text" name=moviemakecountry value="${list.moviemakecountry}"></td>
		</tr>
		<tr>
			<td>영화 포스터 이름</td>
			<td><input type="text" name=moviepostimg value="${list.moviepostimg}"></td>
		</tr>
		<tr>
			<td>스틸컷 이미지 1</td>
			<td><input type="text" name=moviesteelcutimg1 value="${list.moviesteelcutimg1}"></td>
		</tr>
		<tr>
			<td>스틸컷 이미지 2</td>
			<td><input type="text" name=moviesteelcutimg2 value="${list.moviesteelcutimg2}"></td>
		</tr>
		<tr>
			<td>스틸컷 이미지 3</td>
			<td><input type="text" name=moviesteelcutimg3 value="${list.moviesteelcutimg3}"></td>
		</tr>
		<tr>
			<td>트레일러 영상</td>
			<td><input type="text" name=movietrailer value="${list.movietrailer}"></td>
		</tr>
		<tr>
			<td colspan=2 align=right><input type="submit" value="수정">
			<input type="button" value="취소" onclick="location.href='/mvProject/adminmember/adminmovieList.do?pg=${pg}'">
		</tr>
	</table>

	<jsp:include page="../admininclude/adminbottom.jsp" />
</form>