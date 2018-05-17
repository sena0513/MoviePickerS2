<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link href="<c:url value="../res/css/helpCenter/helpCenter-main.css" />"
   rel="stylesheet">

<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
   $(document).ready(function() {

      $("#btn_submit").click(function() {         
         
         var searchtext = document.getElementById("searchtext").value;
         var isSEARCHTEXT = /^[A-Za-z0-9가-힣\s_\-]{2,11}$/;
         if (!isSEARCHTEXT.test(searchtext)) {
            alert("2~12자의 한글 및 숫자와 특수기호(_),(-)만 사용 가능합니다.");
            $("#searchtext").val("");
            $("#searchtext").focus();
            return false;
         }

      });
   });
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
               <a href="/mvProject/helpCenter/index.do">> 고객센터</a>
            </div>

            <div class="helpCenterIndexNaviThirdDiv">
               <a href="/mvProject/helpCenter/index.do">> 메인</a>
            </div>
         </div>
      </div>

      <!-- -------------------컨텐츠----------------- -->
      <div class="content">

         <!--  왼쪽 메뉴 클릭 부분 -->
         <div class="col-aside">
            <div class="side_menu">
               <ul>
                  <li><a href="/mvProject/helpCenter/index.do">고객센터 메인</a></li>
                  <li><a href="/mvProject/helpCenter/Qna_list.do">자주찾는 질문</a></li>
                  <li><a href="/mvProject/helpCenter/notice_list.do">공지/뉴스</a></li>
                  <li><a href="/mvProject/helpCenter/Qna_emailForm.do">일대일
                        문의</a></li>
               </ul>
            </div>
            <!-- side_menu -->
         </div>
         <!-- col-aside -->

         <!-- 오른쪽 전체메뉴부분 -->
         <div class="col-detail">

            <!-- 자주찾는 질문 / 이메일 문의 / 자주찾는 서비스 -->
            <div class="wrap-box">
               <div class="qna_search">
                  <div class="title_div">
                     <span class="img"><img src="../res/image/돋보기.png"
                        width="60px" height="60px"></span> <span class="qna_search_title">자주찾는
                        질문</span>
                  </div>
                  <form action="/mvProject/helpCenter/Qna_list.do">
                     <div class="search_box">
                        <input type="text" placeholder="검색어를 입력해주세요." name="searchtext"  id="searchtext" minlength="2" maxlength="20">
                        <input type="submit" id="btn_submit" value="검색하기">
                     </div>

                  </form>
               </div>
               <div class="email_inquiry">
                  <div class="title_div">
                     <span class="img"><img src="../res/image/일대일.png"
                        width="60px" height="60px"></span> <span
                        class="email_inquiry_title">일대일 문의</span>
                     <p class="qna_p">24시간 365일 언제든지 문의해주세요.</p>
                     <span><input type="button" value="문의하기"
                        onclick="location.href='/mvProject/helpCenter/Qna_emailForm.do'"></span>
                  </div>
               </div>
               <div class="service_area">
                  <div class="service_title_div">
                     <span class="service_title">자주찾는 서비스</span>
                  </div>
                  <div class="service_list" align="center">
                     <div class="service_list1">
                        <a href="/mvProject/member/idSearchForm.do">아이디/비밀번호 찾기</a>
                     </div>

                     <div class="service_list2">
                        <a href="/mvProject/myPage/myReservationStep1.do">예매/취소내역 확인</a>
                     </div>
                  </div>
               </div>
            </div>

            <div class="notice_area">
               <a href="#"><span class="title">공지/뉴스</span></a>
               <c:forEach var="NoticeBoardDTO" items="${NoticeList }">
                  <ul class="notice_list">
                     <li><a
                        href="/mvProject/helpCenter/notice_view.do?seq=${NoticeBoardDTO.seq }&pg=1">${NoticeBoardDTO.title }</a><span
                        class="day">${NoticeBoardDTO.logtime }</span></li>
                  </ul>
               </c:forEach>
            </div>

         </div>
         <!-- col-detail -->
      </div>
      <!-- content div -->

   </div>
</div>
