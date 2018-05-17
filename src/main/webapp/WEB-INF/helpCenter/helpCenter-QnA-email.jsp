<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link href="<c:url value="../res/css/helpCenter/helpCenter-QnA-email.css" />"
   rel="stylesheet">

<script type="text/javascript"
   src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<script>
   $(function() {
      $("#submit_btn").click(function() {
         if ($('input:radio[name="qna_list"]:checked').length < 1) {
            alert("문의유형을 선택해 주세요.");
            return false;
         }
   
         if ($('#title').val() == "") {
            alert("제목을 입력해 주세요.");
            $('#title').focus();
            return false;
         }
   
         if ($('#contents').val() == "") {
            alert("내용을 입력해 주세요.");
            $('#contents').focus();
            return false;
         }
         
        /*  var title = document.getElementById("title").value;
         var isTITLE = /^[A-Za-z0-9가-힣.\s_\-\s/gi]{2,49}$/;
         if (!isTITLE.test(title)) {
            alert("2~50자의 한글 및 영문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.");
            $("#title").val("");
            $("#title").focus();
            return false;
         }
         
         var contents = document.getElementById("contents").value;
         var isCONTENTS = /^[A-Za-z0-9가-힣.\s_\-\s/gi]{2,2499}$/;
         if (!isCONTENTS.test(contents)) {
            alert("2~2500자의 한글 및 영문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.");
            $("#contents").val("");
            $("#contents").focus();
            return false;
         }
        }); */
   });   
</script>
<script>
function fnChkByte(obj, maxByte){
   var str = obj.value;
   var str_len = str.length;

   var rbyte = 0;
   var rlen = 0;
   var one_char = "";
   var str2 = "";

   for(var i=0; i<str_len; i++){
   one_char = str.charAt(i);
   if(escape(one_char).length > 4){
       rbyte += 2;                                         //한글2Byte
   }else{
       rbyte++;                                            //영문 등 나머지 1Byte
   }

   if(rbyte <= maxByte){
       rlen = i+1;                                          //return할 문자열 갯수
   }
   }

   if(rbyte > maxByte){
       alert("한글 "+(maxByte/2)+"자 / 영문 "+maxByte+"자를 초과 입력할 수 없습니다.");
       str2 = str.substr(0,rlen);                                  //문자열 자르기
       obj.value = str2;
       fnChkByte(obj, maxByte);
   }else{
       document.getElementById('byteInfo').innerText = rbyte;
   }
   }
   
   function reviewSubmit(){
      var contents = document.contents;
      if(!contents.value){
         alert("내용을 입력하세요");
         contents.focus();
         return false;
      }
   }
   
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
               <a href="/mvProject/helpCenter/Qna_emailForm.do">> 일대일 문의</a>
            </div>
         </div>
      </div>

      <!-- 고객센터 -->
      <div class="content">

         <!--  왼쪽 메뉴 클릭 부분 -->
         <div class="col-aside">
            <div class="side_menu">
               <ul>
                  <li><a href="/mvProject/helpCenter/index.do">고객센터 메인</a></li>
                  <li><a href="/mvProject/helpCenter/Qna_list.do">자주찾는 질문</a></li>
                  <li><a href="/mvProject/helpCenter/notice_list.do">공지/뉴스</a></li>
                  <li><a href="/mvProject/helpCenter/Qna_emailForm.do">일대일 문의</a></li>
               </ul>
            </div>
            <!-- side_menu -->
         </div>
         <!-- col-aside -->

         <!-- 오른쪽 전체메뉴부분 -->
         <div class="col-detail">
            <div class="customer_top">
               <h2 class="title">자주찾는 질문에서 원하는 답변을 찾지 못하셨군요</h2>
               <p class="subTitle">불편사항이나 문의사항을 남겨주시면 최대한 신속하게 답변 드리겠습니다.</p>
            </div>

            <form action="/mvProject/helpCenter/Qna_email.do" method="post">
               <div class="table_area">
                  <p class="table_info_txt">체크(*)된 항목은 필수 입력 사항입니다.</p>
                  <table cellspacing="0" cellpadding="0" class="qna_table">
                     <tbody>
                        <tr>
                           <th scope="row"><label class="table_th">이름</label></th>
                           <td colspan="3">${memberDTO.name }
                              <input type="hidden" name="name" value="${memberDTO.name }">
                              <input type="hidden" name="id" value="${memberDTO.id }">
                           </td>
                        </tr>

                        <tr>
                           <th scope="row"><label class="table_th">휴대전화</label></th>
                           <td>${memberDTO.phone1 } - ${memberDTO.phone2 } - ${memberDTO.phone3 }
                           <input type="hidden" name="phone1" value="${memberDTO.phone1 }">
                           <input type="hidden" name="phone2" value="${memberDTO.phone2 }">
                           <input type="hidden" name="phone3" value="${memberDTO.phone3 }">
                           </td>
                           <th scope="row"><label class="table_th">이메일</label></th>
                           <td>${memberDTO.email1 }@${memberDTO.email2 }
                           <input type="hidden" name="email1" value="${memberDTO.email1 }">
                           <input type="hidden" name="email2" value="${memberDTO.email2 }">
                           </td>
                        </tr>

                        <tr class="txt_info">
                           <td colspan="4">※&nbsp;&nbsp;문의에 대한 빠른 답변을 위해&nbsp;회원 가입 시 입력하신 연락처를 확인해주세요.
                           
                           </td>
                        </tr>

                        <tr>
                           <th scope="row"><label class="table_th">문의유형 (*)</label></th>
                           <td colspan="3">
                              <ul class="type_list">
                                 <li><input type="radio" name="qna_list"
                                    checked="checked" value="문의"><label>문의</label></li>
                                 <li><input type="radio" name="qna_list" value="불만"><label>불만</label></li>
                                 <li><input type="radio" name="qna_list" value="칭찬"><label>칭찬</label></li>
                                 <li><input type="radio" name="qna_list" value="제안"><label>제안</label></li>
                              </ul> <script>
                                 var qna_list = $("input[type=radio][name=qna_list]:checked").val()
                              </script>
                           </td>
                        </tr>
                        <tr>
                           <th scope="row"><label class="table_th">제목 (*)</label></th> <!-- 유효성 필요 (내용 크기) -->
                           <td colspan="3"><input type="text" placeholder="제목을 입력하세요." name="title" id="title" maxlength="30"></td>
                        </tr>

                        <tr>
                           <th scope="row"><label class="table_th">내용 (*)</label></th><!-- 유효성 필요  (내용 크기) -->
                           <td colspan="3">
                           <textarea id="contents" name="contents" cols="60" rows="5" onKeyUp="javascript:fnChkByte(this,'2500')" placeholder="※주민번호 등 개인정보가 포함되지 않도록 유의하시기 바랍니다."></textarea></td>
                        </tr>
                     </tbody>                     
                  </table>
               </div>
               <div class="inputWordRestrict">
                  <span id="byteInfo">0</span>/2500Byte
               </div>
               <div class="table_btn_box">
                  <input type="submit" value="문의 보내기" id="submit_btn">
                  <input type="button" value="취소">
               </div>

            </form>
         </div>
         <!-- col-detail -->

      </div>
      <!-- content div -->

   </div>
</div>