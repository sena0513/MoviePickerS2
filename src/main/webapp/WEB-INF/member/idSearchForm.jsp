<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<script type="text/javascript"
   src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="<c:url value="../res/css/member/searchIdForm.css" />" rel="stylesheet">
<script>
$(document).ready(function(){   
      $('#btn_submit').click(function(){
         if($('#name').val() == ""){
               alert("이름을 입력해주세요.");
               $('#name').focus();
               return false;
            }
            
            if($("#birth").val() == ""){
                alert("생년월일을 입력해주세요.");
                  $('#birth').focus();
                  return false;
             }
            
            if($("#rphone").val() == ""){
               alert("핸드폰번호를 입력해주세요.");
                 $('#rphone').focus();
                 return false;
            }
            
            // 이름 
            var name = document.getElementById("name").value;
            var isNAME = /^[가-힣]{2,8}+$/
              if (!isNAME.test(name)) {
                 alert("이름에 부적절한 값이 들어갔습니다.");
                 $("#name").val("");
                 $("#name").focus();
                 return false;
              } 
             
            // 생일
             var birth = document.getElementById("birth").value;
             var isBIRTH = /^[0-9]+$/;
              if (!isBIRTH.test(birth)) {
                 alert("생년월일에 부적절한 값이 들어갔습니다.");
                 $("#birth").val("");
                 $("#birth").focus();
                 return false;
              } 
        
             //핸드폰 번호
            var rphone = document.getElementById("rphone").value;
             var isPHONE1 = /(01[0|1|6|9|7])[-](\d{3}|\d{4})[-](\d{4}$)/g;
              if (!isPHONE1.test(rphone)) {
                 alert("핸드폰에 부적절한 값이 들어갔습니다.");
                 $("#rphone").val("");
                 $("#rphone").focus();
                 return false;
              } 

      });
   });

</script>

<body onload="loadJSON()" style="overflow-x:hidden; overflow-y:auto;">
   <form id="smsForm" method="get" name="smsForm" action="/mvProject/member/smssend.do">

      <div id="bodyWrapper">
         <div class="idSearchNavi">
            <div class="idSearchMenuDiv">
               <div class="iDimageDiv">
                  <a href="/mvProject/main/index.do">
                  <img src="../res/image/main/homeImage.png">
                  </a>
               </div>
               
               <div class="idSearchNaviSecondDiv">
               <a href="/mvProject/main/loginForm.do">> 회원 서비스</a>
               </div>
               
               <div class="idSearchNaviThirdDiv">
               <a href="/mvProject/main/loginForm.do">> 로그인</a>
               </div>
               
               <div class="idSearchNaviFourthDiv">
               <a href="/mvProject/member/idSearchForm.do">> 아이디 찾기</a>
               </div>
         </div>   
      </div>   
         
         <div class="idSearchWrapper">
         
         <div class="searchIdTitle">
            <h1>아이디 찾기</h1>
            <p>아이디가 기억나지 않으세요? 휴대폰 인증을 통하여 아이디를 확인하실 수 있습니다. </p>
            <p>본인인증 시 제공되는 정보는 해당 인증기관에서 직접 수집 하며, 인증 이외의 용도로 이용 또는 저장하지 않습니다.</p>
         </div>
         
         <div class="searchIdContent">
            <input type="hidden" name="action" value="go"> 
            <input type="hidden" name="sphone1" value="010"> 
            <input type="hidden" name="sphone2" value="2769"> 
            <input type="hidden" name="sphone3" value="8683"> 
            <input type="hidden" name="msg" value="${msg}">
             
            
            <div class="nameDiv">
               <div class="nameLabelDiv"><strong>이름</strong></div> 
               <div class="inputNameDiv"><input type="text" name="name" size="35" id="name" maxlength="10">
               <div id=nameDiv></div>
               </div> 
               <div class="selectForeignerBox">
                  <select>
                     <option value="local">내국인</option>
                     <option value="foreigner">외국인</option>
                  </select>
               </div>
            </div>
            
            <div class="birthDiv">
               <div class="birthLabelDiv"><strong>생년월일</strong></div>
               <div class="inputBirthDiv"><input type="text" name="birth" id="birth" placeholder="ex)19930103" maxlength="8">
               <div id=birthDiv></div>
               </div>
            </div>
            
            <div class="receivingNumberDiv">
               <div class="receivingNumberLabelDiv"><strong>수신번호</strong></div>
               <div class="selectPhoneBox">
                  <select>
                     <option value="SKT">SKT</option>
                     <option value="KT">KT</option>
                     <option value="LGU+">LGU+</option>
                     <option value="알뜰폰">알뜰폰</option>
                  </select>
               </div>
               <div class="inputRecevingNumberDiv"><input type="text" name="rphone" id="rphone" placeholder="ex)010-1234-5678">
               <div id="phoneDiv"></div>
               </div>
            </div>
            <div class="bottomButtonMenu">
               <div class="buttonMenuDiv">
                  <input type="submit" value="전송" id="btn_submit" style="width:165px; height:50px; font-size:25px; 
                   background-color: #282828;
                     color: white;
                      border-radius: 8px;
                      outline: none;
                      font-weight: bold">
                  <input type="button" value="취소" style="width:165px; height:50px; font-size:25px;  background-color: #282828;
                     color: white; border-radius: 8px; outline: none; font-weight: bold"
                  onclick="window.location.href='/mvProject/main/index.do'">
               </div>
            </div>
         </div>
         </div>
      </div>
   </form>
   
</body>
