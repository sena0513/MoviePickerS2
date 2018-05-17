<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

</head>
<body>
<c:choose>
<c:when test="${result.size()>0}">
<jsp:include page="../admininclude/admintop.jsp"/>
      <div id=body>
         <div class=body1></div>
         <div class=body2></div>
         <div class=body3 id=body3>
         </div>
      </div>
      <jsp:include page="../admininclude/adminbottom.jsp"/>
</c:when>
<c:otherwise>
<link rel="stylesheet" href="../res/css/admincss/loginstyle.css">
   <body class="align">
  <div class="site__container">
    <div class="grid__container">
      <form action="login.do" method="post" class="form form--login">
        <div class="form__field">
          <label class="fontawesome-user" for="login__username"><span class="hidden">AdminName</span></label>
          <input name="adminid" type="text" class="form__input" placeholder="AdminName" required>
        </div>
        <div class="form__field">
          <label class="fontawesome-lock" for="login__password"><span class="hidden">Password</span></label>
          <input name="adminpw" type="password" class="form__input" placeholder="AdminPw" required>
        </div>
        <div class="form__field">
          <input type="submit" value="Log In">
        </div>
      </form>
      <p class="text--center">Not a member? <a href="#">Sign up now</a> <span class="fontawesome-arrow-right"></span></p>
    </div>
  </div>
</c:otherwise>
</c:choose>
</form>
</body>
</html>