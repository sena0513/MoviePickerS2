
$(document).ready(function() {
$('.selected').click(function(){
   $('.numberOfPeople li').removeClass('ticket_total_active');
    $(this).addClass('ticket_total_active');
    $('.selectBar_Span_People').empty();
    $('.selectBarPeople').attr('value', $(this).attr('value'));
    var selectTotalPeople = $(this).attr('value');
    if(selectTotalPeople == "0"){
       $('.col').removeClass('seatActive');
       $('#totalPeopleCount').attr('value', '0');
       $('.seatWrapper').addClass('seatWapper_active');
       $('#movieSeat1').attr('value', '');
       $('#movieSeat2').attr('value', '');
       $('#movieSeat3').attr('value', '');
       $('#movieSeat4').attr('value', '');
       $('#movieSeat5').attr('value', '');
       $('.movieSeat1Span').text("");
       $('.movieSeat2Span').text("");
       $('.movieSeat3Span').text("");
       $('.movieSeat4Span').text("");
       $('.movieSeat5Span').text("");
       $('.totalPrice').text("");
    }else if(selectTotalPeople != "0"){
       $('.selectBar_Span_People').text($(this).attr('value')+"명");
       $('#totalPeopleCount').attr('value',$(this).attr('value'));
       $('.col').removeClass('seatActive');
       $('.seatWrapper').removeClass('seatWapper_active');
       $('#SelectSeatCount').attr('value', '1');
       $('#movieSeat1').attr('value', '');
       $('#movieSeat2').attr('value', '');
       $('#movieSeat3').attr('value', '');
       $('#movieSeat4').attr('value', '');
       $('#movieSeat5').attr('value', '');
       $('.movieSeat1Span').text("");
       $('.movieSeat2Span').text("");
       $('.movieSeat3Span').text("");
       $('.movieSeat4Span').text("");
       $('.movieSeat5Span').text("");
       if($('#totalPeopleCount').attr('value') == "1"){
          $('.totalPrice').text("9,000원");
          $('.selectBar_Payment_Total').attr('value', '9000');
       }else if($('#totalPeopleCount').attr('value') == "2"){
          $('.totalPrice').text("18,000원");
          $('.selectBar_Payment_Total').attr('value', '18000');
       }else if($('#totalPeopleCount').attr('value') == "3"){
          $('.totalPrice').text("27,000원");
          $('.selectBar_Payment_Total').attr('value', '27000');
       }else if($('#totalPeopleCount').attr('value') == "4"){
          $('.totalPrice').text("36,000원");
          $('.selectBar_Payment_Total').attr('value', '36000');
       }else if($('#totalPeopleCount').attr('value') == "5"){
          $('.totalPrice').text("45,000원");
          $('.selectBar_Payment_Total').attr('value', '45000');
       }
    }
});



$('body').on('click' , '.col', function() {
   var count = $('#totalPeopleCount').attr('value');
   var numCount = $('#SelectSeatCount').attr('value');
    
   if(count == '1'){
      if(numCount == '1'){
           $(this).addClass('seatActive');
             $('#SelectSeatCount').attr('value', '2');
             $('.movieSeat1Span').text($(this).attr('value'));
             $('#movieSeat1').attr('value', $(this).attr('value'));
       }else{
          var result = confirm('이미 좌석을 모두 선택하였습니다. \n 선택하신 좌석을 변경하시겠습니까?');
         if(result == true){
            $('#movieSeat1').attr('value', '');
            $('.col').removeClass('seatActive');
            $(this).addClass('seatActive');
            $('.movieSeat1Span').text($(this).attr('value'));
            $('#movieSeat1').attr('value', $(this).attr('value'));
         }
       }
   }else if(count == '2'){
      if(numCount == '1'){
         $(this).addClass('seatActive');
          $('.movieSeat1Span').text($(this).attr('value'));
          $('#movieSeat1').attr('value', $(this).attr('value'));
          var mainSeat = $(this).attr('id');
          mainSeat *= 1;
          
          if(mainSeat == 1 || mainSeat == 3 || mainSeat == 6 || mainSeat == 8 || mainSeat == 11 || mainSeat == 13 || mainSeat == 16 || mainSeat == 18){
             var subSeat = mainSeat+1;
             subSeat += "";
             $('#'+subSeat+'').addClass('seatActive');
              $('.movieSeat2Span').text($('#'+subSeat+'').attr('value'));
              $('#movieSeat2').attr('value', $('#'+subSeat+'').attr('value'));
          }else{
             var subSeat = mainSeat-1;
             subSeat += "";
             $('#'+subSeat+'').addClass('seatActive');
             $('.movieSeat2Span').text($('#'+subSeat+'').attr('value'));
             $('#movieSeat2').attr('value', $('#'+subSeat+'').attr('value'));
          }
          $('#SelectSeatCount').attr('value', '2');
      }else{
          var result = confirm('이미 좌석을 모두 선택하였습니다. \n 선택하신 좌석을 변경하시겠습니까?');
         if(result == true){
            $('#movieSeat1').attr('value', '');
             $('#movieSeat2').attr('value', '');
            $('.movieSeat1Span').text("");
             $('.movieSeat2Span').text("");
            $('.col').removeClass('seatActive');
            $(this).addClass('seatActive');
            $('#movieSeat1').attr('value', $(this).attr('value'));
            $('.movieSeat1Span').text($(this).attr('value'));
            var mainSeat = $(this).attr('id');
             mainSeat *= 1;
             
             if(mainSeat == 1 || mainSeat == 3 || mainSeat == 6 || mainSeat == 8 || mainSeat == 11 || mainSeat == 13 || mainSeat == 16 || mainSeat == 18){
                var subSeat = mainSeat+1;
                subSeat += "";
                $('#'+subSeat+'').addClass('seatActive');
                 $('.movieSeat2Span').text($('#'+subSeat+'').attr('value'));
                 $('#movieSeat2').attr('value', $('#'+subSeat+'').attr('value'));
             }else{
                var subSeat = mainSeat-1;
                subSeat += "";
                $('#'+subSeat+'').addClass('seatActive');
                 $('.movieSeat2Span').text($('#'+subSeat+'').attr('value'));
                 $('#movieSeat2').attr('value', $('#'+subSeat+'').attr('value'));
             }
         }
       }
       
       
   }else if(count == '3'){
      if(numCount == '1'){
         $(this).addClass('seatActive');
         $('.movieSeat1Span').text($(this).attr('value'));
         $('#movieSeat1').attr('value', $(this).attr('value'));
          var mainSeat = $(this).attr('id');
          mainSeat *= 1;
          
          if(mainSeat == 1 || mainSeat == 3 || mainSeat == 6 || mainSeat == 8 || mainSeat == 11 || mainSeat == 13 || mainSeat == 16 || mainSeat == 18){
             var subSeat = mainSeat+1;
             subSeat += "";
             $('#'+subSeat+'').addClass('seatActive');
             $('.movieSeat2Span').text($('#'+subSeat+'').attr('value'));
             $('#movieSeat2').attr('value', $('#'+subSeat+'').attr('value'));
          }else{
             var subSeat = mainSeat-1;
             subSeat += "";
             $('#'+subSeat+'').addClass('seatActive');
             $('.movieSeat2Span').text($('#'+subSeat+'').attr('value'));
             $('#movieSeat2').attr('value', $('#'+subSeat+'').attr('value'));
          }
          $('#SelectSeatCount').attr('value', '2');
      }else if(numCount == '2'){
           $(this).addClass('seatActive');
              $('#SelectSeatCount').attr('value', '3');
              $('.movieSeat3Span').text($(this).attr('value'));
              $('#movieSeat3').attr('value', $(this).attr('value'));
            
      }else{
         var result = confirm('이미 좌석을 모두 선택하였습니다. \n 선택하신 좌석을 변경하시겠습니까?');
         if(result == true){
            $('#movieSeat1').attr('value', '');
             $('#movieSeat2').attr('value', '');
             $('#movieSeat3').attr('value', '');
            $('.movieSeat1Span').text("");
             $('.movieSeat2Span').text("");
             $('.movieSeat3Span').text("");
            $('.col').removeClass('seatActive');
            $(this).addClass('seatActive');
            $('.movieSeat1Span').text($(this).attr('value'));
            $('#movieSeat1').attr('value', $(this).attr('value'));
             var mainSeat = $(this).attr('id');
             mainSeat *= 1;
             
             if(mainSeat == 1 || mainSeat == 3 || mainSeat == 6 || mainSeat == 8 || mainSeat == 11 || mainSeat == 13 || mainSeat == 16 || mainSeat == 18){
                var subSeat = mainSeat+1;
                subSeat += "";
                $('#'+subSeat+'').addClass('seatActive');
                 $('.movieSeat2Span').text($('#'+subSeat+'').attr('value'));
                 $('#movieSeat2').attr('value', $('#'+subSeat+'').attr('value'));
             }else{
                var subSeat = mainSeat-1;
                subSeat += "";
                $('#'+subSeat+'').addClass('seatActive');
                $('.movieSeat2Span').text($('#'+subSeat+'').attr('value'));
                $('#movieSeat2').attr('value', $('#'+subSeat+'').attr('value'));
             }
             $('#SelectSeatCount').attr('value', '2');
             
         }
      }
   }else if(count == '4'){
      if(numCount == '1'){
         $(this).addClass('seatActive');
         $('.movieSeat1Span').text($(this).attr('value'));
         $('#movieSeat1').attr('value', $(this).attr('value'));
          var mainSeat = $(this).attr('id');
          mainSeat *= 1;
          
          if(mainSeat == 1 || mainSeat == 3 || mainSeat == 6 || mainSeat == 8 || mainSeat == 11 || mainSeat == 13 || mainSeat == 16 || mainSeat == 18){
             var subSeat = mainSeat+1;
             subSeat += "";
             $('#'+subSeat+'').addClass('seatActive');
             $('.movieSeat2Span').text($('#'+subSeat+'').attr('value'));
             $('#movieSeat2').attr('value', $('#'+subSeat+'').attr('value'));
          }else{
             var subSeat = mainSeat-1;
             subSeat += "";
             $('#'+subSeat+'').addClass('seatActive');
             $('.movieSeat2Span').text($('#'+subSeat+'').attr('value'));
             $('#movieSeat2').attr('value', $('#'+subSeat+'').attr('value'));
          }
          $('#SelectSeatCount').attr('value', '2');
      }else if(numCount == '2'){
         $(this).addClass('seatActive');
         $('.movieSeat3Span').text($(this).attr('value'));
         $('#movieSeat3').attr('value', $(this).attr('value'));
          var mainSeat = $(this).attr('id');
          mainSeat *= 1;
          
          if(mainSeat == 1 || mainSeat == 3 || mainSeat == 6 || mainSeat == 8 || mainSeat == 11 || mainSeat == 13 || mainSeat == 16 || mainSeat == 18){
             var subSeat = mainSeat+1;
             subSeat += "";
             $('#'+subSeat+'').addClass('seatActive');
              $('.movieSeat4Span').text($('#'+subSeat+'').attr('value'));
              $('#movieSeat4').attr('value', $('#'+subSeat+'').attr('value'));
          }else{
             var subSeat = mainSeat-1;
             subSeat += "";
             $('#'+subSeat+'').addClass('seatActive');
              $('.movieSeat4Span').text($('#'+subSeat+'').attr('value'));
              $('#movieSeat4').attr('value', $('#'+subSeat+'').attr('value'));
          }
          $('#SelectSeatCount').attr('value', '4');
      }else{
         var result = confirm('이미 좌석을 모두 선택하였습니다. \n 선택하신 좌석을 변경하시겠습니까?');
         if(result == true){
            $('#movieSeat1').attr('value', '');
             $('#movieSeat2').attr('value', '');
             $('#movieSeat3').attr('value', '');
             $('#movieSeat4').attr('value', '');
            $('.movieSeat1Span').text("");
             $('.movieSeat2Span').text("");
             $('.movieSeat3Span').text("");
             $('.movieSeat4Span').text("");
            $('.col').removeClass('seatActive');
            $(this).addClass('seatActive');
            $('.movieSeat1Span').text($(this).attr('value'));
            $('#movieSeat1').attr('value', $(this).attr('value'));
             var mainSeat = $(this).attr('id');
             mainSeat *= 1;
             
             if(mainSeat == 1 || mainSeat == 3 || mainSeat == 6 || mainSeat == 8 || mainSeat == 11 || mainSeat == 13 || mainSeat == 16 || mainSeat == 18){
                var subSeat = mainSeat+1;
                subSeat += "";
                $('#'+subSeat+'').addClass('seatActive');
                $('.movieSeat2Span').text($('#'+subSeat+'').attr('value'));
                $('#movieSeat2').attr('value', $('#'+subSeat+'').attr('value'));
             }else{
                var subSeat = mainSeat-1;
                subSeat += "";
                $('#'+subSeat+'').addClass('seatActive');
                $('.movieSeat2Span').text($('#'+subSeat+'').attr('value'));
                $('#movieSeat2').attr('value', $('#'+subSeat+'').attr('value'));
             }
             $('#SelectSeatCount').attr('value', '2');
         }
      }
   }else if(count == '5'){
      if(numCount == '1'){
         $(this).addClass('seatActive');
          var mainSeat = $(this).attr('id');
          $('.movieSeat1Span').text($(this).attr('value'));
          $('#movieSeat1').attr('value', $(this).attr('value'));
          mainSeat *= 1;
          
          if(mainSeat == 1 || mainSeat == 3 || mainSeat == 6 || mainSeat == 8 || mainSeat == 11 || mainSeat == 13 || mainSeat == 16 || mainSeat == 18){
             var subSeat = mainSeat+1;
             subSeat += "";
             $('#'+subSeat+'').addClass('seatActive');
             $('.movieSeat2Span').text($('#'+subSeat+'').attr('value'));
             $('#movieSeat2').attr('value', $('#'+subSeat+'').attr('value'));
          }else{
             var subSeat = mainSeat-1;
             subSeat += "";
             $('#'+subSeat+'').addClass('seatActive');
             $('.movieSeat2Span').text($('#'+subSeat+'').attr('value'));
             $('#movieSeat2').attr('value', $('#'+subSeat+'').attr('value'));
          }
          $('#SelectSeatCount').attr('value', '2');
      }else if(numCount == '2'){
         $(this).addClass('seatActive');
          var mainSeat = $(this).attr('id');
          $('.movieSeat3Span').text($(this).attr('value'));
          $('#movieSeat3').attr('value', $(this).attr('value'));
          mainSeat *= 1;
          
          if(mainSeat == 1 || mainSeat == 3 || mainSeat == 6 || mainSeat == 8 || mainSeat == 11 || mainSeat == 13 || mainSeat == 16 || mainSeat == 18){
             var subSeat = mainSeat+1;
             subSeat += "";
             $('#'+subSeat+'').addClass('seatActive');
             $('.movieSeat4Span').text($('#'+subSeat+'').attr('value'));
             $('#movieSeat4').attr('value', $('#'+subSeat+'').attr('value'));
          }else{
             var subSeat = mainSeat-1;
             subSeat += "";
             $('#'+subSeat+'').addClass('seatActive');
             $('.movieSeat4Span').text($('#'+subSeat+'').attr('value'));
             $('#movieSeat4').attr('value', $('#'+subSeat+'').attr('value'));
          }
          $('#SelectSeatCount').attr('value', '4');
      }else if(numCount == '4'){
         $(this).addClass('seatActive');
            $('#SelectSeatCount').attr('value', '5');
            $('.movieSeat5Span').text($(this).attr('value'));
            $('#movieSeat5').attr('value', $(this).attr('value'));
      }else{
         var result = confirm('이미 좌석을 모두 선택하였습니다. \n 선택하신 좌석을 변경하시겠습니까?');
         if(result == true){
            $('#movieSeat1').attr('value', '');
             $('#movieSeat2').attr('value', '');
             $('#movieSeat3').attr('value', '');
             $('#movieSeat4').attr('value', '');
             $('#movieSeat5').attr('value', '');
            $('.movieSeat1Span').text("");
             $('.movieSeat2Span').text("");
             $('.movieSeat3Span').text("");
             $('.movieSeat4Span').text("");
             $('.movieSeat5Span').text("");
            $('.col').removeClass('seatActive');
            $(this).addClass('seatActive');
            $('.movieSeat1Span').text($(this).attr('value'));
            $('#movieSeat1').attr('value', $(this).attr('value'));
             var mainSeat = $(this).attr('id');
             mainSeat *= 1;
             
             if(mainSeat == 1 || mainSeat == 3 || mainSeat == 6 || mainSeat == 8 || mainSeat == 11 || mainSeat == 13 || mainSeat == 16 || mainSeat == 18){
                var subSeat = mainSeat+1;
                subSeat += "";
                $('#'+subSeat+'').addClass('seatActive');
                $('.movieSeat2Span').text($('#'+subSeat+'').attr('value'));
                $('#movieSeat2').attr('value', $('#'+subSeat+'').attr('value'));
             }else{
                var subSeat = mainSeat-1;
                subSeat += "";
                $('#'+subSeat+'').addClass('seatActive');
                $('.movieSeat2Span').text($('#'+subSeat+'').attr('value'));
                $('#movieSeat2').attr('value', $('#'+subSeat+'').attr('value'));
             }
             $('#SelectSeatCount').attr('value', '2');
         }
      }
   }
});

});

