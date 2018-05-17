
/*로드시 function*/

window.onload = function (){
      $.ajax({
             type : "POST",
             url : "/mvProject/ticket/selectMovieSchedule.do",
            dataType : "json",
            success : function(data) {
        /*    alert(JSON.stringify(data)); */
                $.each(data.list, function(index, items) {
                    $('.ticketMovieListUL').append("<li>"
                    + "<div class=ticketMovieListActive value='"+items.playingmovie+"'><div class='icon_"+items.theatermoviegrade+"'<span>&nbsp;</span></div>"
                    +"<div class='movieListText'>"
                    +items.playingmovie+"</div></div></li>");
                });
             }
      });
      
      $.ajax({
             type : "POST",
             url : "/mvProject/ticket/selectMovieScheduleTheatre.do",
            dataType : "json",
            success : function(data) {
               $.each(data.list, function(index, items) {
               if (items.theaterregion == "서울") {
                  $('.seoulUl').append(
                        "<div class=theater_loca value="+items.theaterbranch+"><li class=regionli>" + items.theaterbranch
                              + "</div></li>");
               } else if (items.theaterregion == "경기") {
                  $('.gyeonggiUl').append(
                        "<div class=theater_loca value="+items.theaterbranch+"><li class=regionli>" + items.theaterbranch
                              + "</div></li>");
               } else if (items.theaterregion == "인천") {
                  $('.incheonUl').append(
                        "<div class=theater_loca  value="+items.theaterbranch+"><li class=regionli value="+items.theaterbranch+">" + items.theaterbranch
                              + "</div></li>");
               } else if (items.theaterregion == "강원") {
                  $('.gangwonUl').append(
                        "<div class=theater_loca value="+items.theaterbranch+"><li class=regionli>" + items.theaterbranch
                              + "</div></li>");
               } else if (items.theaterregion == "대전/충청") {
                  $('.daejeonUl').append(
                        "<div class=theater_loca value="+items.theaterbranch+"><li class=regionli>" + items.theaterbranch
                              + "</div></li>");
               } else if (items.theaterregion == "대구") {
                  $('.daeguUl').append(
                        "<div class=theater_loca  value="+items.theaterbranch+"><li class=regionli>" + items.theaterbranch
                              + "</div></li>");
               } else if (items.theaterregion == "부산/울산") {
                  $('.busanUl').append(
                        "<div class=theater_loca  value="+items.theaterbranch+"><li class=regionli>" + items.theaterbranch
                              + "</div></li>");
               } else if (items.theaterregion == "경상") {
                  $('.gyeongsangUl').append(
                        "<div class=theater_loca  value="+items.theaterbranch+"><li class=regionli>" + items.theaterbranch
                              + "</div></li>");
               } else if (items.theaterregion == "전라/제주") {
                  $('.gwangjuUl').append(
                        "<div class=theater_loca  value="+items.theaterbranch+"><li class=regionli>" + items.theaterbranch
                              + "</div></li>");
               }

            });
         }
      });
      
      $.ajax({
             type : "POST",
             url : "/mvProject/ticket/selectMovieScheduleDate.do",
            dataType : "json",
            success : function(data) {
               for(var i = 0; i < data.yearList.length; i++){
                  $('.ticketDateList').append("<div class=ticketDateYY>"+data.yearList[i].year+"</div>");
                  for(var j = 0; j < data.monthList.length; j++){
                     if(data.yearList[i].year == data.monthList[j].year){
                        $('.ticketDateList').append("<div class=ticketDateMM>"+data.monthList[j].month+"</div>");
                        for(var a = 0; a < data.dayList.length; a++){
                           if(data.yearList[i].year == data.dayList[a].year && data.monthList[j].month == data.dayList[a].month){
                              $('.ticketDateList').append("<div class=ticketDateDD value="+data.dayList[a].theaterdate+"><ul class=ticketDateDDUl>"
                                       +"<li><span class=ticketDateWeek>"
                                       +data.dayList[a].week+"</span>&nbsp;"+data.dayList[a].day+"</li></ul></div>");
                           }
                        }
                     }
                  }
               }
            }
      ,beforeSend:function(){ 
           $('.wrap-loading').removeClass('display-none'); 
       } 
       ,complete:function(){ 
           $('.wrap-loading').addClass('display-none'); 
    
       } 
       ,timeout:100000
            
      });
     
   };
   
$(document).ready(function(){
      function reservationGuide() {
         window.open("/mvProject/ticket/reservationGuide.do", "EventFrame",
               "width=440px,height=470px, top=60px, left=450px");
      }
});

