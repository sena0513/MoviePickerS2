<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link href="<c:url value="../res/css/main/index.css" />" rel="stylesheet">

<div id=wrapper>
   <jsp:include page="/include/header.jsp"></jsp:include>

   <jsp:include page="${display }"></jsp:include>
  	<c:if test="${movieReview ne null }">
  	<jsp:include page="${movieReview }"></jsp:include>
  	</c:if>
   

    <jsp:include page="/include/footer.jsp"></jsp:include>
</div> <!-- form div -->