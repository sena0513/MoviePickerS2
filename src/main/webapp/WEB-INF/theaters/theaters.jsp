<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<link href="<c:url value="../res/css/theaters/theaters.css" />" rel="stylesheet">

<script>
   function chooseBranch(seq, regioncode) {
      var jsseq = seq;
      var jsregioncode = regioncode;
      location.href="/mvProject/theaters/theaters.do?seq="+jsseq+"&regioncode="+jsregioncode;
      
   /* function sendMoviecode(ticketmovieCode) {
      var jsticketmoviecode = ticketmovieCode;
      location.href="/mvProject/myPage/myReservationStep2.do?ticket oviecode="+jsticketmoviecode;
   };    */
      
};
   
</script>

   <div class="wholepage">
   <div class="contents">
   
   
   <!-- ----------Top of top----------------------------- -->
   <div class="movieTheaters_1stBigBox">
      
      <div class="movieTheaters_1stBox">
      <div class="movieTheaters_1stBigBox_1stEle">
            <img src="../res/image/theaters/text_favoriteTheater02.png" class="text_favoriteTheater">
      </div>
      
      <div class="movieTheaters_1stBigBox_2ndEle_line"></div>
      
         <div class="movieTheaters_1stBigBox_3rdEle_area">
               <div class="areaText">서울</div>
               <div class="areaText">경기</div>
               <div class="areaText">인천</div>
               <div class="areaText">강원</div>
               <div class="areaText">대전/충청</div>
               <div class="areaText">대구</div>
               <div class="areaText">부산/울산</div>
               <div class="areaText">경상</div>
               <div class="areaText">전라/제주</div>
         </div>      
      <div class="movieTheaters_1stBigBox_2ndEle_line"></div>
   
      <div class="movieTheaters_1stBigBox_5thEle">
      
         <div class="showBranch">
         <c:forEach items="${regionInfo}" var="regionInfo" varStatus="status" > <!-- Default -->
         
         <div class="areaText02">
         <a href="javascript:chooseBranch('${regionInfo.seq}', '${regionInfo.regioncode}')">
         ${regionInfo.branch}</a></div>
        
         
      </c:forEach>
         </div>
      </div>
      <div class="movieTheaters_1stBigBox_6thEle">
      </div> 
   </div>
</div>  

