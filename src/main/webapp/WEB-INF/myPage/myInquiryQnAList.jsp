<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link href="<c:url value="../res/css/myPage/myInquiryQnAList.css" />"
   rel="stylesheet">
   <script type="text/javascript"
	src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
   
<script type="text/javascript">
   $(document).ready(
         function() {
            function makefunc(targetpage) {
               return function() {
                  $("#page").attr("action", targetpage);
                  $("#page").submit();
               };
            }
            ;
            $("#select-submit").click(
                  makefunc("/mvProject/myPage/myInquiryQnAList.do"));

         });
</script>


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

               <form action="/mvProject/myPage/qnaDelete.do?pg=${pg }" id="page">
                  <div class="option-Qna">
                     <p class="select-Qna">
                        <label>문의조회</label> <input type="text" id="searchtext"
                           name="searchtext"> <input type="button" value="검색하기"
                           id="select-submit">
                     </p>
                     <p class="delect-Qna">
                        총 ${QnaTotalA }건 <input type="submit" value="선택삭제"
                           id="btnDelete">
                     </p>
                     <script type="text/javascript">
                        $('#btnDelete')
                              .on(
                                    'click',
                                    function() {
                                       if ($("input[name=qna]:checked").length < 1) {
                                          alert("삭제할 문의건을 먼저 선택해 주세요.");
                                          return false;
                                       }

                                       if (!confirm("선택하신 문의건을 삭제하시겠습니까?"))
                                          return false;

                                       $('form').submit();
                                    });
                     </script>
                  </div>

                  <div class="table-area">
                     <table frame="hsides" rules="rows">
                        <thead>
                           <tr>
                              <th scope="col" width="60px"><input type="checkbox" id="all_qna">번호</th>
                              <th scope="col" width="60px">유형</th>
                              <th scope="col" width="570px">제목</th>
                              <th scope="col" width="100px">등록일</th>
                              <th scope="col" width="100px">상태</th>
                           </tr>

                        </thead>
                        <c:forEach var="QnaDTO" items="${QnaList }">
                           <tbody>
                              <tr>
                                 <td align="left"><input type="checkbox" id="qna${QnaDTO.seq }"
                                    name="qna" value="${QnaDTO.seq }"> <label
                                    for="qna${QnaDTO.seq }"><b>${QnaDTO.rn }</b></label></td>
                                 <td align="center">${QnaDTO.type }</td>
                                 <td align="left"><a
                                    href="/mvProject/myPage/myInquiryQnAView.do?seq=${QnaDTO.seq }&pg=${pg}&searchtext=${searchtext}">${QnaDTO.title }</a></td>
                                 <td align="center"><b>${QnaDTO.regidate }</b></td>
                                 <td align="center">${QnaDTO.situation }</td>
                              </tr>
                           </tbody>
                        </c:forEach>
                     </table>
                     <script>
                        $("#all_qna").click(
                              function() {
                                 if ($("#all_qna").prop("checked")) {
                                    $("input[name=qna]").prop(
                                          "checked", true);
                                 } else {
                                    $("input[name=qna]").prop(
                                          "checked", false);
                                 }
                              })

                        $("input[name=qna]")
                              .click(
                                    function() {
                                       if ($("input[name=qna]:checked").length == 5) {
                                          $("#all_qna")
                                                .prop(
                                                      "checked",
                                                      true);
                                       } else {
                                          $("#all_qna").prop(
                                                "checked",
                                                false);
                                       }
                                    })

                        var qna = "";
                        $("input:checkbox[name='qna']").each(
                              function() {
                                 if ($(this).attr("checked")) {
                                    if (qna !== "")
                                       qna += ",";
                                    qna += $(this).val();
                                 }
                              });
                     </script>
                  </div>
               </form>

               <div class="paging">${qnaPaging.pagingHTML }</div>

               <div class="wrap-box">
                  <div class="box-Qna">
                     <span class="qusetion_img"><img src="../res/image/question.png"></span>
                     <p class="question_p">자주하시는 질문<input type="button" value="바로가기" onclick="location.href='/mvProject/helpCenter/Qna_list.do'"></p>
                     <span class="question_span">고객님들께서 주로 하시는 질문에 대한 답변을<br>한곳에 모아두었습니다.</span>
                  </div>
                  <div class="box-Email">
                     <span class="support_img"><img src="../res/image/support.png"></span>
                     <p class="support_p">고객의 말씀<input type="button" value="바로가기" onclick="location.href='/mvProject/helpCenter/Qna_emailForm.do'"></p>
                     <span class="support_span">불편사항과 문의사항을 남겨주시면 친절히<br>답변드리겠습니다.</span>
                  </div>
               </div>

            </div>
         </div>


      </div>


   </div>
</div>