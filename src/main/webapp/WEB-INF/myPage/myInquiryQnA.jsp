<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="<c:url value="../res/css/myPage/myInquiryQnA.css" />"
   rel="stylesheet">
<fmt:parseDate var="regiDate" value="${qnaDTO.regidate}" pattern="yyyy-MM-dd HH:mm:ss" />
<fmt:parseDate var="replyDate" value="${qnaDTO.replydate}" pattern="yyyy-MM-dd HH:mm:ss" />
<!-- 바디를 전체감싸고있는 Wrapper -->

<div id="bodyWrapper">
   <!-- 네비부분 -->
   <div class="helpCenterIndexNavi">
      <div class="helpCenterIndexMenuDiv">
         <div class="helpCenterIndexImageDiv">
            <a href="/mvProject/main/index.do"> <img
               src="../res/image/main/homeImage.png">
            </a>
         </div>

         <div class="helpCenterIndexNaviSecondDiv">
            <a href="/mvProject/myPage/index.do">> My MoviePicker</a>
         </div>

         <div class="helpCenterIndexNaviThirdDiv">
            <a href="/mvProject/myPage/myInquiryQnAList.do">> My Inquiry QnA</a>
         </div>
      </div>
   </div>

   <!-- 실질적인 컨텐츠부분 -->

   <div class="moviePickerTotalWrapper">

      <div class="myCgvProfileContentsDiv">
         <img src="../res/image/myPage/myCgvProfileRealBackGround.jpg"
            class="myCgvProfileContentsDivImg">
         <div class="myCgvProfileFirstContents">

            <div class="profileImageContents">
               <img src="../res/image/myPage/profileimage.png">
            </div>

            <div class="secondMyCgvProfileRealContents">
					<div class="profileNameDiv">
						<div class="firstNameDiv">
							<h2>${memberDTO.name }님</h2>
						</div>
						<div class="secondNameDiv">
							<h4>${memberDTO.id }</h4>
						</div>
						
					</div>

					<div class="profileGradeDiv">
						<h3>
							고객님은 <span>${memberDTO.grade }</span>입니다.
						</h3>
					</div>

				</div>
         </div>

         <div class="myCgvProfileSecondContents">
            <div class="myCgvCouponDiv">
               <div class="couponLabelDiv">
                  <img src="../res/image/myPage/mycoupon.png">
               </div>

               <div class="couponContentDiv">
                  <div class="movieTicketLabel">
                     <h4>영화관람권</h4>
                  </div>
                  <div class="movieTicketCount">${memberDTO.couponNumber }개</div>
               </div>
            </div>
            <div class="myCgvOnePointDiv">
               <div class="onePointLabelDiv">
                  <img src="../res/image/myPage/realMyPoint.png">
               </div>

               <div class="onePointContentsDiv">
                  <div class="possiblePoint">
                     <div class="possiblePointLabel">
                        <h4>CJ ONE 사용가능 포인트</h4>
                     </div>
                     <div class="possiblePointValue">
                        <h4><fmt:formatNumber pattern="#,###" value="${memberDTO.memberPoint }"/>점</h4>
                     </div>
                  </div>
                  <div class="vipCheckPoint">
                     <div class="vipCheckPointLabel">
                        <h4>VIP선정 포인트</h4>
                     </div>
                     <div class="vipCheckPointValue">
                        <h4><fmt:formatNumber pattern="#,###" value="${memberDTO.gradePoint }"/>점</h4>
                     </div>
                  </div>
               </div>
            </div>
            
         </div>
         
      </div>

      <!-- leftDiv+centerDiv를 포함하고있는 Wrapper -->
      <div class="bothDivWrapper">

         <!-- leftDiv -->
            <div class="leftDiv">
				<div class="mvHome">
					<span> <a href="/mvProject/myPage/index.do">MY HOME</a>
					</span>
				</div>
				<ul>
					<li class="myReservation"><a href="/mvProject/myPage/myReservationStep1.do">나의 예매내역</a></li>
					<li class="discountCoupon"><a href="/mvProject/myPage/movieticket.do">MY 영화관람권</a></li>
					<li class="mvPoint"><a href="/mvProject/myPage/mypoint.do">MY 포인트</a></li>
					<li class="clientInfo"><a href="/mvProject/myPage/index.do">회원 정보</a>
						<div class="inLineUlDivFirst">
							<ul>
								<li><a href="/mvProject/myPage/myInfoForm.do"> > 개인정보 변경</a></li>
								<li><a href="/mvProject/myPage/myInfoDelete.do"> > 회원탈퇴</a></li>
							</ul>
						</div></li>
					<li class="myInquiryList"><a
						href="/mvProject/myPage/myInquiryQnAList.do">나의 문의 내역</a></li>
					<li class="watchMovieList"><a href="/mvProject/myPage/myMovielog.do">내가 본 영화</a></li>
				</ul>
			</div>
         <!-- centerDiv -->
         <div class="centerDiv">
            <div class="myInquiryQnAWrapper">
               <div class="myInquiryQnaLabel">
                  <h3>나의문의내역</h3>
               </div>

               <div class="myInquiryLabel">
                  <h4>1:1문의</h4>
               </div>

               <div class="myInquiryQnaSubjectDiv">
                  <div class="myInquiryQnaSpanDiv">
                     <span>${qnaDTO.situation }</span>
                  </div>
                  <div class="myInquiryQnaRealSubjectDiv">
                     <h5>${qnaDTO.title }</h5>
                  </div>
                  <div class="myInquiryQnaDateDiv">
                     <div class="myInquiryQnaDateSubjectDiv">등록일</div>
                     <div class="myInquiryQnaMonthDiv">
                        <fmt:formatDate value="${regiDate }" pattern="yyyy.MM.dd" />
                     </div>
                  </div>
               </div>

               <div class="myInquiryQnaSubTitle">
                  <div class="phoneNumberWrapper">
                     <div class="phoneNumberLabel">연락처</div>
                     <div class="phoneNumberContents">${qnaDTO.phone1 }-${qnaDTO.phone2 }-${qnaDTO.phone3 }</div>
                  </div>

                  <div class="emailWrapper">
                     <div class="emailLabel">이메일</div>
                     <div class="emailContents">${qnaDTO.email1 }@${qnaDTO.email2 }</div>
                  </div>
               </div>

               <div class="myInquiryQnaContentsDiv">
                  <pre>
      ${qnaDTO.contents }
         </pre>
               </div>
				
			   <c:if test="${qnaDTO.replycontents != null}">
               <div class="myInquiryQnaReplyWrapper">
                  <div class="myInquiryQnaReplyDiv">

                     <div class="myInquiryQnaReplySpanDiv">
                        <span>답변</span>
                     </div>

                     <div class="myInquiryQnaReplyDateDiv">
                        <div class="myInquiryQnaReplyDateSubjectDiv">답변일</div>
                        <div class="myInquiryQnaReplyMonthDiv">
                           <fmt:formatDate value="${replyDate }" pattern="yyyy.MM.dd" />
                        </div>
                     </div>
                  </div>

                  <div class="myInquiryQnaReplyContents">
                     <pre>
						${qnaDTO.replycontents }
					 </pre>
                  </div>

               </div>
				</c:if>
               <div class="myInquiryQnaButtonDiv">
                  <input type="button" value="삭제" id="deleteBtn" onclick="location.href='/mvProject/myPage/qnaDelete.do?qna=${qnaDTO.seq}'"> <input
                     type="button" value="목록" class="listButton"
                     onclick="location.href='/mvProject/myPage/myInquiryQnAList.do?pg=${pg}'">
               </div>

            </div>
         </div>


      </div>


   </div>
</div>