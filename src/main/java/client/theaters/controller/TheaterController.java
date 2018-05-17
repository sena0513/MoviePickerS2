package client.theaters.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import client.movies.bean.MovieplatformDTO;
import client.theaters.bean.TheatersDTO;
import client.theaters.bean.TimeScheduleDTO;
import client.theaters.dao.TheatersDAO;

@RequestMapping("theaters")
@Component
public class TheaterController {

   @Autowired
   private TheatersDAO theatersDAO;

   @RequestMapping(value="/theaters.do", method=RequestMethod.GET)
   public ModelAndView theaters(HttpServletRequest request, HttpSession session,
         @RequestParam(value="regioncode", required=false) String regioncode,
         @RequestParam(value="seq", required=false) String seq,
         @RequestParam(value="month", required=false) String month,
         @RequestParam(value="day", required=false) String day) {

      ModelAndView mav = new ModelAndView();

      //intro page of theaters
      if(seq==null && regioncode==null) {
         regioncode = "seoul";

         List<TheatersDTO> regionInfo =  theatersDAO.getTheatersInfo(regioncode); //Default rigon : seuol
         //지역 출력
         String newSeq = String.valueOf(regionInfo.get(0).getSeq());
         List<TheatersDTO> chooseBranch = theatersDAO.chooseBranch(newSeq);

         String branch = chooseBranch.get(0).getBranch();
         /*---------------------------------아래부터는 else와 공통사항 -------------------------*/

         //지점의 영화 상영 날짜 정보 출력
         List<TimeScheduleDTO> getDateInfo = theatersDAO.getDateInfo(branch);

 
         /*if(getDateInfo.size()==0) {
            request.setAttribute("regionInfo", regionInfo); //TheatersDTO
            request.setAttribute("chooseBranch", chooseBranch);    //TheatersDTO

            mav.addObject ("display","/WEB-INF/theaters/theaters.jsp");
            mav.setViewName("/WEB-INF/main/index");

            return mav;

         }else {*/

            String date =  getDateInfo.get(0).getMonth()+"-"+getDateInfo.get(0).getDay();

            Map<String, String> mapForMovieInfo = new HashMap<String, String>();
            mapForMovieInfo.put("branch", branch);
            mapForMovieInfo.put("date", date);

            List<TimeScheduleDTO> getBranchMovieDistinct = theatersDAO.getBranchMovieDistinct(mapForMovieInfo);

            //영화 정보 출력
            List<MovieplatformDTO> getMovieInfo = new ArrayList<MovieplatformDTO>();
            List<MovieplatformDTO> list2 = new ArrayList<>();

            for(int i = 0; i <getBranchMovieDistinct.size(); i++) { 
               list2 = theatersDAO.getMovieInfo(getBranchMovieDistinct.get(i).getPlayingmovie());

               for(int j = 0; j <list2.size(); j++) { 
                  getMovieInfo.add(list2.get(j));
               }
            }

            //영화네임 출력
            HashMap<String, String> map = new HashMap<String, String>();
            List<TimeScheduleDTO> getScreenInfo = new ArrayList<TimeScheduleDTO>();
            List<TimeScheduleDTO> list = new ArrayList<>();

            //영화에 해당하는 관 출력
            for(int i=0;i<getBranchMovieDistinct.size();i++) {      
               map.put("theaterBranch", branch);
               map.put("playingMovie", getBranchMovieDistinct.get(i).getPlayingmovie()); 
               map.put("date", date);

               list = theatersDAO.getScreenInfo(map); 

               for(int j = 0; j <list.size(); j++) { 
                  getScreenInfo.add(list.get(j));
               }
            }

            //-------------------------------------------------------------

            //스케쥴 출력
            HashMap<String, String> map2 = new HashMap<String, String>();
            List<TimeScheduleDTO> getScheduleInfo = new ArrayList<TimeScheduleDTO>();
            List<TimeScheduleDTO> list3 = new ArrayList<>();

            for(int j=0;j<getScreenInfo.size();j++) {
               map2.put("theaterBranch", branch);
               map2.put("playingMovie", getScreenInfo.get(j).getPlayingmovie());
               map2.put("theaterScreen", getScreenInfo.get(j).getTheaterscreen());
               map2.put("date", date);

               list3 = theatersDAO.getScheduleInfo(map2);

               for(int z=0;z<list3.size();z++) {
                  getScheduleInfo.add(list3.get(z));
               }
            }

            
            //other value information
            request.setAttribute("regionInfo", regionInfo); //TheatersDTO
            request.setAttribute("chooseBranch", chooseBranch);    //TheatersDTO
            request.setAttribute("getBranchMovie", getBranchMovieDistinct);   
            request.setAttribute("getScreenInfo", getScreenInfo);   
            request.setAttribute("getScheduleInfo", getScheduleInfo);
            request.setAttribute("getMovieInfo", getMovieInfo);
            request.setAttribute("getDateInfo", getDateInfo);

            mav.addObject ("display","/WEB-INF/theaters/theaters.jsp");
            mav.setViewName("/WEB-INF/main/index");

            return mav;
         /*}*/
         //------------when user clicked specific branch------------------------------------------    
      }else {

         List<TheatersDTO> regionInfo =  theatersDAO.getTheatersInfo(regioncode); 

         String newSeq = String.valueOf(seq);
         List<TheatersDTO> chooseBranch = theatersDAO.chooseBranch(newSeq);

         String branch = chooseBranch.get(0).getBranch();


         //지점의 영화 상영 날짜 정보 출력
         List<TimeScheduleDTO> getDateInfo = theatersDAO.getDateInfo(branch);


         if(getDateInfo.size()==0) {
            request.setAttribute("regionInfo", regionInfo); //TheatersDTO
            request.setAttribute("chooseBranch", chooseBranch);    //TheatersDTO

            mav.addObject ("display","/WEB-INF/theaters/theaters.jsp");
            mav.setViewName("/WEB-INF/main/index");

            return mav;

         }else {

            String date =  getDateInfo.get(0).getMonth()+"-"+getDateInfo.get(0).getDay();

            Map<String, String> mapForMovieInfo = new HashMap<String, String>();
            mapForMovieInfo.put("branch", branch);
            mapForMovieInfo.put("date", date);

            List<TimeScheduleDTO> getBranchMovieDistinct = theatersDAO.getBranchMovieDistinct(mapForMovieInfo);

            //영화 정보 출력
            List<MovieplatformDTO> getMovieInfo = new ArrayList<MovieplatformDTO>();
            List<MovieplatformDTO> list2 = new ArrayList<>();

            for(int i = 0; i <getBranchMovieDistinct.size(); i++) { 
               list2 = theatersDAO.getMovieInfo(getBranchMovieDistinct.get(i).getPlayingmovie());

               for(int j = 0; j <list2.size(); j++) { 
                  getMovieInfo.add(list2.get(j));
               }
            }

            //영화네임 출력
            HashMap<String, String> map = new HashMap<String, String>();
            List<TimeScheduleDTO> getScreenInfo = new ArrayList<TimeScheduleDTO>();
            List<TimeScheduleDTO> list = new ArrayList<>();

            //영화에 해당하는 관 출력
            for(int i=0;i<getBranchMovieDistinct.size();i++) {      
               map.put("theaterBranch", branch);
               map.put("playingMovie", getBranchMovieDistinct.get(i).getPlayingmovie()); 
               map.put("date", date);

               list = theatersDAO.getScreenInfo(map); 

               for(int j = 0; j <list.size(); j++) { 
                  getScreenInfo.add(list.get(j));
               }
            }

            //-------------------------------------------------------------

            //스케쥴 출력
            HashMap<String, String> map2 = new HashMap<String, String>();
            List<TimeScheduleDTO> getScheduleInfo = new ArrayList<TimeScheduleDTO>();
            List<TimeScheduleDTO> list3 = new ArrayList<>();

            for(int j=0;j<getScreenInfo.size();j++) {
               map2.put("theaterBranch", branch);
               map2.put("playingMovie", getScreenInfo.get(j).getPlayingmovie());
               map2.put("theaterScreen", getScreenInfo.get(j).getTheaterscreen());
               map2.put("date", date);

               list3 = theatersDAO.getScheduleInfo(map2);

               for(int z=0;z<list3.size();z++) {
                  getScheduleInfo.add(list3.get(z));
               }
            }

            //Day information 
            /*request.setAttribute("month", month);
         request.setAttribute("Day", day);*/

            //other value information
            request.setAttribute("regionInfo", regionInfo); //TheatersDTO
            request.setAttribute("chooseBranch", chooseBranch);    //TheatersDTO
            request.setAttribute("getBranchMovie", getBranchMovieDistinct);   
            request.setAttribute("getScreenInfo", getScreenInfo);   
            request.setAttribute("getScheduleInfo", getScheduleInfo);
            request.setAttribute("getMovieInfo", getMovieInfo);
            request.setAttribute("getDateInfo", getDateInfo);

            mav.addObject ("display","/WEB-INF/theaters/theaters.jsp");
            mav.setViewName("/WEB-INF/main/index");

            return mav;
         }
      }
   }


