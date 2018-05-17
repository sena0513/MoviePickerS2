<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="<c:url value="../res/css/member/pwSearchForm.css" />" rel="stylesheet">
<script type="text/javascript" src="../res/script/pwSearchForm.js"></script>

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
               <a href="/mvProject/member/pwSearchForm.do">> 비밀번호 찾기</a>

               </div>
         </div>
      </div>      
      
      
      <div class="pwSearchWrapper">
      
         <div class="searchPwTitle">
            <h1>비밀번호 찾기</h1>
            <p>비밀번호가 기억나지 않으세요? 아래방법으로 비밀번호를 확인하실 수 있습니다. </p>
            <p>본인인증 시 제공되는 정보는 해당 인증기관에서 직접 수집 하며, 인증 이외의 용도로 이용 또는 저장하지 않습니다.</p>
         </div>
         
         <div class="searchPwResetForm">
            <div class="searchPwResetHead">
               <h2>비밀번호 재설정</h2>
            </div>
            
            <div class="searchPwResetBody">
               <div class="searchPwResetBodyFirstDiv">
                  <h2>비밀번호를 재설정할 아이디를 입력해주세요.</h2>
               </div>
               <div class="searchPwResetBodySecondDiv">
                  <div class="searchPwResetInputIdLabel">
                     <h3>아이디</h3>
                  </div>
                  <div class="searchPwResetInputIdText">
                     <input type="text" name="id" id="id" placeholder="아이디를 입력해주세요"/>
                  </div>
                  
                  
                  <div class="searchPwResetResearchButtonDiv">
                     <input type="button" value="조회" class="researchButton" name="researchButton" id="idcheckButton">
                  </div>
                  <div id="idDiv"></div>
               </div>
            </div>
         
         </div>   
   </div>
   </div>