package client.ticket.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import client.member.bean.MemberDTO;
import client.movies.bean.MovieplatformDTO;
import client.theaters.bean.TimeScheduleDTO;
import client.ticket.bean.TicketScheduleTimeDTO;

@Transactional
@Component
public class TicketDAOMybatis implements TicketDAO{
   
   @Autowired
   private SqlSession sqlSession;

   @Override
   public void makeTicketPayment1(Map<String, Object> reservationMap1) {
      sqlSession.insert("ticketSQL.makeTicketPayment1", reservationMap1);
   }
   @Override
   public void makeTicketPayment2(Map<String, Object> reservationMap2) {
      sqlSession.insert("ticketSQL.makeTicketPayment2", reservationMap2);
   }
   @Override
   public void makeTicketPayment3(Map<String, Object> reservationMap3) {
      sqlSession.insert("ticketSQL.makeTicketPayment3", reservationMap3);
   }
   @Override
   public void makeTicketPayment4(Map<String, Object> reservationMap4) {
      sqlSession.insert("ticketSQL.makeTicketPayment4", reservationMap4);
   }
   @Override
   public void makeTicketPayment5(Map<String, Object> reservationMap5) {
      sqlSession.insert("ticketSQL.makeTicketPayment5", reservationMap5);
   }
   

   @Override
   public String getUserPoint(String id) {
      return sqlSession.selectOne("ticketSQL.getUserPoint", id);
      
   } 
   
   
   @Override
   public String getTheaterRegion(int seq) {
      return sqlSession.selectOne("ticketSQL.getTheaterRegion", seq);
   }

   @Override
   public void insertPointUsage1(Map<String, String> usageMap) {
      sqlSession.insert("ticketSQL.insertPointUsage1", usageMap);
   }
   @Override
   public void insertPointUsage2(Map<String, String> usageMap) {
      sqlSession.insert("ticketSQL.insertPointUsage2", usageMap);
   }
   @Override
   public void insertPointUsage3(Map<String, String> usageMap) {
      sqlSession.insert("ticketSQL.insertPointUsage3", usageMap);
   }@Override
   public void insertPointUsage4(Map<String, String> usageMap) {
      sqlSession.insert("ticketSQL.insertPointUsage4", usageMap);
   }
   
   

   @Override
   public void updateUserPoints(Map<String, Object> memberMap) {
      sqlSession.update("ticketSQL.updateUserPoints", memberMap);
   }

   @Override
   public void updateMovieSeat1(Map<String, String> timeScheduleMap1) {
      sqlSession.update("ticketSQL.updateMovieSeat1", timeScheduleMap1);
   }

   @Override
   public void updateMovieSeat2(Map<String, String> timeScheduleMap2) {
      sqlSession.update("ticketSQL.updateMovieSeat2", timeScheduleMap2);
   }

   @Override
   public void updateMovieSeat3(Map<String, String> timeScheduleMap3) {
      sqlSession.update("ticketSQL.updateMovieSeat3", timeScheduleMap3);
   }

   @Override
   public void updateMovieSeat4(Map<String, String> timeScheduleMap4) {
      sqlSession.update("ticketSQL.updateMovieSeat4", timeScheduleMap4);
   }

   @Override
   public void updateMovieSeat5(Map<String, String> timeScheduleMap5) {
      sqlSession.update("ticketSQL.updateMovieSeat5", timeScheduleMap5);
   }

   
   
   
   
   
   
   
   
   
   @Override
      public MovieplatformDTO selectbarMovieName(String name) {
         Map<String, String> map = new HashMap<>();
         map.put("name", name);
         return sqlSession.selectOne("ticketSQL.selectbarMovieName", map);
         
      }

      @Override
      public List<TimeScheduleDTO> selectMovieSchedule() {
         return sqlSession.selectList("ticketSQL.selectMovieSchedule");
      }

      @Override
      public List<TimeScheduleDTO> selectMovieScheduleTheater() {
         return sqlSession.selectList("ticketSQL.selectMovieScheduleTheatre");
      }

      @Override
      public List<TicketScheduleTimeDTO> selectMovieScheduleYear() {
         return sqlSession.selectList("ticketSQL.selectMovieScheduleYear");
      }

      @Override
      public List<TicketScheduleTimeDTO> selectMovieScheduleMonth() {
         return sqlSession.selectList("ticketSQL.selectMovieScheduleMonth");
      }
      @Override
      public List<TicketScheduleTimeDTO> selectMovieScheduleDay() {
         return sqlSession.selectList("ticketSQL.selectMovieScheduleDay");
      }
      
      @Override
      public List<TimeScheduleDTO> selectMovieScheduleTime(Map<String, String> map) {
         return sqlSession.selectList("ticketSQL.selectMovieScheduleTime", map);
      }

      @Override
      public TimeScheduleDTO selectSeatStatus(Map<String, String> map) {
         return sqlSession.selectOne("ticketSQL.selectSeatStatus", map);
      }

      @Override
      public TimeScheduleDTO seatcheck1(Map<String, String> map) {
         return sqlSession.selectOne("ticketSQL.seatcheck1", map);
      }

      @Override
      public TimeScheduleDTO seatcheck2(Map<String, String> map) {
         return sqlSession.selectOne("ticketSQL.seatcheck2", map);
      }

      @Override
      public TimeScheduleDTO seatcheck3(Map<String, String> map) {
         return sqlSession.selectOne("ticketSQL.seatcheck3", map);
      }

      @Override
      public TimeScheduleDTO seatcheck4(Map<String, String> map) {
         return sqlSession.selectOne("ticketSQL.seatcheck4", map);
      }

      @Override
      public TimeScheduleDTO seatcheck5(Map<String, String> map) {
         return sqlSession.selectOne("ticketSQL.seatcheck5", map);
      }

      @Override
      public List<TimeScheduleDTO> selectMovieScheduleScreenNTime(Map<String, String> map) {
         return sqlSession.selectList("ticketSQL.selectMovieScheduleScreenNTime", map);
      }
	@Override
	public String selectTheaterSeq(String theaterBranch) {
		return sqlSession.selectOne("ticketSQL.selectTheaterSeq", theaterBranch);
	}
      
      
}