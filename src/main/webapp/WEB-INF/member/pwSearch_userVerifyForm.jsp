<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<script type="text/javascript"
   src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<link href="<c:url value="../res/css/member/pwSearch_userVerifyForm.css" />" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){
   
    $('#bottomSubmitButton').click(function(){
         if($('#name').val() == ""){
               alert("이름을 입력해주세요.");
               $('#name').focus();
               return false;
            }
         
            if($('#name').val().length < 1 || $('#name').val().length > 9){
             alert("2~8자 이하 한글을 입력하세요.");
               $('#name').val("");
               $('#name').focus();
               return false;
             }
            
            if($("#birth").val() == ""){
                alert("생년월일을 입력해주세요.");
                  $('#birth').focus();
                  return false;
             }
            
            if($("#birth").val().length < 7 || $("#birth").val().length > 9 ){
                alert("8자의 생년월일을 입력해주세요.");
                  $('#birth').val("");
                  $('#birth').focus();
                  return false;
             }
            
            if($("#phoneNumber").val() == ""){
               alert("핸드폰번호를 입력해주세요.");
                 $('#phoneNumber').focus();
                 return false;
            }
            
            if($("#phoneNumber").val().length < 12 || $("#phoneNumber").val().length > 14 ){
                alert("(-)를 포함한 13자의 번호를 입력해주세요.");
                  $('#phoneNumber').val("");
                  $('#phoneNumber').focus();
                  return false;
             }
            
            // 이름 
            var name = document.getElementById("name").value;
            var isNAME = /^[가-힣]+$/
              if (!isNAME.test(name)) {
                 alert("이름에 부적절한 값이 들어갔습니다.");
                 $("#name").val("");
                 $("#name").focus();
                 return false;
              } 
           
            
            //핸드폰 번호
            var phoneNumber = document.getElementById("phoneNumber").value;
             var isPHONE = /(01[0|1|6|9|7])[-](\d{3}|\d{4})[-](\d{4}$)/g;
              if (!isPHONE.test(phoneNumber)) {
                 alert("핸드폰에 부적절한 값이 들어갔습니다.");
                 $("#phoneNumber").val("");
                 $("#phoneNumber").focus();
                 return false;
              }

      });
   
});
</script>

<body onload="loadJSON()" style="overflow-x:hidden; overflow-y:auto;">
   <form method="POST" name="smsForm" action="/mvProject/member/pw_smsSend.do" id="smsForm">
      <div id="bodyWrapper">
         <div class="pwSearchNavi">
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
            <h1>임시비밀번호 발급</h1>
            <p>회원 정보에 등록된 법정생년월일 6자리</p>
            <p>국번 3자리(01x)를 포함한 휴대전화 번호 뒤 7~8자리를 입력해주세요.</p>
         </div>
         
         <div class="searchPwContent">
            <input type="hidden" name="action" value="go"> 
            <input type="hidden" name="sphone1" value="010"> 
            <input type="hidden" name="sphone2" value="2769"> 
            <input type="hidden" name="sphone3" value="8683"> 
            <input type="hidden" name="msg" value="${msg}" id="msg">
            <input type="hidden" name="id" value="${id}">
             
            
            <div class="nameDiv">
               <div class="nameLabelDiv"><strong>이름</strong></div> 
               <div class="inputNameDiv"><input type="text" name="name" size="35" id="name" minlength="2" maxlength="8"></div> 
               <div id="nameDIV"></div>
               <div class="selectForeignerBox">
                  <select id="from">
                     <option value="local">내국인</option>
                     <option value="foreigner">외국인</option>
                  </select>
               </div>
            </div>
            
            <div class="birthDiv">
               <div class="birthLabelDiv"><strong>생년월일</strong></div>
               <div class="inputBirthDiv"><input type="text" name="birth" id="birth" placeholder="ex)19930103" maxlength="8"><div id="birthDIV"></div></div>
            </div>
            
            <div class="receivingNumberDiv">
               <div class="receivingNumberLabelDiv"><strong>수신번호</strong></div>
               
               <div class="selectPhoneBox">
                  <select id="select">
                     <option value="SKT">SKT</option>
                     <option value="KT">KT</option>
                     <option value="LGU+">LGU+</option>
                     <option value="알뜰폰">알뜰폰</option>
                  </select>
               </div>
               <div class="inputRecevingNumberDiv">
               <input type="text" name="rphone" placeholder="ex)010-1234-5678" id="phoneNumber">
               <div id="phoneNumberDIV"></div>
               </div>
            </div>
            
            <div class="bottomButtonMenu">
               <div class="buttonMenuDiv">
                  <input type="submit" value="전송" class="bottomSubmitButton" id=bottomSubmitButton>
                  <input type="button" value="취소" class="bottomCancelButton" 
                  onclick="window.location.href='/mvProject/member/loginForm.do'">
               </div>
            </div>
         
         </div>
         
         </div>
         
         
         
      </div>
   </form>
   
</body>