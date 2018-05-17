package client.theaters.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import client.movies.bean.MovieplatformDTO;
import client.theaters.bean.TheatersDTO;
import client.theaters.bean.TimeScheduleDTO;

@Transactional
@Component
public class TheatersDAOMybatis implements TheatersDAO{

   @Autowired
   private SqlSession sqlSession;

   
   public List<TheatersDTO> getTheatersInfo(String region) {
      return sqlSession.selectList("theatersSQL.getTheatersInfo", region);
   }
   
   public List<TheatersDTO> getBranchList(String region) {
      return sqlSession.selectList("theatersSQL.getBranchList", region);
   }

   public List<TheatersDTO> chooseBranch(String seq) {
      return sqlSession.selectList("theatersSQL.chooseBranch", Integer.parseInt(seq));
   }

   
   public List<TimeScheduleDTO> getBranchMovieDistinct(Map<String, String> mapForMovieInfo) {
      return sqlSession.selectList("theatersSQL.getBranchMovieDistinct", mapForMovieInfo);
   }

   
   public List<TimeScheduleDTO> getScreenInfo(HashMap<String, String> map) {
      return sqlSession.selectList("theatersSQL.getScreenInfo", map);
   }
   
   public List<TimeScheduleDTO> getScheduleInfo(HashMap<String, String> map2) {
      return sqlSession.selectList("theatersSQL.getScheduleInfo", map2);
   }

   @Override
   public List<MovieplatformDTO> getMovieInfo(String movienameforkr) {
      return sqlSession.selectList("theatersSQL.getMovieInfo", movienameforkr);
   }

   @Override
   public List<TimeScheduleDTO> getDateInfo(String branch) {
      return sqlSession.selectList("theatersSQL.getDateInfo", branch);
   }

}