   //when user clicked specific region(ajax)
   @RequestMapping(value="/findBranch.do", method=RequestMethod.POST)  
   public ModelAndView findBranch(HttpServletRequest request, @RequestParam(value="region") String region) {

      ModelAndView mav = new ModelAndView();
      List<TheatersDTO> arr = theatersDAO.getBranchList(region);

      mav.addObject("regionInfo", arr);
      request.setAttribute("regionInfo", arr);
      mav.setViewName("jsonView");

      return mav;
   }
   
   @RequestMapping(value="/getschedulebydate.do", method=RequestMethod.POST)  
   public ModelAndView getschedulebydate(@RequestParam Map<String, String> map) {

      ModelAndView mav = new ModelAndView();
   
      String branch = map.get("branch");
      String date = map.get("month")+"-"+map.get("day");
      map.put("date", date);
      
      Map<String, String> mapForMovieInfo = new HashMap<String, String>();
      mapForMovieInfo.put("branch", branch);
      mapForMovieInfo.put("date", date);
      
      List<TimeScheduleDTO> getBranchMovieDistinct = theatersDAO.getBranchMovieDistinct(map);

      
      //영화 정보 출력
      List<MovieplatformDTO> getMovieInfo = new ArrayList<MovieplatformDTO>();
      List<MovieplatformDTO> list2 = new ArrayList<>();

      for(int i = 0; i <getBranchMovieDistinct.size(); i++) { 
         list2 = theatersDAO.getMovieInfo(getBranchMovieDistinct.get(i).getPlayingmovie());

         for(int j = 0; j <list2.size(); j++) { 
            getMovieInfo.add(list2.get(j));
         }
      }
      
      HashMap<String, String> map02 = new HashMap<String, String>();
      List<TimeScheduleDTO> getScreenInfo = new ArrayList<TimeScheduleDTO>();
      List<TimeScheduleDTO> list = new ArrayList<>();

      //영화에 해당하는 관 출력
      for(int i=0;i<getBranchMovieDistinct.size();i++) {      
         map02.put("theaterBranch", branch);
         map02.put("playingMovie", getBranchMovieDistinct.get(i).getPlayingmovie()); 
         map02.put("date", date);

         list = theatersDAO.getScreenInfo(map02); 

         for(int j = 0; j <list.size(); j++) { 
            getScreenInfo.add(list.get(j));
         }
      }
      
      //스케쥴 출력
      HashMap<String, String> map03 = new HashMap<String, String>();
      List<TimeScheduleDTO> getScheduleInfo = new ArrayList<TimeScheduleDTO>();
      List<TimeScheduleDTO> list3 = new ArrayList<>();

      for(int j=0;j<getScreenInfo.size();j++) {
         map03.put("theaterBranch", branch);
         map03.put("playingMovie", getScreenInfo.get(j).getPlayingmovie());
         map03.put("theaterScreen", getScreenInfo.get(j).getTheaterscreen());
         map03.put("date", date);

         list3 = theatersDAO.getScheduleInfo(map03);

         for(int z=0;z<list3.size();z++) {
            getScheduleInfo.add(list3.get(z));
         }
      }
      
      mav.addObject("getBranchMovieDistinct", getBranchMovieDistinct);
      mav.addObject("getScreenInfo", getScreenInfo);
      mav.addObject("getMovieInfo", getMovieInfo);
      mav.addObject("getScheduleInfo", getScheduleInfo);
      mav.setViewName("jsonView");

      return mav;
   }

}