package client.theaters.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import client.movies.bean.MovieplatformDTO;
import client.theaters.bean.TheatersDTO;
import client.theaters.bean.TimeScheduleDTO;

public interface TheatersDAO {

   public List<TheatersDTO> getTheatersInfo(String region);
   public List<TheatersDTO> getBranchList(String regioncode);
   public List<TheatersDTO> chooseBranch(String seq);
   public List<TimeScheduleDTO> getBranchMovieDistinct(Map<String, String> mapForMovieInfo);
   public List<TimeScheduleDTO> getScreenInfo(HashMap<String, String> map);
   public List<TimeScheduleDTO> getScheduleInfo(HashMap<String, String> map2);
   public List<MovieplatformDTO> getMovieInfo(String movienameforkr);
   public List<TimeScheduleDTO> getDateInfo(String branch);
   
      
   

}