/*항목 클릭 시 작동되는 ajax*/
   
   $('body').on('click' , '.ticketMovieListActive', function() {
         $('.ticketMovieListActive').removeClass('css_effect');
          $(this).addClass('css_effect');
          $.ajax({
               type : "POST",
               url : "/mvProject/ticket/selectbarMovieName.do",
               data: {'movieName': $(this).attr('value')},
               dataType : "json",
               success : function(data) {
                  $('.ticketMovieName').attr('value', data.list[0].movienameforkr);
                  $('.ticketMovieName').text(data.list[0].movienameforkr);
                  if(data.list[0].movieagelimit == 'chungbul'){
                      $('.ticketMovieGrade').text("청소년관람불가");
                      $('.ticketMovieGrade').attr('value', '청소년관람불가');
                   }else if(data.list[0].movieagelimit == '15'){
                      $('.ticketMovieGrade').text("15세관람가");
                      $('.ticketMovieGrade').attr('value', '15세관람가');
                   }else if(data.list[0].movieagelimit == '12'){
                      $('.ticketMovieGrade').text("12세관람가");
                      $('.ticketMovieGrade').attr('value', '12세관람가');
                   }else if(data.list[0].movieagelimit == 'all'){
                      $('.ticketMovieGrade').text("전체관람가");  
                      $('.ticketMovieGrade').attr('value', '전체관람가');
                   }
                  $('.ticketMovieGrade')
                   $(".selectBarPosterSrc").attr("src", "../res/image/moviePoster/"+data.list[0].moviepostimg);
                  $('.movieposterimg').attr('value', data.list[0].moviepostimg);
                   if($('.ticketMovieName').attr('value') != "" 
                     && $('.selectBarTheater').attr('value') != ""
                     && $('.selectBarDate').attr('value') != ""){
                      $.ajax({
                         type : "POST",
                         url : "/mvProject/ticket/selectMovieScheduleTime.do",
                         data: {'playingmovie': $('.ticketMovieName').attr('value'), 'theaterbranch' : $('.selectBarTheater').attr('value'),'theaterdate' : $('.selectBarDate').attr('value')},
                         dataType : "json",
                         success : function(result) {
                            /* alert(JSON.stringify(result)); */
                            $('.ticketTimeListFor').empty();
                            if(result.list.length == 0){
                               $('.ticketTimeListFor').append("해당 영화의 상영 일정이 없습니다.");
                            }else if(result.list.length != 0){
                              for(var i = 0; i < result.list.length; i++){
                                     $('.ticketTimeListFor').append("<div class=ticketTimeTheaterInfo>"
                                              +"<span class=Auditorium>"+result.list[i].theaterscreen
                                              +"</span><span class=allSeat>(총20석)"
                                              +"</span></div>");
                                 for(var j = 0; j < result.timeList.length; j++){
                                    if(result.list[i].theaterscreen == result.timeList[j].theaterscreen){
                                        $('.ticketTimeListFor').append("<div class=timeBtncss><span class=movieTimeButton>"
                                              +"<input type='button' class=timeBtn onclick=choiceScreenAndTime('"+result.timeList[j].theaterscreen+"','"+result.timeList[j].theaterdate+"','"+result.timeList[j].seq+"') value="+result.timeList[j].theaterdate+"></span>"
                                              +"<span class=reservedSeat>"+result.timeList[j].totalseat+"석 </span></div>");
                                    }
                                 }
                                        
                              }
                           
                         }
                         }
                  });
                   }
          
   }
});
   });
   
   
   $('body').on('click' , '.theater_loca', function() {
      $('.theater_loca').removeClass('regionli_active');
       $(this).addClass('regionli_active');
      $('.selectBarTheater').attr('value', $(this).attr('value'));
          $('.selectBarTheater_span').text($(this).attr('value')); 
          
          if($('.ticketMovieName').attr('value') != "" 
             && $('.selectBarTheater').attr('value') != ""
             && $('.selectBarDate').attr('value') != ""){
               $.ajax({
                     type : "POST",
                     url : "/mvProject/ticket/selectMovieScheduleTime.do",
                     data: {'playingmovie': $('.ticketMovieName').attr('value'), 'theaterbranch' : $('.selectBarTheater').attr('value'),'theaterdate' : $('.selectBarDate').attr('value')},
                     dataType : "json",
                     success : function(result) {
                        /* alert(JSON.stringify(result)); */
                         $('.ticketTimeListFor').empty();
                         if(result.list.length == 0){
                            $('.ticketTimeListFor').append("해당 영화의 상영 일정이 없습니다.");
                         }else if(result.list.length != 0){
                           for(var i = 0; i < result.list.length; i++){
                                  $('.ticketTimeListFor').append("<div class=ticketTimeTheaterInfo>"
                                           +"<span class=Auditorium>"+result.list[i].theaterscreen
                                           +"</span><span class=allSeat>(총20석)"
                                           +"</span></div>");
                              for(var j = 0; j < result.timeList.length; j++){
                                 if(result.list[i].theaterscreen == result.timeList[j].theaterscreen){
                                     $('.ticketTimeListFor').append("<div class=timeBtncss><span class=movieTimeButton>"
                                           +"<input type='button' class=timeBtn onclick=choiceScreenAndTime('"+result.timeList[j].theaterscreen+"','"+result.timeList[j].theaterdate+"','"+result.timeList[j].seq+"') value="+result.timeList[j].theaterdate+"></span>"
                                           +"<span class=reservedSeat>"+result.timeList[j].totalseat+"석 </span></div>");
                                 }
                              }
                                     
                           }
                        
                      }
                     }
              });
          }
   });

   $('body').on('click' , '.ticketDateDD', function() { 
      $('.selectBarDate').attr('value', $(this).attr('value'));
       $('.selectBarDate_span').text($(this).attr('value'));
       $('.ticketDateDD').removeClass('date_active');
         $(this).addClass('date_active');
       if($('.ticketMovieName').attr('value') != "" 
                && $('.selectBarTheater').attr('value') != ""
                && $('.selectBarDate').attr('value') != ""){
           $.ajax({
                  type : "POST",
                  url : "/mvProject/ticket/selectMovieScheduleTime.do",
                  data: {'playingmovie': $('.ticketMovieName').attr('value'), 'theaterbranch' : $('.selectBarTheater').attr('value'),'theaterdate' : $('.selectBarDate').attr('value')},
                  dataType : "json",
                  success : function(result) {
                     /* alert(JSON.stringify(result)); */
                      $('.ticketTimeListFor').empty();
                      if(result.list.length == 0){
                         $('.ticketTimeListFor').append("해당 영화의 상영 일정이 없습니다.");
                      }else if(result.list.length != 0){
                        for(var i = 0; i < result.list.length; i++){
                               $('.ticketTimeListFor').append("<div class=ticketTimeTheaterInfo>"
                                        +"<span class=Auditorium>"+result.list[i].theaterscreen
                                        +"</span><span class=allSeat>(총20석)"
                                        +"</span></div>");
                           for(var j = 0; j < result.timeList.length; j++){
                              if(result.list[i].theaterscreen == result.timeList[j].theaterscreen){
                                  $('.ticketTimeListFor').append("<div class=timeBtncss><span class=movieTimeButton>"
                                        +"<input type='button' class=timeBtn onclick=choiceScreenAndTime('"+result.timeList[j].theaterscreen+"','"+result.timeList[j].theaterdate+"','"+result.timeList[j].seq+"') value="+result.timeList[j].theaterdate+"></span>"
                                        +"<span class=reservedSeat>"+result.timeList[j].totalseat+"석 </span></div>");
                              }
                           }
                                  
                        }
                     
                   }
                  }
           });
             }
   });
   
   $('body').on('click' , '.timeBtn', function() {
      $('.timeBtn').removeClass('time_Btn_Active');
      $(this).addClass('time_Btn_Active');
   });
   
   
   

   function choiceScreenAndTime(screen, time, seq) {
      $('.selectBarTime_span').text(time);
      $('.selectBarScreen_span').text(screen);
      $('.selectBarAuditorium').attr('value', screen);
      $('#selectMovieSeq').attr('value', seq);
      $('.selectBarTime').attr('value', time);
   };
   

      
      $('body').on('click' , '.selectBar_Seat_Selection_Next_Btn', function() {
            var ticketplayingmovie = $('.ticketMovieName').attr('value');
           var tickettheatermoviegrade = $('.ticketMovieGrade').attr('value');
           var ticketmovieposter = $('.movieposterimg').attr('value');
           var tickettheaterbranch = $('.selectBarTheater').attr('value');
           var tickettheaterdate = $('.selectBarDate').attr('value');
           var tickettheaterscreen = $('.selectBarAuditorium').attr('value');
           var tickettheatertime = $('.selectBarTime').attr('value');
           var selectMovieSeq = $('#selectMovieSeq').attr('value');
           
           if(ticketplayingmovie == ""){
              alert("영화를 선택해주세요");
           } else if(tickettheaterbranch == ""){
              alert("극장을 선택해주세요");
           }else if(tickettheaterdate == ""){
              alert("날짜를 선택해주세요");
           }else if(tickettheaterscreen == ""){
              alert("시간을 선택해주세요");
           }else{
         $.ajax({
               type : "POST",
               url : "/mvProject/ticket/isLoginOk.do",
               dataType : "json",
               success : function(result) {
                  if(result.login == "login"){
                     url = '/mvProject/ticket/ticketingStep2.do';
                     var $form = $("<form></form>");
                    
                    $form.attr('action', url);
                    $form.attr('method', 'post');
                    $form.appendTo('body');
                    
                    var hiTicketplayingmovie = $("<input type='hidden' value='"+ticketplayingmovie+"' name='ticketplayingmovie'>");
                    var hiTickettheatermoviegrade = $("<input type='hidden' value='"+tickettheatermoviegrade+"' name='tickettheatermoviegrade'>");
                    var hiTicketmovieposter = $("<input type='hidden' value='"+ticketmovieposter+"' name='ticketmovieposter'>");
                    var hiTickettheaterbranch = $("<input type='hidden' value='"+tickettheaterbranch+"' name='tickettheaterbranch'>"); 
                    var hiTickettheaterdate = $("<input type='hidden' value='"+tickettheaterdate+"' name='tickettheaterdate'>"); 
                    var hiTickettheaterscreen = $("<input type='hidden' value='"+tickettheaterscreen+"' name='tickettheaterscreen'>"); 
                    var hiTickettheatertime = $("<input type='hidden' value='"+tickettheatertime+"' name='tickettheatertime'>"); 
                    var hiSelectMovieSeq = $("<input type='hidden' value='"+selectMovieSeq+"' name='selectMovieSeq'>"); 
                    
                    $form.append(hiTicketplayingmovie).append(hiTickettheatermoviegrade).append(hiTicketmovieposter).append(hiTickettheaterbranch).append(hiTickettheaterdate).append(hiTickettheaterscreen).append(hiTickettheatertime).append(hiSelectMovieSeq);
                    $form.submit();
                  }else if(result.login == "logout"){
                     alert("로그인 후 이용가능 합니다.");
                     url = '/mvProject/ticket/toticketLogin.do';
                     var $form = $("<form></form>");
                    
                    $form.attr('action', url);
                    $form.attr('method', 'post');
                    $form.appendTo('body');
                    
                    var hiTicketplayingmovie = $("<input type='hidden' value='"+ticketplayingmovie+"' name='ticketplayingmovie'>");
                    var hiTickettheatermoviegrade = $("<input type='hidden' value='"+tickettheatermoviegrade+"' name='tickettheatermoviegrade'>");
                    var hiTicketmovieposter = $("<input type='hidden' value='"+ticketmovieposter+"' name='ticketmovieposter'>");
                    var hiTickettheaterbranch = $("<input type='hidden' value='"+tickettheaterbranch+"' name='tickettheaterbranch'>"); 
                    var hiTickettheaterdate = $("<input type='hidden' value='"+tickettheaterdate+"' name='tickettheaterdate'>"); 
                    var hiTickettheaterscreen = $("<input type='hidden' value='"+tickettheaterscreen+"' name='tickettheaterscreen'>"); 
                    var hiTickettheatertime = $("<input type='hidden' value='"+tickettheatertime+"' name='tickettheatertime'>"); 
                    var hiSelectMovieSeq = $("<input type='hidden' value='"+selectMovieSeq+"' name='selectMovieSeq'>"); 
                    
                    $form.append(hiTicketplayingmovie).append(hiTickettheatermoviegrade).append(hiTicketmovieposter).append(hiTickettheaterbranch).append(hiTickettheaterdate).append(hiTickettheaterscreen).append(hiTickettheatertime).append(hiSelectMovieSeq);
                    $form.submit();
                  }
               }
         });
         
             
           }
            
         });
      $('body').on('click' , '.backTicketing', function() {
          location.href='/mvProject/ticket/ticketingStep1.do';
       });    
 
      
      $('body').on('click' , '.ticketingSchedule', function() {
          location.href='/mvProject/theaters/theaters.do';
       });  
      
      $('body').on('click' , '.ticketingGuide', function() {
         window.open("/mvProject/ticket/reservationGuide.do", "EventFrame",
         "width=440px,height=470px, top=60px, left=450px");
       });  
      