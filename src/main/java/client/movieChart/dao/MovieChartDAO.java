package client.movieChart.dao;

import java.util.List;
import java.util.Map;

import client.movies.bean.MovieplatformDTO;

public interface MovieChartDAO {
   
   public List<MovieplatformDTO> getAgelim(Map<String, String> map);
   
   
}