<script>
window.onload = function (){
   $('body').on('click' , '.areaText', function() {
       /* $(this).addClass("css_effect"); */
        $.ajax({
           type : "POST",
            url : "/mvProject/theaters/findBranch.do",
            data : {
               "region" : $(this).text()
            },
            dataType : "json",
            success : function(data) {
               $('.areaText02').detach();
               $.each(data.regionInfo, function(index, items) {
                  $('.showBranch').append(
                  "<div class='areaText02'>"
                  +"<a href='\/mvProject/theaters/theaters.do?seq="+data.regionInfo[index].seq+"&regioncode="+data.regionInfo[index].regioncode+"\'>" 
                  + data.regionInfo[index].branch
                  +"</a></div>");
               });
            },      
            error : function(){   
                  alert("에러가 발생하였습니다.");
              }
        });
   });

      }
   </script>

            
   <!-- movieTheaters_2ndBigBox : 극장 띄우기 -->

      <div class=movieTheaters_2ndBigBox_0>
            ${chooseBranch[0].branch}점
             <input type="hidden" value="${chooseBranch[0].branch}" class="datatype_branch" name="branch">
      </div>
   <div class="movieTheaters_2ndBigBox">
      <img src="../res/image/theaters/${chooseBranch[0].branch}.jpg" class="theaters_image" onERROR="this.src='../res/image/theaters/theater_img.png'">
      <div class="movieTheaters_2ndBigBox_contents">
         <div class="movieTheaters_2ndBigBox_contents_left">
            <br><br>
         
            <pre>${chooseBranch[0].address}</pre>
            <br><br>
            ${chooseBranch[0].screen} / ${chooseBranch[0].seats} 석
         </div>
         

         <div class="movieTheaters_2ndBigBox_contents_right">
         
         </div>
      </div>
   </div>
   
   <!-- movieTheaters_3rdBigBox : 일자 클릭-->

   <div class="movieTheaters_BigBox_line_bold"></div>
   
   <div class="movieTheaters_3rdBigBox">
      <div class="movieTheaters_3rdBigBox_icon">
         <img src="../res/image/movies/handpointer02.png" class="handPointer01">
      </div>
      <c:choose>
      <c:when test="${not empty getDateInfo}">
      <c:forEach items="${getDateInfo}" var="getDateInfo">
      <div class="movieTheaters_3rdBigBox_date" onclick="javascript:getvalueplease( ${getDateInfo.month}, ${getDateInfo.day})">
         <div class="movieTheaters_MonthAndWeek">
            <div class="movieTheaters_month">${getDateInfo.month}월</div>
         </div>
         <div class="movieTheaters_Day">${getDateInfo.day}</div>
      </div>
      </c:forEach>
      </c:when>
      <c:otherwise>
      <div class="noBranch">
         선택하신 지점에서 상영하는 영화가 없습니다.
      </div>
      </c:otherwise>
      </c:choose>
   </div>
   
   <div class="movieTheaters_BigBox_line"></div>
   
   <!-- -----------------movieTheaters_4thBigBox : 막간안내-->
   
   <div class="movieTheaters_4thBigBox">
      <div class="movieTheaters_4thBigBox_text">
         * 시간을 클릭하시면 빠른 예매를 하실 수 있습니다.
      </div>
      
      <div class="movieTheaters_4thBigBox_guideAge">
         <a href="javascript:void(0)" onClick="return show_hide_box(this,440,300,'1px solid')">
            <button style="width:110px;height:30px;">
            <img src="../res/image/movies/guideAge_btn.png" class="guideAge_btn">
            <div id="light" style="display: none; left: 776px; top: 1188px;">
               <div class="alarm_age">
                  <div class="alarm_age_title">
                     관람 등급 안내
                  </div>
                  <div class="alarm_age_contents">
                     <table frame="hsides" rules="rows" align=center>
                        <tr style="font-size:13px" height=35px>
                        <td>구분</td>
                        <td align=center>설명   </td>
                        </tr>
                        
                        <tr style="font-size:11px" height=35px>
                        <td width=50px;>
                        <img src="../res/image/movies/agelim_all.png"></td>
                        <td>모든 연령의 고객님께서 관람하실 수 있습니다.</td>
                        </tr>
                        
                        <tr style="font-size:11px" height=35px>
                        <td><img src="../res/image/movies/agelim_12.png"></td>
                        <td>만 12세 미만의 고객님은 보호자를 동반하셔야 관람하실 수 있습니다.</td>
                        </tr>
                        
                        <tr style="font-size:11px" height=35px>
                        <td><img src="../res/image/movies/agelim_15.png"></td>
                        <td>만 15세 미만의 고객님은 보호자를 동반하셔야 관람하실 수 있습니다.</td>
                        </tr>
                        
                        <tr style="font-size:11px" height=50px>
                        <td><img src="../res/image/movies/agelim_chungbul.png"></td>
                        <td>만 18세 미만의 고객님은 보호자를 동반하셔도 관람하실 수 없습니다.<br>
                           - 입장시 신분증을 꼭 지참하시기 바랍니다.<br>
                           - 만 18세 이상이더라도 고등학교 재학중인 경우 관람이 불가합니다. </td>
                        </tr>
                        
                        <tr style="font-size:11px" height=35px>
                        <td><img src="../res/image/movies/agelim_mijeong.png"></td>
                        <td>등급 미정 영화입니다.</td>
                        </tr>
                     </table>
                  </div>
               </div>
            </div>
         </button></a>
      </div>
   </div>
   
   <div class="movieTheaters_BigBox_line"></div>

   <!-- ------------------------------------------------------------------------------------- -->
   
   <!-- movieTheaters_5thBigBox : 극장정보 -->
