<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<link rel="stylesheet" href="../res/css/main/warningPage.css"
   type="text/css" />


<div id=bodywrapper>
   <div id=errorform>
      <div class="warningImageWrapper">
            <img src="../res/image/main/realWarningIcon.png">
      </div>

      <div class=errorcontents>
         <h3>이용에 불편을 드려 죄송합니다.</h3>
         <p>
            방문하시려는 웹 페이지의 주소가 잘못 입력되었거나 변경 또는 삭제되어 요청하신 페이지를 찾을 수 없습니다. <br>
            입력하신 주소가 정확한지 다시 한 번 확인해 주시기 바랍니다. 감사합니다.
         </p>
         
         <div class="errorcontentsButtonWrapper">
            <input type="button" value="이전으로" class="backTothePageButton"
            onclick="javascript:history.back()">
            
            <input type="button" value="고객센터(1588-5588)" class="helpCenterMainButton"
            onclick="window.location.href='/mvProject/helpCenter/index.do'">
            
            <input type="button" value="메인으로" class="goTothePageButton"
            onclick="window.location.href='/mvProject/main/index.do'">
         </div>
      </div>
   </div>
</div>
