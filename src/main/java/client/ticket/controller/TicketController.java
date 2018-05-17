package client.ticket.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import client.member.bean.MemberDTO;
import client.member.dao.MemberDAO;
import client.movies.bean.MovieplatformDTO;
import client.theaters.bean.TimeScheduleDTO;
import client.ticket.bean.TicketScheduleTimeDTO;
import client.ticket.dao.TicketDAO;

@RequestMapping("/ticket")
@Component
public class TicketController {

   @Autowired
   private TicketDAO ticketDAO;

   @Autowired
   private MemberDAO memberDAO;


   @RequestMapping(value = "/ticketingStep1.do", method = {RequestMethod.POST,RequestMethod.GET})
   public ModelAndView ToTicketing(HttpSession session, @RequestParam(required=false) Map<String, String> map) {

      String id = (String)session.getAttribute("loginId");

      ModelAndView mav = new ModelAndView();

      if(map != null) {
         mav.addObject("ticketplayingmovie", map.get("ticketplayingmovie"));
         mav.addObject("tickettheatermoviegrade", map.get("tickettheatermoviegrade"));
         mav.addObject("ticketmovieposter", map.get("ticketmovieposter"));
         mav.addObject("tickettheaterbranch", map.get("tickettheaterbranch"));
         mav.addObject("tickettheaterdate", map.get("tickettheaterdate"));
         mav.addObject("tickettheaterscreen", map.get("tickettheaterscreen"));
         mav.addObject("tickettheatertime", map.get("tickettheatertime"));
         mav.addObject("selectMovieSeq", map.get("selectMovieSeq"));

      }
      mav.addObject("display", "/WEB-INF/ticket/ticketingStep1.jsp");
      mav.setViewName("/WEB-INF/main/index");
      return mav;
   }

   @RequestMapping(value = "/ticketingStep2.do", method = {RequestMethod.POST,RequestMethod.GET})
   public ModelAndView ticketingStep2(HttpSession session, @RequestParam Map<String, String> map) {

      String id = (String)session.getAttribute("loginId");

      ModelAndView mav = new ModelAndView();
      
      if(id == null) {
          mav.setViewName("redirect:/ticket/ticketingStep1.do");
      }else {
      mav.addObject("ticketplayingmovie", map.get("ticketplayingmovie"));
      mav.addObject("tickettheatermoviegrade", map.get("tickettheatermoviegrade"));
      mav.addObject("ticketmovieposter", map.get("ticketmovieposter"));
      mav.addObject("tickettheaterbranch", map.get("tickettheaterbranch"));
      mav.addObject("tickettheaterdate", map.get("tickettheaterdate"));
      mav.addObject("tickettheaterscreen", map.get("tickettheaterscreen"));
      mav.addObject("tickettheatertime", map.get("tickettheatertime"));
      TimeScheduleDTO seatDTO = ticketDAO.selectSeatStatus(map);
      mav.addObject("seatDTO", seatDTO);
      mav.addObject("ticketselectMovieSeq", map.get("selectMovieSeq"));

      mav.addObject("display", "/WEB-INF/ticket/ticketingStep2.jsp");
      mav.setViewName("/WEB-INF/main/index");
      }
      return mav;
   }


   @RequestMapping(value = "/ticketPay.do", method = {RequestMethod.POST,RequestMethod.GET})
   public ModelAndView ticketPay(HttpSession session, @RequestParam Map<String,String> map) {

      String id = (String)session.getAttribute("loginId");
      
      ModelAndView mav = new ModelAndView();

      if(id == null) {
          mav.setViewName("redirect:/ticket/ticketingStep1.do");
      }else {
      
      mav.addObject("ticketplayingmovie", map.get("ticketplayingmovie"));
      mav.addObject("tickettheatermoviegrade", map.get("tickettheatermoviegrade"));
      mav.addObject("ticketmovieposter", map.get("ticketmovieposter"));
      mav.addObject("tickettheaterbranch", map.get("tickettheaterbranch"));
      mav.addObject("tickettheaterdate", map.get("tickettheaterdate"));
      mav.addObject("tickettheaterscreen", map.get("tickettheaterscreen"));
      mav.addObject("tickettheatertime", map.get("tickettheatertime"));
      mav.addObject("ticketpeople", map.get("ticketpeople"));
      mav.addObject("ticketprice", map.get("ticketprice"));

      mav.addObject("ticketseats1", map.get("ticketseats1"));
      mav.addObject("ticketseats2", map.get("ticketseats2"));
      mav.addObject("ticketseats3", map.get("ticketseats3"));
      mav.addObject("ticketseats4", map.get("ticketseats4"));
      mav.addObject("ticketseats5", map.get("ticketseats5"));

      mav.addObject("ticketselectMovieSeq", map.get("ticketselectMovieSeq"));

      String userPoint = ticketDAO.getUserPoint(id);
      mav.addObject("userPoint", userPoint);

      mav.addObject("display", "/WEB-INF/ticket/ticketPay.jsp");
      mav.setViewName("/WEB-INF/main/index");
      }
      return mav;
   }


