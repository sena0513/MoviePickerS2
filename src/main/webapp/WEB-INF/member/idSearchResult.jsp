<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<script type="text/javascript"
   src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="<c:url value="../res/css/member/searchIdResult.css" />" rel="stylesheet">
<div id="wrapper">
      <div id="bodyWrapper">
         <div class="pWSearchNavi">
            <div class="pwSearchMenuDiv">
               <div class="pWimageDiv">
                  <a href="/mvProject/main/index.do">
                     <img src="../res/image/main/homeImage.png">
                  </a>   
               </div>
               
               <div class="pwSearchNaviSecondDiv">
                <a href="/mvProject/main/loginForm.do">> 회원 서비스</a>
               </div>
               
               <div class="pwSearchNaviThirdDiv">
               <a href="/mvProject/main/loginForm.do">> 로그인</a>
               </div>
               
               <div class="pwSearchNaviFourthDiv">
               <a href="/mvProject/member/idSearchForm.do">> 아이디 찾기</a>
               </div>
         </div>
      </div>
         
      
         <div class="searchIdResultWrapper">
         
            <div class="searchIdTitle">
               <h1>아이디 찾기</h1>
               <p>안녕하세요. ${result}님 </p>
               <p>본인인증 시 제공되는 정보는 해당 인증기관에서 직접 수집 하며, 인증 이외의 용도로 이용 또는 저장하지 않습니다.</p>
            </div>
         
            <div class="searchIdResultContent">
               <div class="resultContext">
                  <h2>처리결과안내</h2>
               </div>
         
                 <c:choose>
                 <c:when test=" ${result eq null}">
               <div class="resultContent">
                  <div class="content2"><h3>고객님의 정보와 일치하는 ID가 존재하지 않습니다.</h3></div>
               </div>
                   </c:when>
                   <c:otherwise>
                      <div class="resultContent">
                  <div class="content2"><h3>고객님의 ID는 ${result} 입니다.</h3></div>
               </div>
                   </c:otherwise>
                </c:choose>
         
               <div class="searchIdResultButton">
                  <input type="button" value="로그인 화면 이동" class="moveLoginButton" onclick="window.location.href='/mvProject/member/loginForm.do'">
                  <input type="button" value="메인 화면 이동" class="moveMainButton" onclick="window.location.href='/mvProject/main/index.do'">
               </div>
            </div>
         </div>
      </div>
   </div>   