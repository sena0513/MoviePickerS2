<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="<c:url value="../res/css/member/pwChangeForm.css" />"
   rel="stylesheet">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
$(document).ready(function(){   
   
      $('#btn_submit').click(function(){
         var pw = $('#pw').val();
          var pw_check = $('#pw_check').val();
          if(pw != pw_check){
             $("#msg_pw_check").css("font-size","9pt");
             $("#msg_pw_check").css("color","red");
             $("#msg_pw_check").css("font-weight","bold");
             $("#msg_pw_check").text("입력하신 비밀번호가 일치하지 않습니다. 다시 확인해 주세요.");
          }else if(pw == "" || pw_check == ""){
             $("#msg_pw_check").css("font-size","9pt");
             $("#msg_pw_check").css("color","red");
             $("#msg_pw_check").css("font-weight","bold");
             $("#msg_pw_check").text("비밀번호를 입력해주세요.");
          }else{
             $("#msg_pw_check").css("font-size","9pt");
             $("#msg_pw_check").css("color","blue");
             $("#msg_pw_check").css("font-weight","bold");
             $("#msg_pw_check").text("입력하신 비밀번호가 일치합니다.");
          }
         
            // 비밀번호 확인
            if ($('#pw').val().length < 7 || $('#pw').val().length > 17) {
               alert("8~16자리의 영문 소문자 또는 영문 소문자+숫자 비밀번호를 입력해 주세요.");
               $('#pw').focus();
               return false;
            }
            $("#msg_pw").hide();

            if ($('#pw_check').val().length < 7 || $('#pw_check').val().length > 17) {
               alert("8~16자리의 영문 소문자 또는 영문 소문자+숫자 비밀번호를 입력해 주세요.");
               $('#pw_check').focus();
               return false;
            }

            if ($("#pw").val() != $("#pw_check").val()) {
               $("#msg_pw_check").css("font-size","9pt");
               $("#msg_pw_check").css("color","red");
               $("#msg_pw_check").css("font-weight","bold");
               $("#msg_pw_check").text("입력하신 비밀번호가 일치하지 않습니다. 다시 확인해 주세요.");
               $('#pw_check').focus();
               return false;
            } else {
               $("#pw_validate").val("Y");
            }
            
            if ($('#pw_validate').val() != "Y") {
               $("#msg_pw_check").css("font-size","9pt");
               $("#msg_pw_check").css("color","red");
               $("#msg_pw_check").css("font-weight","bold");
               $("#msg_pw_check").text("입력하신 비밀번호가 서로 일치하지 않습니다. 다시 확인해 주세요.");
               $('#pw_check').focus();
               return false;
           }
            
           var pw = document.getElementById("pw").value;
            var isPW = /^[a-z0-9][a-z0-9_\-]{8,16}$/;
             if (!isPW.test(pw)) {
                $("#msg_pw").text("8~16자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.");
                $("#pw").val("");
                $("#pw").focus();
                return false;
             }

      });
   });
</script>
<script>
function inputPw(){
   $("#msg_pw_check").css("font-size","9pt");
   $("#msg_pw_check").css("color","red");
   $("#msg_pw_check").css("font-weight","bold");
   $('#pw_validate').val("N");
}
</script>
<div id="bodyWrapper">
   <div class="pWChangeFormNavi">
      <div class="pWChangeFormNaviMenuDiv">
         <div class="pWChangeFormimageDiv">
            <a href="/mvProject/main/index.do"> <img
               src="../res/image/main/homeImage.png">
            </a>
         </div>

         <div class="pWChangeFormimageDivSecondDiv">
            <a href="/mvProject/main/loginForm.do">> 회원서비스</a>
         </div>

         <div class="pWChangeFormimageDivThirdDiv">
            <a href="/mvProject/main/loginForm.do">> 로그인</a>
         </div>

         <div class="pWChangeFormimageDivFourthDiv">
            <a href="/mvProject/member/pwSearchForm.do">> 비밀번호찾기</a>
         </div>
      </div>
   </div>

   <form action="/mvProject/member/pwChangeResult.do" method="post">
   <div class="pWChangeFormWrapper">

       <div class="pWChangeFormTitle">
         <h1>새로운 비밀번호 설정</h1>
         <p>본인확인 절차가 모두 완료되었습니다.</p>
         <p>기존 비밀번호는 사용이 불가능하며, 새로운 비밀번호를 등록해 주시기 바랍니다. </p>
      </div>

         <div class="pWChangeFormContent">
            <div class="inputPwDiv">
               <input type="hidden" name="id" value="${id }">
               <div class="inputPwLabelDiv">
                  <h3>새 비밀번호</h3>
               </div>
               <input type="password" id="pw" name="pw" onkeydown="javascript:inputPw();" maxlength="16">
               <input type="hidden" id="pw_validate" name="pw_validate" value="">
               <div id="msg_pw"></div>
            </div>
            <div class="oneMoreInputPwDiv">
               
               <div class="oneMoreInputPwLabelDiv">
                  <h3>새 비밀번호 확인</h3>
               </div>               
               <input type="password" id="pw_check" name="pw_check" onkeydown="javascript:inputPw();" maxlength="16">
               <div id="msg_pw_check"></div>
            </div>
         </div>

         <div class="pWChangeFormButton">
            <input type="submit" value="확인" class="pwChangeConfirmButton" id="btn_submit">
         </div>
      </div>
      </form>
   </div>