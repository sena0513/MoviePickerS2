
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<link href="<c:url value="../res/css/member/registerForm.css" />"
   rel="stylesheet">

<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
$(document).ready(function(){   	
	// 비밀번호 입력
	$('#pw').keyup(function(){
		   if($(this).val()==0)
			   $('#msg_pw').text("비밀번호를 입력하세요").css("color","red").css("font-size","9pt").css("font-weight","bold");
		   else
			   $('#msg_pw').text("");
	});
	
	// 비밀번호 입력
	$('#pw_check').keyup(function(){
		   if($(this).val()==0)
			   $('#msg_pw_check').text("비밀번호 확인란을 입력하세요").css("color","red").css("font-size","9pt").css("font-weight","bold");
		   else
			   $('#msg_pw_check').text("");
	});

	
   // 아이디 중복확인
        $('#btn_idcheck').click(function(){
            if($("#id").val() == ""){
               alert("아이디를 입력하세요");
               $("#id").focus();
            }else if($('#id').val().length < 3 || $('#id').val().length > 13){
               alert("4~12자리의 영문 소문자 또는 영문 소문자+숫자 아이디를 입력해 주세요.");
                $('#id').focus();
            }else{
               $.ajax({
                  type : "POST",
                  url : "/mvProject/member/idCheck.do",
                  data : "id="+$('#id').val(),
                  dataType : "text",
                  success : function(data){
                     if(data=="exist"){
                        $("#msg_id").text("이미 사용중인 아이디 입니다.");
                        $("#msg_id").css("font-size","9pt");
                        $("#msg_id").css("color","red");
                        $("#msg_id").css("font-weight","bold");
                        
                     }else if(data=="non_exist"){
                        $("#msg_id").text("사용 가능한 아이디 입니다.");
                        $("#msg_id").css("font-size","9pt");
                        $("#msg_id").css("color","blue");
                        $("#msg_id").css("font-weight","bold");
                        $('#id_validate').val("Y");
                     }
                  }
               });
            }
         });
      
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
   
      $('#btn_submit').click(function(){
         if($('#name').val() == ""){
               alert("이름을 입력해주세요.");
               $('#name').focus();
               return false;
            }
            
           // 아이디 확인
            if ($('#id').val().length < 3 || $('#id').val().length > 13) {
               alert("4~12자리의 영문 소문자 또는 영문 소문자+숫자 아이디를 입력해 주세요.");
               $('#id').focus();
               return false;
            }

            if ($('#id_validate').val() != "Y") {
               alert("아이디 중복확인을 해주세요.");
               $('#id').focus();
               return false;
            }

            // 비밀번호 확인
            if ($('#pw').val().length < 7 || $('#pw').val().length > 17) {
               alert("8~16자리의 영문또는 영문+숫자 비밀번호를 입력해 주세요.");
               $('#pw').focus();
               return false;
            }
            $("#msg_pw").hide();

            if ($('#pw_check').val().length < 7 || $('#pw_check').val().length > 17) {
               alert("8~16자리의 영문또는 영문+숫자 비밀번호를 입력해 주세요.");
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
            
            if($("#birthyear").val() == ""){
               alert("입력하신 출생년도 부적절합니다.");
               $('#birthyear').focus();
                  return false;
             }
            
            if($("#birthmonth").val() == ""){
               alert("입력하신 출생월이 부적절합니다.");
               $('#birthmonth').focus();
                  return false;
             }
            
            if($("#birthday").val() == ""){
               alert("입력하신 출생일이 부적절합니다.");
               $('#birthday').focus();
                  return false;
             }
            
            if($("#phone2").val() == ""){
               alert("입력하신 핸드폰번호가 부적절합니다.");
               $('#phone2').focus();
                 return false;
            }
            
            if($("#phone3").val() == ""){
               alert("입력하신 핸드폰번호가 부적절합니다.");
               $('#phone3').focus();
                 return false;
            }
            
            if($("#email1").val() == ""){
               alert("입력하신 이메일 부적절합니다.");
               $('#email1').focus();
                 return false;
            }
            
            if($("#email2").val() == ""){
               alert("입력하신 이메일 부적절합니다.");
               $('#email2').focus();
                 return false;
            }
            
            // 이름 
            var name = document.getElementById("name").value;
            var isNAME = /^[가-힣]+$/
              if (!isNAME.test(name)) {
                 $("#msg_name").text("2~8자의 한글만 사용 가능합니다.");
                 $("#name").val("");
                 $("#name").focus();
                 return false;
              } 
            
            
           var id = document.getElementById("id").value;
           var isID = /^[a-z0-9][a-z0-9_\-]{4,12}$/;
            if (!isID.test(id)) {
               $("#msg_id").text("4~12자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.");
               $("#id").val("");
               $("#id").focus();
               return false;
            }
            
           var pw = document.getElementById("pw").value;
            var isPW = /^[a-z0-9A-Z][A-Za-z0-9_\-]{8,16}$/;
             if (!isPW.test(pw)) {
                $("#msg_pw").text("8~16자의 영문, 숫자와 특수기호(_),(-)만 사용 가능합니다.");
                $("#pw").val("");
                $("#pw").focus();
                return false;
             }
             
            // 생일
             var birthyear = document.getElementById("birthyear").value;
             var isBIRTHYEAR = /^[0-9]+$/;
              if (!isBIRTHYEAR.test(birthyear)) {
                 alert("출생년도에 부적절한 값이 들어갔습니다.");
                 $("#birthyear").val("");
                 $("#birthyear").focus();
                 return false;
              } 
             
            var birthmonth = document.getElementById("birthmonth").value;
            var isBIRTHMONTH = /^[0-9]+$/;
             if (!isBIRTHMONTH.test(birthmonth)) {
                alert("출생월에 부적절한 값이 들어갔습니다.");
                $("#birthmonth").val("");
                $("#birthmonth").focus();
                return false;
             }
             
            var birthday = document.getElementById("birthday").value;
            var isBIRTHDAY = /^[0-9]+$/;
             if (!isBIRTHDAY.test(birthday)) {
                alert("출생일에 부적절한 값이 들어갔습니다.");
                $("#birthday").val("");
                $("#birthday").focus();
                return false;
             }
        
             //핸드폰 번호
            var phone1 = document.getElementById("phone1").value;
             var isPHONE1 = /^[0-9]+$/;
              if (!isPHONE1.test(phone1)) {
                 alert("핸드폰에 부적절한 값이 들어갔습니다.");
                 $("#phone1").val("");
                 $("#phone1").focus();
                 return false;
              } 
              
            var phone2 = document.getElementById("phone2").value;
            var isPHONE2 = /^[0-9]+$/;
             if (!isPHONE2.test(phone2)) {
                alert("핸드폰에 부적절한 값이 들어갔습니다.");
                $("#phone2").val("");
                $("#phone2").focus();
                return false;
             } 
             
            var phone3 = document.getElementById("phone3").value;
            var isPHONE3 = /^[0-9]+$/;
             if (!isPHONE3.test(phone3)) {
                alert("핸드폰에 부적절한 값이 들어갔습니다.");
                $("#phone3").val("");
                $("#phone3").focus();
                return false;
             } 
             
             
             // 이메일 유효성
             var email1 = document.getElementById("email1").value;
            var isEMAIL1 = /^[A-Za-z0-9_\-]{4,16}$/;
           if (!isEMAIL1.test(email1)) {
               alert("이메일에 부적절한 값이 들어갔습니다.");
               $("#email1").val("");
               $("#email1").focus();
               return false;
            } 
           
          var email2 = document.getElementById("email2").value;
            var isEMAIL2 = /^[A-Za-z0-9.]{4,30}$/;
            if (!isEMAIL2.test(email2)) {
                alert("이메일에 부적절한 값이 들어갔습니다.");
                $("#email2").val("");
                $("#email2").focus();
                return false;
             } 
      });
   });

</script>
<script>
// 아이디
function inputId(){
   $('#id_validate').val("N");
   $("#msg_id").css("font-size","9pt");
   $("#msg_id").css("color","red");
   $("#msg_id").css("font-weight","bold");
   $("#msg_id").text("아이디 중복체크를 확인해주세요.");
}

function checkId(event){
   var id = document.getElementById("id").value;
   var isID = /^[a-z0-9][a-z0-9_\-]{4,12}+$/;
    if (!isID.test(id)) {
       $("#msg_id").text("4~12자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.");
         $("#id").focus();
       return false;
    }
}

function inputPw(){
   $("#msg_pw_check").css("font-size","9pt");
   $("#msg_pw_check").css("color","red");
   $("#msg_pw_check").css("font-weight","bold");
   $('#pw_validate').val("N");
}

// 회원가입 취소
function goCancel() {
    if (!confirm('회원가입을 취소하시겠습니까?'))
       return;
    if ('' == '') {
       location.href = '/mvProject/main/index.do';
    } 
 }
 
//숫자 체크
function maxLengthCheck(object){
      if (object.value.length > object.maxLength){
       object.value = object.value.slice(0, object.maxLength);
      }    
}
</script>
<div id=wrapper>

   <div class="bodyWrapper">
      <!-- 네비부분 -->
      <div class="helpCenterIndexNavi">
         <div class="helpCenterIndexMenuDiv">
            <div class="helpCenterIndexImageDiv">
               <a href="/mvProject/main/index.do"> <img
                  src="../res/image/main/homeImage.png">
               </a>
            </div>

            <div class="helpCenterIndexNaviSecondDiv">
               <a href="/mvProject/main/loginForm.do">> 회원</a>
            </div>

            <div class="helpCenterIndexNaviThirdDiv">
               <a href="/mvProject/member/registerForm.do">> 회원가입</a>
            </div>
         </div>
      </div>

      <!-- 실질적인 회원가입 부분 -->
      <div class="contents">
         <div class="regi_title">
            <h1>회원가입</h1>
            <p>라이프스타일 멤버쉽 CJ ONE! 엔터테인먼트 서비스를 편하게 즐기세요~</p>
         </div>
         <div class="member_join">
            <div class="member_info">
               <form method="post" action="/mvProject/member/register.do"
                  name="registerForm">
                  <div class="table_header">
                     <h3 class="regi_title">기본정보</h3>
                     <div class="info">
                        <p>표시는 필수 입력 항목입니다.</p>
                     </div>
                  </div>
                  <div class="table_area">
                     <table border="1">
                        <tbody>
                           <tr>
                              <th scope="row"><label>이름</label></th>
                              <td><input type="text" id="name" name="name" minlength="2" maxlength="8"></td>
                           </tr>
                           <tr>
                              <th scope="row"><label>아이디</label></th>
                              <td><input type="text" id="id" name="id" minlength="4" maxlength="12"
                                 onkeydown="javascript:inputId();checkId()">
                                 <button class="btn_idcheck" type="button" id="btn_idcheck">중복확인</button>
                                 <input type="hidden" id="id_validate" name="id_validate"
                                 value="">
                                 <div id="msg_id"></div>
                           </tr>
                           <tr>
                              <th scope="row"><label>비밀번호</label></th>
                              <td><input type="password" id="pw" name="pw" minlength="8" maxlength="16"
                                 onkeydown="javascript:inputPw();"> <input
                                 type="hidden" id="pw_validate" name="pw_validate" value="">
                                 <div id="msg_pw"></div></td>
                           </tr>
                           <tr>
                              <th scope="row"><label>비밀번호 확인</label></th>
                              <td><input type="password" id="pw_check" name="pw_check" minlength="8" maxlength="16"
                                 onkeydown="javascript:inputPw();">
                                 <div id="msg_pw_check"></div></td>
                           </tr>
                           <tr>
                              <th scope="row"><label>생년월일</label></th>
                              <td><input type="number" id="birthyear" name="birthyear"
                                 maxlength="4"   max="9999" oninput="maxLengthCheck(this)" min="1900"> <span class="symbol">년</span> <input
                                 type="number" id="birthmonth" name="birthmonth" min="1" maxlength="2" max="12" oninput="maxLengthCheck(this)">
                                 <span class="symbol">월</span> <input type="number" min="1"
                                 id="birthday" name="birthday" maxlength="2" max="31" oninput="maxLengthCheck(this)"> <span
                                 class="symbol">일</span></td>
                           </tr>
                           <tr>
                              <th scope="row"><label>휴대전화</label></th>
                              <td><select id="phone1" name="phone1" maxlength="4"
                                 minlength="3">
                                    <option value="010" selected="selected">010</option>
                                    <option value="011">011</option>
                                    <option value="016">016</option>
                                    <option value="017">017</option>
                                    <option value="018">018</option>
                                    <option value="019">019</option>
                                    <option value="070">070</option>
                                    <option value="0130">0130</option>
                                    <option value="0303">0303</option>
                                    <option value="0502">0502</option>
                                    <option value="0504">0504</option>
                                    <option value="0505">0505</option>
                                    <option value="0506">0506</option>
                              </select> <span class="symbol">-</span> <input type="text"
                                 minlength="3" max="9999" maxlength="4" id="phone2" name="phone2" oninput="maxLengthCheck(this)">
                                 <span class="symbol">-</span> <input type="text"
                                 minlength="3" max="9999" maxlength="4" id="phone3" name="phone3" oninput="maxLengthCheck(this)">
                              </td>
                           </tr>
                           <tr>
                              <th scope="row"><label>이메일</label></th>
                              <td><input type="text" id="email1" name="email1" minlength="2"
                                 maxlength="15"> <span class="symbol">@</span> <input
                                 type="text" id="email2" name="email2" minlength="2" maxlength="30">
                              </td>
                           </tr>
                        </tbody>
                     </table>
                  </div>

                  <div class="btn_select">
                     <button type="button" class="btn_cancle"
                        onclick="javascript:goCancel();">취소</button>
                     <button type="submit" class="btn_submit" id="btn_submit">등록</button>
                  </div>
               </form>
            </div>
         </div>
      </div>

   </div>
</div>