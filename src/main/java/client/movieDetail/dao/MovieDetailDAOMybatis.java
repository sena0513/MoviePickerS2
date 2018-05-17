package client.movieDetail.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import client.movies.bean.MovieplatformDTO;

@Transactional
@Component
public class MovieDetailDAOMybatis implements MovieDetailDAO{

   @Autowired
   private SqlSession sqlSession;
   
   public MovieplatformDTO getMovieInfo(int seq) {
      return sqlSession.selectOne("movieDetailSQL.getMovieInfo", seq);
      
   }

@Override
public MovieplatformDTO getMovieInfo(String movienameforkr) {
	return sqlSession.selectOne("movieDetailSQL.getMovieInfoTomovieName", movienameforkr);
}

      
}