$('body').on('click', '.ticketSelectBar_Back_Movie' , function(){
    var ticketplayingmovie = $('.ticketMovieName').attr('value');
     var tickettheatermoviegrade = $('.ticketMovieGrade').attr('value');
     var ticketmovieposter = $('.movieposterimg').attr('value');
     var tickettheaterbranch = $('.selectBarTheater').attr('value');
     var tickettheaterdate = $('.selectBarDate').attr('value');
     var tickettheaterscreen = $('.selectBarAuditorium').attr('value');
     var tickettheatertime = $('.selectBarTime').attr('value');
     var ticketpeople = $('.selectBarPeople').attr('value');
     var ticketselectMovieSeq = $('#selectMovieSeq').attr('value');
     
     url = '/mvProject/ticket/ticketingStep1.do';
     
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
     var hiTicketselectMovieSeq = $("<input type='hidden' value='"+ticketselectMovieSeq+"' name='ticketselectMovieSeq'>");
   
     $form.append(hiTicketplayingmovie).append(hiTickettheatermoviegrade).append(hiTicketmovieposter).append(hiTickettheaterbranch).append(hiTickettheaterdate).append(hiTickettheaterscreen).append(hiTickettheatertime).append(hiTicketselectMovieSeq);
     $form.submit();
   
});

