package client.movieChart.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import client.movies.bean.MovieplatformDTO;

@Transactional
@Component
public class MovieChartDAOMybatis implements MovieChartDAO {
   
   @Autowired
   private SqlSession sqlSession;

   public List<MovieplatformDTO> getAgelim(Map<String, String> map) {
      return sqlSession.selectList("movieChartSQL.getAgelim", map);
   }
   
   
   
   
   
}