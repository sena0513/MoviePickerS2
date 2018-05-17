<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="<c:url value="../res/css/ticket/reservationGuide.css" />" rel="stylesheet" >

<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>

<script>

document.getElementById("defaultOpen").click();

function openStep(evt, step) {
    var i, guideTab_Content, tablinks;
    guideTab_Content = document.getElementsByClassName("guideTab_Content");
    for (i = 0; i < guideTab_Content.length; i++) {
       guideTab_Content[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(step).style.display = "block";
    evt.currentTarget.className += " active";
}

function closePopup(){
   self.close();
}


</script>

<div class="reservationGuideWrapper" style="display: block;">
   <div class="guideHeader">
      <h1>예매 가이드</h1>
   </div>
   
   <div class="guideTab">
      <div class="tabButtons">
         <button class="tablinks" onclick="openStep(event, 'Step1')"
         id="defaultOpen">
            <img src="../res/image/ticketingImages/step1_wh.png"><br>
            <span>영화, 극장, 날짜, 시간선택</span>
         </button>
      </div>
      <div class="tabButtons">
         <button class="tablinks" onclick="openStep(event, 'Step2')">
            <img src="../res/image/ticketingImages/step2_wh.png"><br>
            <span>인원, 좌석선택</span>
         </button>
      </div>
      <div class="tabButtons">
         <button class="tablinks" onclick="openStep(event, 'Step3')">
            <img src="../res/image/ticketingImages/step3_wh.png"><br>
            <span>결제하기</span>
         </button>
      </div>
   </div>
   
   <div id="Step1" class="guideTab_Content">
      <img src="../res/image/ticketingImages/MP_reservationGuide_step1.jpg">
   </div>
   <div id="Step2" class="guideTab_Content">
      <img src="../res/image/ticketingImages/MP_reservationGuide_step2.jpg">
   </div>
   <div id="Step3" class="guideTab_Content">
      <img src="../res/image/ticketingImages/MP_reservationGuide_step3.jpg">
   </div>
   
   <div class="closeButton">
      <p align="center"><button id="close_btn" onclick="closePopup()">닫기</button></p>
   </div>
</div>