   @RequestMapping(value = "/ticketPaymentAsk.do", method = {RequestMethod.POST,RequestMethod.GET})
   public ModelAndView ticketPaymentAsk(HttpSession session, @RequestParam Map<String, String> map) {

      String id = (String)session.getAttribute("loginId");

      ModelAndView mav = new ModelAndView();
      
      if(id == null) {
          mav.setViewName("redirect:/ticket/ticketingStep1.do");
      }else {
      
      mav.addObject("ticketplayingmovie", map.get("ticketplayingmovie"));
      mav.addObject("tickettheatermoviegrade", map.get("tickettheatermoviegrade"));
      mav.addObject("ticketmovieposter", map.get("ticketmovieposter"));
      mav.addObject("tickettheaterbranch", map.get("tickettheaterbranch"));
      mav.addObject("tickettheaterdate", map.get("tickettheaterdate"));
      mav.addObject("tickettheaterscreen", map.get("tickettheaterscreen"));
      mav.addObject("tickettheatertime", map.get("tickettheatertime"));
      mav.addObject("ticketpeople", map.get("ticketpeople"));
      mav.addObject("ticketprice", map.get("ticketprice"));


      mav.addObject("ticketseats1", map.get("ticketseats1"));
      mav.addObject("ticketseats2", map.get("ticketseats2"));
      mav.addObject("ticketseats3", map.get("ticketseats3"));
      mav.addObject("ticketseats4", map.get("ticketseats4"));
      mav.addObject("ticketseats5", map.get("ticketseats5"));
      
      mav.addObject("ticketselectMovieSeq", map.get("ticketselectMovieSeq"));

      if(map.get("usedPoint") == null) {
         map.put("usedPoint", "0");
      }
      mav.addObject("usedPoint", map.get("usedPoint"));

      mav.addObject("display", "/WEB-INF/ticket/ticketPaymentAsk.jsp");
      mav.setViewName("/WEB-INF//main/index");
      }
      return mav;
   }

