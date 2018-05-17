<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="<c:url value="../res/css/member/pwChangeResult.css" />"
   rel="stylesheet">

<div id="bodyWrapper">
   <div class="pWChangeFormStep2Navi">
      <div class="pWChangeFormStep2NaviMenuDiv">
         <div class="pWChangeFormStep2imageDiv">
            <a href="/mvProject/main/index.do"> <img
               src="../res/image/main/homeImage.png">
            </a>
         </div>

         <div class="pWChangeFormStep2_imageDivSecondDiv">
            <a href="/mvProject/main/loginForm.do">> 회원서비스</a>
         </div>

         <div class="pWChangeFormStep2_imageDivThirdDiv">
            <a href="/mvProject/main/loginForm.do">> 로그인</a>
         </div>

         <div class="pWChangeFormStep2_imageDivFourthDiv">
            <a href="/mvProject/member/pwSearchForm.do">> 비밀번호찾기</a>
         </div>
      </div>
   </div>


   <div class="pWChangeFormStep2Wrapper">

      <div class="pWChangeFormStep2Label">
         <h1>비밀번호 변경 완료</h1>
         <span>변경된 비밀번호로 서비스를 이용해 주시기 바랍니다.</span>
      </div>


      <div class="pWChangeFormStep2Title">
         <span class="successPasswordSpan">
            비밀번호가 성공적으로 <span class="changeFontColor">변경되었습니다.</span>
         </span>
         <br><br>
         <span>새로운 비밀번호로 안전하게 MoviePicker 서비스를 맘껏 이용해 주세요.</span>
      </div>

         <div class="pWChangeFormStep2Button">
            <input type="button" value="메인으로" class="pwChangeConfirmButton"
               onclick="window.location.href='/mvProject/main/index.do'">
         </div>
      </div>
   </div>