<div class="movieTheaters_5thBigBox">
      
   <c:forEach items="${getBranchMovie}" var="getBranchMovie" varStatus="status">   
      <div class="movieTheaters_5thBigBox_1stLine">
            <img src="../res/image/movies/agelim_${getMovieInfo[status.index].movieagelimit}.png" class="ageIcon">
            <div class="movieTheaters_5thBigBox_1stLine_title">${getBranchMovie.playingmovie}</div>
            <div class="movieTheaters_5thBigBox_1stLine_detail">${getMovieInfo[status.index].moviegenre} / ${getMovieInfo[status.index].movierunningtime} / ${getMovieInfo[status.index].moviedate} 개봉</div>
      </div>
      
      <c:forEach items="${getScreenInfo}" var="getScreenInfo" varStatus="status">
         <c:if test="${getBranchMovie.playingmovie==getScreenInfo.playingmovie}">   
            <div class="movieTheaters_5thBigBox_2ndLine">
               <span class="movieTheaters_5thBigBox_2ndLine_detail">▶ ${getScreenInfo.theaterscreen} | 총 20석</span>
            </div>
            
            <c:forEach items="${getScheduleInfo}" var="getScheduleInfo" varStatus="status">
                  <c:if test="${getScreenInfo.theaterscreen==getScheduleInfo.theaterscreen && getScreenInfo.playingmovie==getScheduleInfo.playingmovie}">
                  
                  
                  <div class="wrapTimeAndSeat" value='${getScheduleInfo.seq}'>
                     <div class="movieTheaters_5thBigBox_3rdLine">
                           <span class="movieTheaters_5thBigBox_3rdLine_time">${getScheduleInfo.theatertime}</span>
                           <br><span class="movieTheaters_5thBigBox_3rdLine_seat">${getScheduleInfo.totalseat}석</span>
                           
                           <input type=hidden value='${getScheduleInfo.theatertime}' name='tickettheatertime' class='time${getScheduleInfo.seq}'>
                           <input type=hidden value='${getScheduleInfo.theaterbranch}' name='tickettheaterbranch' class='branch${getScheduleInfo.seq}'>
                           <input type=hidden value='${getScheduleInfo.playingmovie}' name='ticketplayingmovie' class='playingmovie${getScheduleInfo.seq}'>
                           <input type=hidden value='${getScheduleInfo.theaterscreen}' name='tickettheaterscreen' class='theaterscreen${getScheduleInfo.seq}'>
                           <input type=hidden value='${getScheduleInfo.theaterdate}' name='tickettheaterdate' class='date${getScheduleInfo.seq}' >
                           <input type=hidden value='${getScheduleInfo.theatermoviegrade}' name='tickettheatermoviegrade' class='grade${getScheduleInfo.seq}'>
                           <input type=hidden value='${getScheduleInfo.playingmovie}.jpg' name='ticketmovieposter' class='moviepostimg${getScheduleInfo.seq}'>
                     </div>
                  </div>
               </c:if>
            </c:forEach>
      </c:if>
      </c:forEach>
   </c:forEach>
</div>
<div class="movieTheaters_BigBox_line_bold"></div>
<div class=theaterAD>
   <img src="../res/image/theaters/ad02.jpg" class=adimage>