   @RequestMapping(value = "/ticketPaymentComplete.do", method = {RequestMethod.POST,RequestMethod.GET})
   public ModelAndView ticketPaymentComplete(@RequestParam Map<String, String> map,
         HttpSession session) throws ParseException {

      String id = (String)session.getAttribute("loginId");
      
      ModelAndView mav = new ModelAndView();
      if(id == null) {
    	  mav.setViewName("redirect:/ticket/ticketingStep1.do");
      }else {
      
      //------------------------------------------------ 예매번호 설정 ---------
      String theaterBranch = map.get("tickettheaterbranch");
      
      String theaterBranchCode = ticketDAO.selectTheaterSeq(theaterBranch);
      
      Date clicketTime = new Date();
      SimpleDateFormat date = new SimpleDateFormat("YYMMDD");
      SimpleDateFormat time = new SimpleDateFormat("HHMM-SSSS");
      String ticketmoviecode = theaterBranchCode + "-" + date.format(clicketTime) + "-" + time.format(clicketTime);
      //--------------------------------------------------------------------


      //-------------- ticketReservation에 insert될 부분 -------------

      Map<String, Object> reservationMap = new HashMap<>();

      reservationMap.put("id", id);
      reservationMap.put("ticketmoviecode", ticketmoviecode);
      reservationMap.put("ticketmoviename", map.get("ticketplayingmovie"));
      reservationMap.put("ticketmoviegrade", map.get("tickettheatermoviegrade"));
      reservationMap.put("ticketmoviebranch", map.get("tickettheaterbranch"));
      reservationMap.put("ticketmoviescreen", map.get("tickettheaterscreen"));
      reservationMap.put("ticketmoviedate", map.get("tickettheaterdate")+map.get("tickettheatertime"));
      reservationMap.put("ticketmoviepeople", map.get("ticketpeople"));
      reservationMap.put("ticketmovieposter", map.get("ticketmovieposter"));
      reservationMap.put("ticketmovieprice", map.get("ticketprice"));
      reservationMap.put("ticketselectMovieSeq", map.get("ticketselectMovieSeq"));


      int pointPlused = ((Integer.parseInt(map.get("ticketpeople"))) * 90);
      reservationMap.put("pointPlused", pointPlused);

      if ((map.get("ticketpeople")).equals("1")) {
         reservationMap.put("ticketmovieseat1", map.get("ticketseats1"));

         ticketDAO.makeTicketPayment1(reservationMap);
      }
      else if ((map.get("ticketpeople")).equals("2")) {
         reservationMap.put("ticketmovieseat1", map.get("ticketseats1"));
         reservationMap.put("ticketmovieseat2", map.get("ticketseats2"));

         ticketDAO.makeTicketPayment2(reservationMap);
      }
      else if ((map.get("ticketpeople")).equals("3")) {
         reservationMap.put("ticketmovieseat1", map.get("ticketseats1"));
         reservationMap.put("ticketmovieseat2", map.get("ticketseats2"));
         reservationMap.put("ticketmovieseat3", map.get("ticketseats3"));

         ticketDAO.makeTicketPayment3(reservationMap);
      }
      else if ((map.get("ticketpeople")).equals("4")) {
         reservationMap.put("ticketmovieseat1", map.get("ticketseats1"));
         reservationMap.put("ticketmovieseat2", map.get("ticketseats2"));
         reservationMap.put("ticketmovieseat3", map.get("ticketseats3"));
         reservationMap.put("ticketmovieseat4", map.get("ticketseats4"));

         ticketDAO.makeTicketPayment4(reservationMap);
      }
      else if ((map.get("ticketpeople")).equals("5")) {
         reservationMap.put("ticketmovieseat1", map.get("ticketseats1"));
         reservationMap.put("ticketmovieseat2", map.get("ticketseats2"));
         reservationMap.put("ticketmovieseat3", map.get("ticketseats3"));
         reservationMap.put("ticketmovieseat4", map.get("ticketseats4"));
         reservationMap.put("ticketmovieseat5", map.get("ticketseats5"));

         ticketDAO.makeTicketPayment5(reservationMap);
      }



      //--------------- usagehistory에 insert될 부분 -------------
      Map<String, String> usageMap = new HashMap<>();
      
      map.put("usedCoupon", "0");
      
      usageMap.put("id", id);
      usageMap.put("ticketmoviecode", ticketmoviecode);
      usageMap.put("moviename", map.get("ticketplayingmovie"));
      usageMap.put("ticketmoviebranch", map.get("tickettheaterbranch"));
      usageMap.put("ticketmoviescreen", map.get("tickettheaterscreen"));
      usageMap.put("ticketmoviedate", map.get("tickettheaterdate")+map.get("tickettheatertime"));
      usageMap.put("ticketmoviepeople", map.get("ticketpeople"));
      
      String region = ticketDAO.getTheaterRegion(Integer.parseInt(map.get("ticketselectMovieSeq")));
      usageMap.put("ticketmovieregion", region);
      
      
      if (map.get("usedPoint").equals("0") && map.get("usedCoupon").equals("0")) {
         ticketDAO.insertPointUsage1(usageMap);
      }
      else if (!map.get("usedPoint").equals("0") && map.get("usedCoupon").equals("0")) {
         usageMap.put("usedPoint", map.get("usedPoint"));
         ticketDAO.insertPointUsage2(usageMap);
      }
      else if (map.get("usedPoint").equals("0") && !map.get("usedCoupon").equals("0")) {
         usageMap.put("usedCoupon", map.get("usedCoupon"));
         ticketDAO.insertPointUsage3(usageMap);
      }
      else if (!map.get("usedPoint").equals("0") && !map.get("usedCoupon").equals("0")) {
         usageMap.put("usedPoint", map.get("usedPoint"));
         usageMap.put("usedCoupon", map.get("usedCoupon"));
         ticketDAO.insertPointUsage4(usageMap);
      }
            
      

      //----------- member(testuser1)에 update될 부분 --------------
      //------------ 흠 -----------------------
      Map<String, Object> memberMap = new HashMap<>();
      memberMap.put("id", id);
      memberMap.put("usedPoint", map.get("usedPoint"));
      memberMap.put("pointPlused", pointPlused);
      
      ticketDAO.updateUserPoints(memberMap);


      //---------- timeSchedule(좌석, 총좌석)에 update될 부분 ---------


      if ( (map.get("ticketpeople")).equals("1") ) {
         Map<String, String> timeScheduleMap1 = new HashMap<>();
         timeScheduleMap1.put("ticketmoviepeople", map.get("ticketpeople"));
         timeScheduleMap1.put("ticketselectMovieSeq", map.get("ticketselectMovieSeq"));
         timeScheduleMap1.put("ticketmovieseat1", map.get("ticketseats1"));
         ticketDAO.updateMovieSeat1(timeScheduleMap1);
      }
      else if ( (map.get("ticketpeople")).equals("2") ) {
         Map<String, String> timeScheduleMap2 = new HashMap<>();
         timeScheduleMap2.put("ticketmoviepeople", map.get("ticketpeople"));
         timeScheduleMap2.put("ticketselectMovieSeq", map.get("ticketselectMovieSeq"));
         timeScheduleMap2.put("ticketmovieseat1", map.get("ticketseats1"));
         timeScheduleMap2.put("ticketmovieseat2", map.get("ticketseats2"));

         ticketDAO.updateMovieSeat2(timeScheduleMap2);
      }
      else if ( (map.get("ticketpeople")).equals("3") ) {
         Map<String, String> timeScheduleMap3 = new HashMap<>();
         timeScheduleMap3.put("ticketmoviepeople", map.get("ticketpeople"));
         timeScheduleMap3.put("ticketselectMovieSeq", map.get("ticketselectMovieSeq"));
         timeScheduleMap3.put("ticketmovieseat1", map.get("ticketseats1"));
         timeScheduleMap3.put("ticketmovieseat2", map.get("ticketseats2"));
         timeScheduleMap3.put("ticketmovieseat3", map.get("ticketseats3"));
         ticketDAO.updateMovieSeat3(timeScheduleMap3);
      }
      else if ( (map.get("ticketpeople")).equals("4") ) {
         Map<String, String> timeScheduleMap4 = new HashMap<>();
         timeScheduleMap4.put("ticketmoviepeople", map.get("ticketpeople"));
         timeScheduleMap4.put("ticketselectMovieSeq", map.get("ticketselectMovieSeq"));
         timeScheduleMap4.put("ticketmovieseat1", map.get("ticketseats1"));
         timeScheduleMap4.put("ticketmovieseat2", map.get("ticketseats2"));
         timeScheduleMap4.put("ticketmovieseat3", map.get("ticketseats3"));
         timeScheduleMap4.put("ticketmovieseat4", map.get("ticketseats4"));
         ticketDAO.updateMovieSeat4(timeScheduleMap4);
      }
      else if ( (map.get("ticketpeople")).equals("5") ) {
         Map<String, String> timeScheduleMap5 = new HashMap<>();
         timeScheduleMap5.put("ticketmoviepeople", map.get("ticketpeople"));
         timeScheduleMap5.put("ticketselectMovieSeq", map.get("ticketselectMovieSeq"));
         timeScheduleMap5.put("ticketmovieseat1", map.get("ticketseats1"));
         timeScheduleMap5.put("ticketmovieseat2", map.get("ticketseats2"));
         timeScheduleMap5.put("ticketmovieseat3", map.get("ticketseats3"));
         timeScheduleMap5.put("ticketmovieseat4", map.get("ticketseats4"));
         timeScheduleMap5.put("ticketmovieseat5", map.get("ticketseats5"));
         ticketDAO.updateMovieSeat5(timeScheduleMap5);
      }


      //--------- ticketPaymentComplete.jsp에 깔릴 값 쏴주기 --------------------------
      mav.addObject("ticketMovieCode", ticketmoviecode);
      mav.addObject("ticketmovieposter", map.get("ticketmovieposter"));
      mav.addObject("ticketmoviename", map.get("ticketplayingmovie"));
      mav.addObject("ticketmoviegrade", map.get("tickettheatermoviegrade"));
      mav.addObject("ticketmoviebranch", map.get("tickettheaterbranch"));
      mav.addObject("ticketmoviescreen", map.get("tickettheaterscreen"));
      mav.addObject("ticketmoviedate", map.get("tickettheaterdate")+map.get("tickettheatertime"));
      mav.addObject("ticketmovietime", map.get("tickettheatertime"));
      mav.addObject("ticketmoviepeople", map.get("ticketpeople"));

      mav.addObject("ticketmovieseat1", map.get("ticketseats1"));
      mav.addObject("ticketmovieseat2", map.get("ticketseats2"));
      mav.addObject("ticketmovieseat3", map.get("ticketseats3"));
      mav.addObject("ticketmovieseat4", map.get("ticketseats4"));
      mav.addObject("ticketmovieseat5", map.get("ticketseats5"));

      mav.addObject("ticketmovieprice", map.get("ticketprice"));
      mav.addObject("pointPlused", pointPlused);

      //--------- 페이지 이동 -----------------------------------------------------
      mav.addObject("display", "/WEB-INF/ticket/ticketPaymentComplete.jsp");
      mav.setViewName("/WEB-INF/main/index");
      }
      return mav;
   }






