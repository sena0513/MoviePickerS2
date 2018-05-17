package client.ticket.dao;

import java.util.List;
import java.util.Map;

import client.member.bean.MemberDTO;
import client.movies.bean.MovieplatformDTO;
import client.theaters.bean.TimeScheduleDTO;
import client.ticket.bean.TicketScheduleTimeDTO;

public interface TicketDAO {

   public void makeTicketPayment1(Map<String, Object> reservationMap1);
   public void makeTicketPayment2(Map<String, Object> reservationMap2);
   public void makeTicketPayment3(Map<String, Object> reservationMap3);
   public void makeTicketPayment4(Map<String, Object> reservationMap4);
   public void makeTicketPayment5(Map<String, Object> reservationMap5);

   public String getUserPoint(String id);

   public void insertPointUsage1(Map<String, String> usageMap);
   public void insertPointUsage2(Map<String, String> usageMap);
   public void insertPointUsage3(Map<String, String> usageMap);
   public void insertPointUsage4(Map<String, String> usageMap);

   public void updateUserPoints(Map<String, Object> memberMap);

   public void updateMovieSeat1(Map<String, String> timeScheduleMap1);
   public void updateMovieSeat2(Map<String, String> timeScheduleMap2);
   public void updateMovieSeat3(Map<String, String> timeScheduleMap3);
   public void updateMovieSeat4(Map<String, String> timeScheduleMap4);
   public void updateMovieSeat5(Map<String, String> timeScheduleMap5);

   
   public String getTheaterRegion(int seq);
   
   

   
   
   public MovieplatformDTO selectbarMovieName(String name);

   public List<TimeScheduleDTO> selectMovieSchedule();

   public List<TimeScheduleDTO> selectMovieScheduleTheater();

   public List<TicketScheduleTimeDTO> selectMovieScheduleYear();

   public List<TimeScheduleDTO> selectMovieScheduleTime(Map<String, String> map);

   public List<TicketScheduleTimeDTO> selectMovieScheduleMonth();

   public List<TicketScheduleTimeDTO> selectMovieScheduleDay();

   public TimeScheduleDTO selectSeatStatus(Map<String, String> map);

   public TimeScheduleDTO seatcheck1(Map<String, String> map);
   public TimeScheduleDTO seatcheck2(Map<String, String> map);
   public TimeScheduleDTO seatcheck3(Map<String, String> map);
   public TimeScheduleDTO seatcheck4(Map<String, String> map);
   public TimeScheduleDTO seatcheck5(Map<String, String> map);

   public List<TimeScheduleDTO> selectMovieScheduleScreenNTime(Map<String, String> map);
   public String selectTheaterSeq(String theaterBranch);

   
   
   

}