</div>

   
   <!-- movieTheaters_5thBigBox : 극장정보 -->
   
   <!-- <div class="movieTheaters_BigBox_line"></div> -->
         <script type="text/javascript">
            function move_box(an, box) {
               //option
               var cleft = -400; //left margin
               var ctop = -10; //top margin`
               var obj = an;
               while (obj.offsetParent) {
                  cleft += obj.offsetLeft;
                  ctop += obj.offsetTop;
                  obj = obj.offsetParent;
               }
               box.style.left = cleft + 'px';
               ctop += an.offsetHeight + 8;
               if (document.body.currentStyle
                     && document.body.currentStyle['marginTop']) {
                  ctop += parseInt(document.body.currentStyle['marginTop']);
               }
               box.style.top = ctop + 'px';
            }

            function show_hide_box(an, width, height, borderStyle) {
               var href = an.href;
               var boxdiv = document.getElementById('light');

               if (boxdiv != null) {
                  if (boxdiv.style.display == 'none') {
                     move_box(an, boxdiv);
                     boxdiv.style.display = 'block';
                  } else
                     boxdiv.style.display = 'none';
                  return false;
               }

               boxdiv = document.createElement('div');
               boxdiv.setAttribute('id', href);
               boxdiv.style.display = 'block';
               boxdiv.style.position = 'absolute';
               boxdiv.style.width = width + 'px';
               boxdiv.style.height = height + 'px';
               boxdiv.style.border = borderStyle;
               boxdiv.style.backgroundColor = '#fff';

               var contents = document.createElement('iframe');
               contents.scrolling = 'no';
               contents.frameBorder = '0';
               contents.style.width = width + 'px';
               contents.style.height = height + 'px';
               contents.src = href;

               boxdiv.appendChild(contents);
               document.body.appendChild(boxdiv);
               move_box(an, boxdiv);

               return false;
            }
            

function getvalueplease(month, day){
   var newMonth = pad(month, 2);
   var newDay = pad(day, 2);

   $.ajax({
      type:'post',
      url:"/mvProject/theaters/getschedulebydate.do",
      data:{"branch" : $('.datatype_branch').attr('value'), "month" :newMonth, "day" :newDay },
      dataType:"json",
      success:function(data){
         $('.movieTheaters_5thBigBox').empty();
         for(var i = 0; i < data.getBranchMovieDistinct.length; i++){
            $('.movieTheaters_5thBigBox').append("<div class=movieTheaters_5thBigBox_1stLine>"
            +"<img src='../res/image/movies/agelim_"
            + data.getMovieInfo[i].movieagelimit
            +".png' class='ageIcon'>"
            +"<div class=movieTheaters_5thBigBox_1stLine_title>&nbsp"
            + data.getBranchMovieDistinct[i].playingmovie
            + "</div>"
            +"<div class=movieTheaters_5thBigBox_1stLine_detail>&nbsp"
            + data.getMovieInfo[i].moviegenre
            + "&nbsp/ "
            + data.getMovieInfo[i].movierunningtime
            + "&nbsp/ "
            + data.getMovieInfo[i].moviedate + "&nbsp;개봉"
            +"</div></div>"
            );

               for(var j=0;j<data.getScreenInfo.length;j++) {
                  if(data.getBranchMovieDistinct[i].playingmovie==data.getScreenInfo[j].playingmovie) {
                  $('.movieTheaters_5thBigBox').append("<div class=movieTheaters_5thBigBox_2ndLine>"
                  + "<span class=movieTheaters_5thBigBox_2ndLine_detail>"
                  + "▶&nbsp;"+data.getScreenInfo[j].theaterscreen+" | 총 20석"
                  + "</span></div>"
                  );
                  
                  for(var z=0;z<data.getScheduleInfo.length;z++) {
                     if(data.getBranchMovieDistinct[i].playingmovie==data.getScheduleInfo[z].playingmovie && data.getScreenInfo[j].theaterscreen==data.getScheduleInfo[z].theaterscreen) {
                     $('.movieTheaters_5thBigBox').append(
                           "<div class=wrapTimeAndSeat value='"+data.getScheduleInfo[z].seq+"'>"
                           + "<div class=movieTheaters_5thBigBox_3rdLine>"
                           + "<span class=movieTheaters_5thBigBox_3rdLine_time>"
                           + data.getScheduleInfo[z].theatertime
                           + "</span>"
                           + "<br><span class=movieTheaters_5thBigBox_3rdLine_seat>"
                           + data.getScheduleInfo[z].totalseat
                           + "석"
                           + "</span>"
                           + "<input type=hidden value='"
                           + data.getScheduleInfo[z].seq
                           + "' name='seq'>"
                           + "<input type=hidden value='"
                           + data.getScheduleInfo[z].theatertime
                           + "' name='time' class='time"+data.getScheduleInfo[z].seq+"'>"
                           + "<input type=hidden value='"
                           + data.getScheduleInfo[z].totalseat
                           + "' name='seat'>"
                           + "<input type=hidden value='"
                           + data.getScheduleInfo[z].theaterbranch
                           + "' name='theaterbranch' class='branch"+data.getScheduleInfo[z].seq+"'>"
                           + "<input type=hidden value='"
                           + data.getScheduleInfo[z].playingmovie
                           + "' name='theaterregion' class='playingmovie"+data.getScheduleInfo[z].seq+"'>"
                           + "<input type=hidden value='"
                           + data.getScheduleInfo[z].theaterscreen
                           + "'theaterregion' class='theaterscreen"+data.getScheduleInfo[z].seq+"'>"
                           + "<input type=hidden value='"
                           + data.getScheduleInfo[z].theaterdate
                           + "' name='theaterdate' class='date"+data.getScheduleInfo[z].seq+"'>"
                           + "<input type=hidden value='"
                           + data.getScheduleInfo[z].theatermoviegrade
                           + "' name='theatermoviegrade' class='grade"+data.getScheduleInfo[z].seq+"'>"
                           + "<input type=hidden value='"
                           + data.getScheduleInfo[z].playingmovie
                           + ".jpg' name='moviepostimg' class='moviepostimg"+data.getScheduleInfo[z].seq+"'>"
                           + "</div></div>"
                           );
                     }
                  }
               }
            }
         }
         $('.movieTheaters_5thBigBox').append("</div");
      }
   });
}      