   @RequestMapping(value = "/reservationGuide.do", method = RequestMethod.GET)
   public ModelAndView reservationGuide() {
      ModelAndView mav = new ModelAndView();
      mav.setViewName("/WEB-INF/ticket/reservationGuide");
      return mav;
   }



   @RequestMapping(value = "/selectbarMovieName.do", method = RequestMethod.POST)
   public ModelAndView selectbarMovieName(@RequestParam String movieName) {
      ModelAndView mav = new ModelAndView();
      MovieplatformDTO dto = ticketDAO.selectbarMovieName(movieName);      
      List<MovieplatformDTO> list = new ArrayList<MovieplatformDTO>();
      list.add(dto);

      mav.addObject("list", list);
      mav.setViewName("jsonView");
      return mav;
   }

   @RequestMapping(value = "/selectMovieSchedule.do", method = RequestMethod.POST)
   public ModelAndView selectMovieSchedule() {
      ModelAndView mav = new ModelAndView();
      List<TimeScheduleDTO> list = ticketDAO.selectMovieSchedule();

      mav.addObject("list", list);
      mav.setViewName("jsonView");
      return mav;
   }

   @RequestMapping(value = "/selectMovieScheduleTheatre.do", method = RequestMethod.POST)
   public ModelAndView selectMovieScheduleTheatre() {
      ModelAndView mav = new ModelAndView();
      List<TimeScheduleDTO> list = ticketDAO.selectMovieScheduleTheater();
      mav.addObject("list", list);
      mav.setViewName("jsonView");
      return mav;
   }

