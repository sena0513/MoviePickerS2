<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="<c:url value="../res/css/myPage/profile.css" />" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<title>myProfile</title>
<script type="text/javascript">
$(document).ready(function(){
      $("#confirmNickNameButton").click(function(){                 
      if($("#nickNameText").val()==""||$("#nickNameText").val()==null){
         $("#nicknameDIV").text("닉네임을 입력 하세요.");
         $("#nicknameDIV").css("color","red");
      }else{
         $.ajax({
            type:"POST",
            url : "/mvProject/myPage/nicknameCheck.do",
            data:"nickNameText="+$("#nickNameText").val(),
            dataType:"text",
            success: function(data){
               if(data=="exist"){
                  $("#nicknameDIV").text("이미 존재하는 닉네임 입니다.");
                  $("#nicknameDIV").css("color","red");
               }else if(data=="non_exist"){
                  $("#nicknameDIV").text("사용가능한 닉네임 입니다.");
                  $("#nicknameDIV").css("color","blue");
                  $('#hidden_nicknameCheck').val($('#nickNameText').val());
               }
            }
         })
      }
      });
      
      $('#delete_image').on('click', function () {
           if (!confirm('설정된 프로필 이미지를 삭제 하시겠습니까?'))
               return;
           $('#profile_image').attr('src', '../res/image/default_profileImage.png');
           $('#delete_image').remove();
           location.href="/mvProject/myPage/profileImgDelete.do";
       });
      
      $("#cancle_button").click(function(){
         window.close();
      });
      
      $("#ok_button").click(function(){
        var nickNameText = document.getElementById("nickNameText").value;
           var isNICKNAME =  /^[가-힣A-Za-z0-9]{2,6}$/;
            if (!isNICKNAME.test(nickNameText)) {
               alert("2~6자의 한글,영문,숫자만 사용 가능합니다.");
               $("#nickNameText").val("");
               $("#nickNameText").focus();
               return false;
            }
         
         if ($('#nickNameText').val().length < 1 || $('#nickNameText').val().length > 7) {
               alert("2~6자리로 닉네임을 설정해 주세요.");
               $('#nickNameText').focus();
               return false;
            }
         
         if($("#nickNameText").val()!=""||$("#nickNameText").val()!=null){
            $.ajax({
               type:"POST",
               url : "/mvProject/myPage/nickname_idCheck.do",
               data:"nickNameText="+$("#nickNameText").val(),
               dataType:"text",
               success: function(data){
                  if(data=="exist"){
                  $('#hidden_nicknameCheck').val($('#nickNameText').val());
                  $("#profileForm").submit();
                  window.close();
                  }else if(data=="non_exist"){
                     $.ajax({
                        type:"POST",
                        url : "/mvProject/myPage/nicknameCheck.do",
                        data:"nickNameText="+$("#nickNameText").val(),
                        dataType:"text",
                        success: function(data){
                           if(data=="exist"){
                              $("#nicknameDIV").text("이미 존재하는 닉네임 입니다.");
                              $("#nicknameDIV").css("color","red");
                           }else if(data=="non_exist"){
                              if($("#hidden_nicknameCheck").val()!=$("#nickNameText").val()){
                                 $("#nicknameDIV").text("닉네임 중복확인 하세요.");
                                 $("#nicknameDIV").css("color","red");
                              }else if($("#hidden_nicknameCheck").val()==$("#nickNameText").val()){
                              $("#profileForm").submit();
                              }
                           }
                        }
                     })
                  }
               }
            })
         }else if($("#hidden_nicknameCheck").val() != $("#nickNameText").val()){
            $("#nicknameDIV").text("닉네임 중복확인 하세요.");
            $("#nicknameDIV").css("color","red");
         }else{
         $("#profileForm").submit();
         }
      })
   });
</script>
<script type="text/javascript">
function fileCheck( file )
{
     // 사이즈체크
     var maxSize  = 3 * 1024 * 1024    //30MB
     var fileSize = 0;

   // 브라우저 확인
   var browser=navigator.appName;
   
   // 익스플로러일 경우
   if (browser=="Microsoft Internet Explorer")
   {
      var oas = new ActiveXObject("Scripting.FileSystemObject");
      fileSize = oas.getFile( file.value ).size;
   }
   // 익스플로러가 아닐경우
   else
   {
      fileSize = file.files[0].size;
   }
        if(fileSize > maxSize)
        {
            alert("첨부파일 사이즈는 3MB 이내로 등록 가능합니다.    ");
            return;
        }
        document.fileForm.submit();
}
</script>
</head>
<body>
<form method="post" enctype="multipart/form-data" action="/mvProject/myPage/profileWrite.do" id="profileForm" name="fileForm">
   <div id="bodyWrapper">
      <div class="contentsWrapper">
         
         <!----- labelWrapper ----->
         <div class="myProfileModifyLabel">
            <div class="koreanName"><h2>${name}님</h2></div>
            <div class="nickName"><h4>${nickname}</h4></div>
         </div>
         
         <div class="myProfileModifyContents">
            
            
            <div class="nickNameWrapper">
               <div class="nickNameLabel">
                  <h3>닉네임</h3>
               </div>
               
               <div class="nickNameContents">
                  <div class="nickNameStandard">
                     <h4>한글, 영문, 숫자 혼용 가능(한글 기준 6자 이내)</h4>
                  </div>
                  <div class="nickNameTextField">
                     <input type="text" id=nickNameText name="nickNameText" maxlength="6" value="${nickname}">
                     <input type="button" value="중복확인" id="confirmNickNameButton">
                     <input type="hidden" id="hidden_nicknameCheck" value="">
                 <div id="nicknameDIV"></div>
                  </div>
               </div>
               
            </div>
            
            <!----- proFileImageWrapper ----->
            <div class="profileImageWrapper">
               <div class="profileImageLabel">
                  <h3>프로필이미지</h3>
               </div>
               
               <div class="profileContentsWrapper">
                  <c:if test="${memberDTO2.profileImage ne null }">
                  <button type="button" id="delete_image" class="btn-del"><b>X</b></button>
                </c:if> 
                  <div class="profileContentsImage">
                  <c:choose>
                     <c:when test="${memberDTO2.profileImage eq null }">
                       <img id="profile_image" src="../res/image/default_profileImage.png">
                     </c:when>
                     <c:otherwise>
                  <img id="profile_image" src="../res/image/profile/${memberDTO2.profileImage }">
                     </c:otherwise>
                  </c:choose>
                  </div>   
                  
                  <div class="profileContentsWarning">
                     <h4>JPG, GIF, BMP 파일만 등록 가능합니다.(최대 3M)</h4>
                  </div>
                  
                  
                  <div class="choiceFileWrapper">
                     <input type="file" id="imageFile" name="img" accept="image/*">
                  </div>
               </div>
               
            </div>
            
            </div>
            
            <!-- ButtonWrapper -->
            
            <div class="myProfileModifyButtonWrapper">
               <input type="button" value="등록" class="ok_button" id="ok_button" onclick="fileCheck( this.form.img )">
               <input type="button" value="취소" class="cancle_button" id="cancle_button">
            </div>
      
      </div>
   
   </div>
   </form>
</body>
</html>