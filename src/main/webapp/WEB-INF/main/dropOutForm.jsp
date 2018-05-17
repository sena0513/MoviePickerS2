<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="<c:url value="../res/css/main/dropOutForm.css" />"rel="stylesheet">
<div id="bodyWrapper">
   
   <div class="dropOutFormContentsWrapper">
      
      <div class="dropOutFormLabel">
         <h1>회 원 탈 퇴</h1>
      </div>
      
      
      <div class="dropOutFormImage">
         <img src="../res/image/main/moviePicker.png">      
      </div>
      
      <div class="dropOutFormContents">
         <h2>그동안 무비피커를 이용해 주셔서 감사합니다.</h2>
         <h4>고객님의 탈퇴가 완료되었습니다. 앞으로 더욱 좋은 모습으로 찾아뵙겠습니다.</h4>
      </div>
   
      <div class="dropOutFormBottonWrapper">
         <input type="button" value="메인으로"
         onclick="window.location.href='/mvProject/main/index.do'">
      </div>
      
   </div>
   
</div>