   @RequestMapping(value = "/selectMovieScheduleDate.do", method = RequestMethod.POST)
   public ModelAndView selectMovieScheduleYear() {
      ModelAndView mav = new ModelAndView();
      List<TicketScheduleTimeDTO> yearList = ticketDAO.selectMovieScheduleYear();
      List<TicketScheduleTimeDTO> monthList = ticketDAO.selectMovieScheduleMonth();
      List<TicketScheduleTimeDTO> dayList = ticketDAO.selectMovieScheduleDay();


      mav.addObject("yearList", yearList);
      mav.addObject("monthList", monthList);
      mav.addObject("dayList", dayList);
      mav.setViewName("jsonView");
      return mav;
   }




   @RequestMapping(value = "/selectMovieScheduleTime.do", method = RequestMethod.POST)
   public ModelAndView selectMovieScheduleTime(@RequestParam Map<String,String> map) {
      ModelAndView mav = new ModelAndView();
      List<TimeScheduleDTO> list = ticketDAO.selectMovieScheduleTime(map);
      List<TimeScheduleDTO> timeList= ticketDAO.selectMovieScheduleScreenNTime(map);
      mav.addObject("list", list);
      mav.addObject("timeList", timeList);
      mav.setViewName("jsonView");
      return mav;
   }

