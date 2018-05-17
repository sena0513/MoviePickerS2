<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="<c:url value="../res/css/main/loginForm.css" />"
   rel="stylesheet">
   <script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
   
   <script type="text/javascript">
    if(${reLogin != null} ) alert("로그인에 실패하였습니다.");
   </script>
   
<div id="bodyWrapper">
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
	
	 <c:if test="${returnURL eq 'moviePoint'}">
	<form action="/mvProject/member/moviePointlogin.do" method="post">
	<div class="loginContentsWrapper">
         
         <div class="loginContentsImage">
            <img src="../res/image/main/loginLogo.png">
         </div>
         <input type="hidden" name="returnURL" value="${returnURL }">
			<input type="hidden" name="mv_seq" value="${mv_seq }">
         
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
      </form>
	</c:if>
	
	<c:if test="${returnURL eq null}">
	<form action="/mvProject/member/login.do" method="post">
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
      </form>
	</c:if>
   </div>
</div>