$('body').on('click', '.wrapTimeAndSeat', function(){
   var seq = $(this).attr('value');
   
   var movieTime = $('.time'+seq+'').attr('value');
   var movieBranch = $('.branch'+seq+'').attr('value');
   var moviePlayingmovie = $('.playingmovie'+seq+'').attr('value');
   var movieScreen = $('.theaterscreen'+seq+'').attr('value');
   var movieDate = $('.date'+seq+'').attr('value');
   var movieGrade = $('.grade'+seq+'').attr('value');
   var movieMoviepostimg = $('.moviepostimg'+seq+'').attr('value');
   
   if(movieGrade == 'all'){
	   movieGrade = '전체 관람가';
   }else if(movieGrade == '12'){
	   movieGrade = '12세 관람가';
   }else if(movieGrade == '15'){
	   movieGrade = '15세 관람가'
   }else if(movieGrade == 'chungbul'){
	   movieGrade = '청소년관람불가'
   }
   
   
   url ='/mvProject/ticket/ticketingStep1.do'; 
   var $form = $("<form></form>");
   
   $form.attr('action', url);
   $form.attr('method', 'post');
   $form.appendTo('body');
   
   var hiSeq = $("<input type='hidden' value='"+seq+"' name='selectMovieSeq'>");
   var hiMovieTime = $("<input type='hidden' value='"+movieTime+"' name='tickettheatertime'>");
   var hiMovieBranch = $("<input type='hidden' value='"+movieBranch+"' name='tickettheaterbranch'>");
   var hiMoviePlayingmovie = $("<input type='hidden' value='"+moviePlayingmovie+"' name='ticketplayingmovie'>");
   var hiMovieScreen = $("<input type='hidden' value='"+movieScreen+"' name='tickettheaterscreen'>");
   var hiMovieDate = $("<input type='hidden' value='"+movieDate+"' name='tickettheaterdate'>");
   var hiMovieGrade = $("<input type='hidden' value='"+movieGrade+"' name='tickettheatermoviegrade'>");
   var hiMovieMoviepostimg = $("<input type='hidden' value='"+movieMoviepostimg+"' name='ticketmovieposter'>");
   
   $form.append(hiSeq).append(hiMovieTime).append(hiMovieBranch).append(hiMoviePlayingmovie).append(hiMovieScreen).append(hiMovieDate).append(hiMovieGrade).append(hiMovieMoviepostimg)
   $form.submit();
   
});

function pad(n, width) {
     n = n + '';
     return n.length >= width ? n : new Array(width - n.length + 1).join('0') + n;
   }

</script>
   
      </div> <!-- contents div -->
   </div> <!-- wholepage div -->
   