   @RequestMapping(value = "/seatsCheck.do", method = RequestMethod.POST)
   public ModelAndView seatsCheck(@RequestParam Map<String,String> map) {
      ModelAndView mav = new ModelAndView();


      TimeScheduleDTO timeScheduleDTO = null;
      if(map.get("ticketseats1") != "" && map.get("ticketseats2") == "" && map.get("ticketseats3") == "" && map.get("ticketseats4") == "" && map.get("ticketseats5") == "") {
         timeScheduleDTO = ticketDAO.seatcheck1(map);
      }else if(map.get("ticketseats1") != "" && map.get("ticketseats2") != "" && map.get("ticketseats3") == "" && map.get("ticketseats4") == "" && map.get("ticketseats5") == "") {
         timeScheduleDTO = ticketDAO.seatcheck2(map);
      }else if(map.get("ticketseats1") != "" && map.get("ticketseats2") != "" && map.get("ticketseats3") != "" && map.get("ticketseats4") == "" && map.get("ticketseats5") == "") {
         timeScheduleDTO = ticketDAO.seatcheck3(map);
      }else if(map.get("ticketseats1") != "" && map.get("ticketseats2") != "" && map.get("ticketseats3") != "" && map.get("ticketseats4") != "" && map.get("ticketseats5") == "") {
         timeScheduleDTO = ticketDAO.seatcheck4(map);
      }else if(map.get("ticketseats1") != "" && map.get("ticketseats2") != "" && map.get("ticketseats3") != "" && map.get("ticketseats4") != "" && map.get("ticketseats5") != "") {
         timeScheduleDTO = ticketDAO.seatcheck5(map);
      }

      mav.addObject("timeScheduleDTO", timeScheduleDTO);
      mav.setViewName("jsonView");
      return mav;
   }


   @RequestMapping(value = "/ticketLogin.do", method = RequestMethod.POST)
   public @ResponseBody ModelAndView ticketLogin(@RequestParam Map<String, String> map, HttpSession session) {
      ModelAndView mav = new ModelAndView();
      //DB
      MemberDTO memberDTO = memberDAO.login(map.get("loginId"), map.get("loginPw"));

      if(memberDTO==null) {
         mav.addObject("result", "false");
      }else {
         session.setAttribute("loginId", memberDTO.getId());
         mav.addObject("result", "success");
      }
      mav.setViewName("jsonView");

      return mav;
   }

   @RequestMapping(value="/toticketLogin.do", method = RequestMethod.POST)
   public ModelAndView tototicketLogin(@RequestParam Map<String,String> map, Model model) {
      ModelAndView mav = new ModelAndView();
      mav.addObject("ticketplayingmovie", map.get("ticketplayingmovie"));
      mav.addObject("tickettheatermoviegrade", map.get("tickettheatermoviegrade"));
      mav.addObject("ticketmovieposter", map.get("ticketmovieposter"));
      mav.addObject("tickettheaterbranch", map.get("tickettheaterbranch"));
      mav.addObject("tickettheaterdate", map.get("tickettheaterdate"));
      mav.addObject("tickettheaterscreen", map.get("tickettheaterscreen"));
      mav.addObject("tickettheatertime", map.get("tickettheatertime"));
      mav.addObject("selectMovieSeq", map.get("selectMovieSeq"));
      mav.addObject("display", "/WEB-INF/ticket/ticketLogin.jsp");


      mav.setViewName("/WEB-INF/main/index");

      return mav;

   }

   @RequestMapping(value = "/isLoginOk.do", method = RequestMethod.POST)
   public ModelAndView isLoginOk(HttpSession session) {
      ModelAndView mav = new ModelAndView();

      String id = (String)session.getAttribute("loginId");

      if(id != null) {
         mav.addObject("login", "login");
      }else {
         mav.addObject("login", "logout");
      }
      mav.setViewName("jsonView");
      return mav;
   }



}