$('body').on('click' , '.selectBar_Payment_Selection_Next_Btn', function() {
    var ticketplayingmovie = $('.ticketMovieName').attr('value');
     var tickettheatermoviegrade = $('.ticketMovieGrade').attr('value');
     var ticketmovieposter = $('.movieposterimg').attr('value');
     var tickettheaterbranch = $('.selectBarTheater').attr('value');
     var tickettheaterdate = $('.selectBarDate').attr('value');
     var tickettheaterscreen = $('.selectBarAuditorium').attr('value');
     var tickettheatertime = $('.selectBarTime').attr('value');
     var ticketpeople = $('.selectBarPeople').attr('value');
     var ticketselectMovieSeq = $('#selectMovieSeq').attr('value');
     
        var ticketseats1 = $('#movieSeat1').attr('value');  
      var ticketseats2 = $('#movieSeat2').attr('value');
      var ticketseats3 = $('#movieSeat3').attr('value');
      var ticketseats4 = $('#movieSeat4').attr('value');
      var ticketseats5 = $('#movieSeat5').attr('value');
     
     var ticketprice = $('.selectBar_Payment_Total').attr('value');
     
     if(ticketseats1 == ""){
        alert("자리를 선택해주세요");
     }else{
        $.ajax({
                type : "POST",
                url : "/mvProject/ticket/seatsCheck.do",
                data:{"ticketplayingmovie":ticketplayingmovie, "tickettheaterbranch":tickettheaterbranch,"tickettheaterdate":tickettheaterdate,"tickettheaterscreen":tickettheaterscreen, "tickettheatertime":tickettheatertime, "ticketseats1":ticketseats1, "ticketseats2":ticketseats2, "ticketseats3":ticketseats3, "ticketseats4":ticketseats4, "ticketseats5":ticketseats5},
               dataType : "json",
               success : function(data) {
           /*    alert(JSON.stringify(data)); */
                  if(data.timeScheduleDTO == null){
                     alert("이미 예약된 좌석입니다.");
                  }else{
                     url = '/mvProject/ticket/ticketPay.do';
                    
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
                    var hiTicketpeople = $("<input type='hidden' value='"+ticketpeople+"' name='ticketpeople'>");
                    var hiTicketprice = $("<input type='hidden' value='"+ticketprice+"' name='ticketprice'>");
                    var hiTicketselectMovieSeq = $("<input type='hidden' value='"+ticketselectMovieSeq+"' name='ticketselectMovieSeq'>");
                    var hiTicketseats1 = $("<input type='hidden' value='"+ticketseats1+"' name='ticketseats1'>");
                    var hiTicketseats2 = $("<input type='hidden' value='"+ticketseats2+"' name='ticketseats2'>");
                    var hiTicketseats3 = $("<input type='hidden' value='"+ticketseats3+"' name='ticketseats3'>");
                    var hiTicketseats4 = $("<input type='hidden' value='"+ticketseats4+"' name='ticketseats4'>");
                    var hiTicketseats5 = $("<input type='hidden' value='"+ticketseats5+"' name='ticketseats5'>");
                    
                    
                    
                    $form.append(hiTicketplayingmovie).append(hiTickettheatermoviegrade).append(hiTicketmovieposter).append(hiTickettheaterbranch).append(hiTickettheaterdate).append(hiTickettheaterscreen).append(hiTickettheatertime).append(hiTicketpeople).append(hiTicketprice).append(hiTicketselectMovieSeq).append(hiTicketseats1).append(hiTicketseats2).append(hiTicketseats3).append(hiTicketseats4).append(hiTicketseats5);
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