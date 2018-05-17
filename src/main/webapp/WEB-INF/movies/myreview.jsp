<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.1.min.js"></script>

<link href="<c:url value="../res/css/movies/myReview.css" />"
   rel="stylesheet">



<div id="bodyWrapper">
   <!-- Navi부분 -->
   <div class="myReviewNavi">
      <div class="myReviewMenuDiv">
         <div class="myReviewImageDiv">
            <a href="/mvProject/main/index.do"> <img
               src="../res/image/main/homeImage.png">
            </a>
         </div>

         <div class="myReviewSecondDiv">
            <a href="/mvProject/movieChart/movieChart.do">> 영화</a>
         </div>

         <div class="myReviewThirdDiv">
            <a href="/mvProject/moviePoint/moviePoint.do">> 평점</a>
         </div>

         <div class="myReviewFourthDiv">> 내가 쓴 평점</div>
      </div>
   </div>


   <div class="contents">

      <!-- ----------Top of top----------------------------- -->

      <div class="submenu">
         <div class="gradeLabel"><h1>평점</h1></div>
         
         <div class="myGradeLabel">
            <h4><a href="/mvProject/moviePoint/myreview.do">내가 쓴 평점</a></h4>
         </div>
         
         <div class="normalGradeLabel">
            <h4><a href="/mvProject/moviePoint/moviePoint.do" title="선택">일반평점</a></h4>
         </div>
      </div>

      <div class="review_wrapper">
      	<c:if test="${list.size()>0}">
         <c:forEach items="${list}" var="list">
         <div class="review_box">
            
            <div class=review_movieList>
               
               <div class="review_movieList_poster">
                  <a
                     href="/mvProject/movieDetail/movieDetail.do?seq=${MovieplatformDTO[status.index].seq}"
                     style="position: absolute;"> <img
                     src="../res/image/moviePoster/${MovieplatformDTO[status.index].posterimg }" class=movieList_poster
                     onERROR="this.src='../res/image/moviePoster/poster_preparing.jpg'">
                  </a> <img src="../res/image/movies/agelim_15.png" class=grade_image
                     onERROR="this.src='../res/image/moviePoster/onerror_age.png'">
               </div>

               <div class="review_movieList_detail">
                  
                  <div class="review_movieList_detail_Label_Wrapper">
                     <div class="review_movieList_detail_movieNameKr">
                        <h2>${list.movienameforkr} </h2>
                     </div>
                     
                     <div class="delete_review">
                        <a href="/mvProject/adminreport/deletereview.do?rev_seq=${list.rev_seq}">
                           <img src="../res/image/movies/delete.png" class="deleteBtn">
                        </a>
                     </div>
                  </div>
                  
                  
                  
                  <div class="firstContentsDiv">
                     <div class="evaluate_image">
                        <img src="../res/image/movies/egg.png" class=evaluate_realimage>
                     </div>
                     <div class="review_movieList_detail_id">${list.id}</div>
                     <div class="review_movieList_detail_time">${list.reviewdate}</div>
                  </div>
                  
                  
                  
                  <div class="review_movieList_detail_eval">
			                     ${list.reviewcontents}
                  </div>


                  <div class="secondContentsDiv">
                     <div class="review_movieList_detail_modify">
                        <a href="#">수정하기</a>
                     </div>
                     
                     <div class="evaluate_image">
                        <img src="../res/image/movies/egg.png" class=evaluate_realimage>
                     </div>
                     
                     <div class="evaluate_text">좋아요 개수</div>
                  </div>
                  
               </div>
               
            </div>
         </div>
         <script>
         /* $(".deleteBtn${list.rev_seq}").click(function() {
			location.href = "";
		 }) */
         </script>
         </c:forEach>
      	</c:if>
      </div>
 <div class=paging>
	${myreviewPaging.pagingHTML}
 </div>
   </div>
   <!-- contents div -->
</div>
<!-- bodyWrapper div -->