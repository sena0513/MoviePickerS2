<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link href="<c:url value="../res/css/myPage/myInfoDelete.css" />"
   rel="stylesheet">
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script>
$(document).ready(function(){      
      $('#btn_submit').click(function(){
         if ($('#pw').val() == "") {
              alert("비밀번호를 입력해주세요.");
              $('#pw').focus();
              return false;
           }
         
           var pw = document.getElementById("pw").value;
           var isPW = /^[A-Za-z0-9_\-]+$/;
             if (!isPW.test(pw)) {
             alert("비밀번호에 유효하지 않은 문자가 들어갔습니다.");
             $("#pw").val("");
             $("#pw").focus();
           return false;
         }
           
             
             if (confirm('회원탈퇴를 하시겠습니까?')){
                $("#deleteMember").attr("action", "/mvProject/myPage/myInfoDeleteResult.do");
                $("#deleteMember").attr("method", "post");
                 $("#deleteMember").submit();
                
             }else{
                 location.href = '/mvProject/myPage/index.do';
             }      
             
         
      });
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
            <a href="/mvProject/myPage/myInfoDelete.do">> 회원 탈퇴</a>
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

         <div class="myCgvProfileContentsDiv">
			<img src="../res/image/myPage/myCgvProfileRealBackGround.jpg"
				class="myCgvProfileContentsDivImg">
			<div class="myCgvProfileFirstContents">

				<div class="profileImageContents">
					<c:choose>
                  <c:when test="${memberDTO.profileImage eq null}">
                     <img src="../res/image/myPage/profileimage.png">
                  </c:when>
                  <c:otherwise>
                     <img src="../res/image/profile/${memberDTO.profileImage }">
                  </c:otherwise>
               </c:choose>
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
								<h4>
									<fmt:formatNumber pattern="#,###"
										value="${memberDTO.memberPoint }" />
									점
								</h4>
							</div>
						</div>
						<div class="vipCheckPoint">
							<div class="vipCheckPointLabel">
								<h4>VIP선정 포인트</h4>
							</div>
							<div class="vipCheckPointValue">
								<h4>
									<fmt:formatNumber pattern="#,###"
										value="${memberDTO.gradePoint }" />
									점
								</h4>
							</div>
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
            <div class="deleteUserLabel">
               <h3>회원 탈퇴</h3>
            </div>
            
            <div class="deleteUserInfo">
               <span>고객님의 개인정보 보호를 위한 절차이오니, Movie Picker 로그인 시 사용하는 비밀번호를 입력해 주세요.
               </span>
               <br><br>
               <span>
                     확인을 누를 시 회원 탈퇴가 정상적으로 처리 되오니, 신중하게 생각하여 결정해 주시기 바랍니다. 
               </span>
            </div>
            <form action="/mvProject/myPage/myInfoDeleteResult.do" method="post" id="deleteMember">
            <div class="inputTypeIdAndPwDiv">
               <div class="inputTypeIdWrapper">
                  <div class="inputTypeIdLabelDiv">
                     <h4>아이디</h4>
                  </div>
                  
                  <div class="inputTypeIdTextDiv">
                     <input type="text" value="${id }" class="inputTypePwText" maxlength="20" readonly="readonly" style="background-color: #fcfcf0;border: 0px; font-weight: bold;">
                  </div>
               </div>
               
               <div class="inputTypePwWrapper">
                  <div class="inputTypePwLabelDiv">
                     <h4>비밀번호</h4>
                  </div>
                  
                  <div class="inputTypePwTextDiv">
                     <input type="password" name="pw" class="inputTypePwText" id="pw" maxlength="20">
                  </div>
               </div>
               
               <div class="deleteUserFormButtonWrapper">
                  <div class="deleteUserFormOkButton">
                     <a href="#">
                        <button class="deleteUserFormRealOkButton" type="button" id="btn_submit">확인</button>
                     </a>
                  </div>
                  
                  <div class="deleteUserFormGoToHomeButton">
                     <a href="/mvProject/main/index.do">
                        <input type="button" value="MvPicker">
                     </a>
                  </div>
               
               </div>            
            </div>
            </form>
         </div>
      </div> <!-- bothDivWrapper -->
   </div><!-- moviePickerTotalWrapper -->
</div> <!-- bodyWrapper -->