<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="../css/adminstyle.css">
">
<form action="/mvProject/admintimeschedule/regionregit.do" method="post">
	<jsp:include page="../admininclude/admintop.jsp" />

	<table border=1>
   
      <tr>
         <td>상영 영화</td>
         <td>
         <select name="playingMovie">
            <c:forEach items="${list}" var="list">
                  <option selected>${list.movienameforkr}
                  </option>
            </c:forEach>
           </select>
           </td>
      </tr>
      <tr>
         <td>상영지역</td>
         <td><input type=text placeholder="ex) 서울" name=theaterRegion></td>
      </tr>
      <tr>
         <td>상영구역 </td>
         <td><input type=text placeholder="ex) 강남" name=theaterBranch></td>
      </tr>
      <tr>
         <td>상영관 </td>
         <td><input type=text placeholder="ex) x관" name=theaterScreen></td>
      </tr>
      <tr>
         <td>상영 날짜 월/일</td>
         <td>
            <select name="theatreyear">
               <c:forEach begin="2018" end="2025" varStatus="year" step="1" var="i">
                     <option>${year.index}</option>
               </c:forEach>
              </select>
            <select name="theatremonth">
               <c:forEach begin="1" end="12" varStatus="month" step="1" var="i">
                     <c:if test="${i<10}">
                     <option>0${month.index}</option>
                     </c:if>
                     <c:if test="${i>=10}">
                     <option>${month.index}</option>
                     </c:if>
               </c:forEach>
              </select>
            <select name="theatreday">
               <c:forEach begin="1" end="31" varStatus="day" step="1" var="i">
                     <c:if test="${i<10}">
                     <option>0${day.index}</option>
                     </c:if>
                     <c:if test="${i>=10}">
                     <option>${day.index}</option>
                     </c:if>
               </c:forEach>
              </select>
         </td>
      </tr>
      <tr>
         <td>상영 시간</td>
         <td><input type=text placeholder="ex) 12:00" name=theatertime></td>
      </tr>
      <tr>
         <td>연령 제한</td>
         <td>
            <select name="theaterMovieGrade">
                     <option>all</option>
                     <option>12</option>
                     <option>15</option>
                     <option>chungbul</option>
                     <option>mijeong</option>
              </select>
           </td>
      </tr>
      <tr>
         <td colspan=2 align=right><input type="submit" value="등록">
         <input type="reset" value="다시 입력">
      </tr>
   </table>

	<jsp:include page="../admininclude/adminbottom.jsp" />
</form>