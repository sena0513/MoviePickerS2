package client.movieDetail.dao;

import client.movies.bean.MovieplatformDTO;

public interface MovieDetailDAO {

   public MovieplatformDTO getMovieInfo(int seq);
   
   public MovieplatformDTO getMovieInfo(String movienameforkr);
}
