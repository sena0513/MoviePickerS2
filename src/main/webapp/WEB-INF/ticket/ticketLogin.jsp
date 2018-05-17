<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="<c:url value="../res/css/ticket/ticketLogin.css" />"
   rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
   
<script>
$('body').on('click', '.loginButton', function(){
   $.ajax({
      type:"POST",
      url:"/mvProject/ticket/ticketLogin.do",
      data:{"loginId" : $('.inputIdText').val(), 'loginPw':$('.inputPwText').val()},
      dataType:"json",
      success : function(data){
         if(data.result == "false"){
            alert("로그인에 실패했습니다.");
         }else{
            var ticketplayingmovie = $('.ticketplayingmovie').attr('value');
            var tickettheatermoviegrade = $('.tickettheatermoviegrade').attr('value');
            var ticketmovieposter = $('.ticketmovieposter').attr('value');
            var tickettheaterbranch = $('.tickettheaterbranch').attr('value');
            var tickettheaterdate = $('.tickettheaterdate').attr('value');
            var tickettheaterscreen = $('.tickettheaterscreen').attr('value');
            var tickettheatertime = $('.tickettheatertime').attr('value');
            var selectMovieSeq = $('.selectMovieSeq').attr('value');
            
            
            url = '/mvProject/ticket/ticketingStep1.do';
                 
            var $form = $("<form></form>");
                 
            $form.attr('action', url);
            $form.attr('method', 'POST');
            $form.appendTo('body');
            
              var hiTicketplayingmovie = $("<input type='hidden' value='"+ticketplayingmovie+"' name='ticketplayingmovie'>");
              var hiTickettheatermoviegrade = $("<input type='hidden' value='"+tickettheatermoviegrade+"' name='tickettheatermoviegrade'>");
              var hiTicketmovieposter = $("<input type='hidden' value='"+ticketmovieposter+"' name='ticketmovieposter'>");
              var hiTickettheaterbranch = $("<input type='hidden' value='"+tickettheaterbranch+"' name='tickettheaterbranch'>"); 
              var hiTickettheaterdate = $("<input type='hidden' value='"+tickettheaterdate+"' name='tickettheaterdate'>"); 
              var hiTickettheaterscreen = $("<input type='hidden' value='"+tickettheaterscreen+"' name='tickettheaterscreen'>"); 
              var hiTickettheatertime = $("<input type='hidden' value='"+tickettheatertime+"' name='tickettheatertime'>"); 
              var hiSelectMovieSeq = $("<input type='hidden' value='"+selectMovieSeq+"' name='selectMovieSeq'>"); 
              
              $form.append(hiTicketplayingmovie).append(hiTickettheatermoviegrade).append(hiTicketmovieposter).append(hiTickettheaterbranch).append(hiTickettheaterdate).append(hiTickettheaterscreen).append(hiTickettheatertime).append(hiSelectMovieSeq);
              $form.submit();
         }
      }
   });
});


</script>
<div id="bodyWrapper">
<input type='hidden' class='ticketplayingmovie' value='${ticketplayingmovie}'>
<input type='hidden' class='tickettheatermoviegrade' value='${tickettheatermoviegrade}'>
<input type='hidden' class='ticketmovieposter' value='${ticketmovieposter}'>
<input type='hidden' class='tickettheaterbranch' value='${tickettheaterbranch}'>
<input type='hidden' class='tickettheaterdate' value='${tickettheaterdate}'>
<input type='hidden' class='tickettheaterscreen' value='${tickettheaterscreen}'>
<input type='hidden' class='tickettheatertime' value='${tickettheatertime}'>
<input type='hidden' class='selectMovieSeq' value='${selectMovieSeq}'>
   <!-- navi부분 -->
   <div class="helpCenterIndexNavi">
      <div class="helpCenterIndexMenuDiv">
         <div class="helpCenterIndexImageDiv">
            <a href="/mvProject/main/index.do"> <img
               src="../res/image/main/homeImage.png">
            </a>
         </div>

         <div class="helpCenterIndexNaviSecondDiv">
            <a href="/mvProject/main/loginForm.do">> 회원 서비스</a>
         </div>

         <div class="helpCenterIndexNaviThirdDiv">
            <a href="/mvProject/main/loginForm.do">> 로그인</a>
         </div>
      </div>
   </div>

    <!-- 실질적인 컨텐츠부분 -->
   <div class="loginTotalWrapper">

      <div class="loginContentsWrapper">
         
         <div class="loginContentsImage">
            <img src="../res/image/main/loginLogo.png">
         </div>
         
         
         <div class="inputIdDiv">
            <div class="inputIdTextImageDiv">
               <img src="../res/image/main/realIdIcon.png">
            </div>

            <div class="inputIdTextDiv">
               <input type="text" name="inputIdText" class="inputIdText"
               maxlength="12">
            </div>
         </div>

         <div class="inputPwDiv">
            <div class="inputPwTextImageDiv">
               <img src="../res/image/main/realPwIcon.png">
            </div>

            <div class="inputPwTextDiv">
               <input type="password" name="inputPwText" class="inputPwText"
               maxlength="20">
            </div>
         </div>

         <div class="loginButtonDiv">
            <button class="loginButton">로그인</button>
         </div>

         <div class="loginSubContentsDiv">
            
            <div class="searchIdDiv">
               <h4>
                  <a href="/mvProject/member/idSearchForm.do">아이디 찾기 ></a>
               </h4>
            </div>

            <div class="searchPwDiv">
               <h4>
                  <a href="/mvProject/member/pwSearchForm.do">비밀번호 찾기 ></a>
               </h4>
            </div>

         </div>

      </div>
   </div>
</div>