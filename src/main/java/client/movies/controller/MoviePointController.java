package client.movies.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.codehaus.jackson.JsonParseException;
import org.codehaus.jackson.map.JsonMappingException;
import org.codehaus.jackson.map.ObjectMapper;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import client.movieChart.dao.MovieChartDAO;
import client.movieDetail.dao.MovieDetailDAO;
import client.moviepoint.dao.MoviePointDAO;
import client.movies.bean.MoviePointDTO;
import client.movies.bean.MovieplatformDTO;
import client.movies.bean.MyReviewPaging;
import client.movies.bean.ReviewPaging;
import client.review.bean.ReviewDTO;
import client.usagehistory.bean.UsagehistoryDTO;
import client.usagehistory.dao.UsagehistoryDAO;
import kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService;
import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;


@RequestMapping("/moviePoint")
@Component
public class MoviePointController{

   @Autowired
   private MoviePointDAO moviePointDAO;
   
   @Autowired
   private MovieChartDAO movieChartDAO;
   
   @Autowired
   private MovieDetailDAO movieDetailDAO;
   
   @Autowired
   private ReviewPaging reviewPaging;
   
   @Autowired
   private MyReviewPaging myreviewPaging;
   
   @Autowired
   private UsagehistoryDAO usagehistroyDAO;

   @RequestMapping(value="/moviePoint.do", method=RequestMethod.GET)
   public ModelAndView moviepoint(HttpServletRequest request, @RequestParam(required=false) String mv_seq) {

      ModelAndView mav = new ModelAndView();

      Calendar c1 = new GregorianCalendar();
      c1.add(Calendar.DATE, -1); // 오늘날짜로부터 -1
      SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd"); // 날짜 포맷 
      String date = sdf.format(c1.getTime()); // String으로 저장   

      // 파라메터 설정
      String targetDt = request.getParameter("targetDt")==null?date:request.getParameter("targetDt");         //조회일자
      String itemPerPage = request.getParameter("itemPerPage")==null?"10":request.getParameter("itemPerPage");      //결과row수
      String multiMovieYn = request.getParameter("multiMovieYn")==null?"":request.getParameter("multiMovieYn");     //“Y” : 다양성 영화 “N” : 상업영화 (default : 전체)
      String repNationCd = request.getParameter("repNationCd")==null?"":request.getParameter("repNationCd");        //“K: : 한국영화 “F” : 외국영화 (default : 전체)
      String wideAreaCd = request.getParameter("wideAreaCd")==null?"":request.getParameter("wideAreaCd");           //“0105000000” 로서 조회된 지역코드

      // 발급키
      String key = "03502e5952b22549d2eb8ff76c8e24c3";
      // KOBIS 오픈 API Rest Client를 통해 호출
      KobisOpenAPIRestService service = new KobisOpenAPIRestService(key);


      // 일일 박스오피스 서비스 호출 (boolean isJson, String targetDt, String itemPerPage,String multiMovieYn, String repNationCd, String wideAreaCd)
      String dailyResponse = null;
      try {
         dailyResponse = service.getDailyBoxOffice(true,targetDt,itemPerPage,multiMovieYn,repNationCd,wideAreaCd);
      } catch (OpenAPIFault e) {
         e.printStackTrace();
      } catch (Exception e) {
         e.printStackTrace();
      }

      HashMap<String, String> BoxOfficeMap = new HashMap<>();
      //ArrayList<BoxOfficeInit> box = new ArrayList<>();
      JSONParser jsonparser = new JSONParser();
      try {
         JSONObject jsonobject = (JSONObject)jsonparser.parse(service.getDailyBoxOffice(true,targetDt,itemPerPage,multiMovieYn,repNationCd,wideAreaCd));
         JSONObject json =  (JSONObject) jsonobject.get("boxOfficeResult");
         JSONArray array = (JSONArray)json.get("dailyBoxOfficeList");
         for(int i = 0 ; i < array.size(); i++){
            JSONObject entity = (JSONObject)array.get(i);
            String movieNm = entity.get("movieNm").toString();
            String movieNm2 = movieNm.replaceAll(":", "");
            String rank = entity.get("rank").toString();
            int audiCnt = Integer.parseInt(entity.get("audiCnt").toString());
            
            BoxOfficeMap.put("movienameforkr"+(i+1), movieNm2);
            
         }
      }catch(Exception e) {
         e.printStackTrace();
      }

      // Json 라이브러리를 통해 Handling
      ObjectMapper mapper = new ObjectMapper();
      HashMap<String, Object> dailyResult = null;
      try {
         dailyResult = mapper.readValue(dailyResponse, HashMap.class);
      } catch (JsonParseException e) {
         e.printStackTrace();
      } catch (JsonMappingException e) {
         e.printStackTrace();
      } catch (IOException e) {
         e.printStackTrace();
      }


      request.setAttribute("dailyResult",dailyResult);


      // KOBIS 오픈 API Rest Client를 통해 코드 서비스 호출 (boolean isJson, String comCode )
      String codeResponse = null;      
      try {
         codeResponse = service.getComCodeList(true,"0105000000");
      } catch (OpenAPIFault e) {
         e.printStackTrace();
      } catch (Exception e) {
         e.printStackTrace();
      }
      HashMap<String, Object> codeResult = null;
      try {
         codeResult = mapper.readValue(codeResponse, HashMap.class);
      } catch (JsonParseException e) {
         e.printStackTrace();
      } catch (JsonMappingException e) {
         e.printStackTrace();
      } catch (IOException e) {
         e.printStackTrace();
      }

      MoviePointDTO moviePointDTO;
      MovieplatformDTO movieplatformDTO;


      ArrayList<MoviePointDTO> arrMoviePointDTO = new ArrayList<>();
      ArrayList<MovieplatformDTO> arrMovieplatformDTO = new ArrayList<>();
      for(int i=1; i<9; i++) {
         
         moviePointDTO = moviePointDAO.getMoviePoint(BoxOfficeMap.get("movienameforkr"+i));
         movieplatformDTO = movieDetailDAO.getMovieInfo(BoxOfficeMap.get("movienameforkr"+i));
         
         arrMovieplatformDTO.add(movieplatformDTO);
         arrMoviePointDTO.add(moviePointDTO);       
      }


      if(mv_seq==null)  {
         moviePointDTO = moviePointDAO.getMoviePoint(BoxOfficeMap.get("movienameforkr1"));
         mv_seq =  String.valueOf(moviePointDTO.getSeq());

      }
      else {
         moviePointDTO = moviePointDAO.getMoviePoint(Integer.parseInt(mv_seq));

      }



      //응답
      //         model.addAttribute("pg", pg);
      //         model.addAttribute("list", list);
      //         model.addAttribute("boardPaging",boardPaging);
      //         model.addAttribute("display","/board/boardList.jsp");
      //         return "/main/index";





      //         List<String> arr = movieChartDAO.getAgelim(BoxOfficeMap);
      //         System.out.println(arr.get(0)+arr.get(1));

      /*request.setAttribute("BoxOfficeMap",arr);*/
      
      
      
      List<MovieplatformDTO> movieArr = movieChartDAO.getAgelim(BoxOfficeMap);
      
      request.setAttribute("BoxOfficeMap", BoxOfficeMap);
      request.setAttribute("MovieplatformDTO", movieArr);
      request.setAttribute("codeResult",codeResult);
      
      mav.addObject("moviePoint", arrMoviePointDTO);
      mav.addObject("moviePointDTO", moviePointDTO);
      mav.addObject("mv_seq", mv_seq);
      mav.addObject("arrMovieplatformDTO",arrMovieplatformDTO);
      mav.addObject("Movienameforkr", moviePointDTO.getMovienameforkr());
      
      
      
      mav.addObject("display", "/WEB-INF/movies/moviePoint.jsp");
      mav.setViewName("/WEB-INF/main/index");
      return mav;
   }

   @RequestMapping(value="/reviewpaging.do", method=RequestMethod.POST)
   public ModelAndView reviewPaging(HttpServletRequest request, @RequestParam(required=false) String mv_seq, @RequestParam(required=false) String page,HttpSession session) {
	
	   
      ModelAndView mav = new ModelAndView();
      //DB
      //1 페이지당 10 개씩
      int endNum = Integer.parseInt(page)*10;
      int startNum = endNum-9;
      //페이징 처리 필요
      List<ReviewDTO> list = moviePointDAO.getReviewList(mv_seq,startNum,endNum);
      
      //페이징처리
      int totalA = moviePointDAO.getTotalReviewFromMv_seq(mv_seq);


  
      reviewPaging.setCurrentPage(Integer.parseInt(page));
      reviewPaging.setPageBlock(10);
      reviewPaging.setPageSize(10);
      reviewPaging.setTotalA(totalA);
      reviewPaging.setMv_seq(mv_seq);

      reviewPaging.setTotalP((totalA+reviewPaging.getPageSize()-1)/reviewPaging.getPageSize());// 총 페이지 수 
      int startPage = (reviewPaging.getCurrentPage()-1)/reviewPaging.getPageBlock()*reviewPaging.getPageBlock()+1;
      reviewPaging.setStartPage(startPage);
      int endPage = startPage+reviewPaging.getPageBlock()-1;   
      if(endPage > reviewPaging.getTotalP()) endPage = reviewPaging.getTotalP();// 총글수
      reviewPaging.setEndPage(endPage);
      mav.addObject("reviewPaging", reviewPaging);
      mav.addObject("page", page); 
      mav.addObject("list", list);
      String id = (String)session.getAttribute("loginId");
      mav.addObject("loginId",id);
      mav.setViewName("jsonView");
      return mav;
   }
   @RequestMapping(value="/reviewcheck.do", method=RequestMethod.GET)
   public ModelAndView reviewcheck(HttpServletRequest request, @RequestParam(required=false) String mv_seq, @RequestParam(required=false) String page
         ,@RequestParam(required=false) String Movienameforkr,HttpSession session,
         @RequestParam Map<String,String>map) {
      ModelAndView mav = new ModelAndView();
      String id = (String)session.getAttribute("loginId");
      map.put("id", id);
      map.put("movienameforkr", Movienameforkr);
      List<ReviewDTO> reviewcheck = moviePointDAO.reviewcheck(map);
      if(reviewcheck.size() > 0) {
    	 
    	  mav.addObject("reviewcheck",reviewcheck);
    	  mav.addObject("Movienameforkr", Movienameforkr);
    	  mav.addObject("mv_seq",mv_seq);
    	  mav.addObject("page", page);
    	  mav.setViewName("jsonView");
      }else {
    	  
    	  mav.addObject("reviewcheck",reviewcheck);
    	  mav.setViewName("jsonView");
      }
      return mav;
   }
   @RequestMapping(value="/movieWriteGrade.do", method=RequestMethod.GET)
   public ModelAndView movieWriteGrade(HttpServletRequest request, @RequestParam(required=false) String mv_seq, @RequestParam(required=false) String page
         ,@RequestParam(required=false) String Movienameforkr,HttpSession session,
         @RequestParam Map<String,String>map) {
      ModelAndView mav = new ModelAndView();
      String id = (String)session.getAttribute("loginId");
      map.put("id", id);
      map.put("movieName", Movienameforkr);
      List<UsagehistoryDTO> moviecheck = usagehistroyDAO.getmoviehistory(map);
      if(moviecheck.size() > 0) {
    	 
    	  mav.addObject("moviecheck",moviecheck);
    	  mav.addObject("Movienameforkr", Movienameforkr);
    	  mav.addObject("mv_seq",mv_seq);
    	  mav.addObject("page", page);
    	  mav.setViewName("jsonView");
      }else {
    	  mav.addObject("moviecheck",moviecheck);
    	  mav.setViewName("jsonView");
      }
      return mav;
   }
   @RequestMapping(value="/modifyreview.do", method=RequestMethod.POST)
   public ModelAndView modifyreview(HttpServletRequest request, @RequestParam(required=false) String mv_seq, @RequestParam(required=false) String page
         ,@RequestParam(required=false) String Movienameforkr,@RequestParam Map<String,String>map,HttpSession session) {
      ModelAndView mav = new ModelAndView();
      String id = (String)session.getAttribute("loginId");
      map.put("id", id);
      map.put("mv_seq", mv_seq);
      map.put("movienameforkr", Movienameforkr);
      List<ReviewDTO> reviewcheck = moviePointDAO.reviewcheck(map);
      mav.addObject("reviewcontents",reviewcheck.get(0).getReviewcontents());
	  mav.addObject("Movienameforkr", Movienameforkr);
	  mav.addObject("mv_seq",mv_seq);
	  mav.addObject("page", page);	
	  mav.setViewName("/WEB-INF/movies/modifyreview");
      return mav;
   }
   
   @RequestMapping(value="/movieWriteGrade2.do", method=RequestMethod.POST)
   public ModelAndView movieWriteGrade2(HttpServletRequest request, @RequestParam(required=false) String mv_seq, @RequestParam(required=false) String page
         ,@RequestParam(required=false) String Movienameforkr) {
      ModelAndView mav = new ModelAndView();
	  mav.addObject("Movienameforkr", Movienameforkr);
	  mav.addObject("mv_seq",mv_seq);
	  mav.addObject("page", page);	
	  mav.setViewName("/WEB-INF/movies/movieWriteGrade");
      
      return mav;
   }
   
   @RequestMapping(value="/reviewStep1.do", method=RequestMethod.GET)
   public ModelAndView reviewStep1(HttpServletRequest request, @RequestParam(required=false) String mv_seq, @RequestParam(required=false) String page
         ,@RequestParam(required=false) String Movienameforkr) {
      ModelAndView mav = new ModelAndView();
     
      mav.addObject("Movienameforkr", Movienameforkr);
      mav.addObject("mv_seq",mv_seq);
      mav.addObject("page", page);
      mav.setViewName("/WEB-INF/movies/movieWriteGrade");
      return mav;
   }
   @RequestMapping(value="/reviewWrite.do", method=RequestMethod.GET)
   public ModelAndView reivewregit(@RequestParam Map<String,String>map,HttpSession session) {
      ModelAndView mav = new ModelAndView();
      String id = (String)session.getAttribute("loginId");
      map.put("id", id);
      int result = moviePointDAO.insertreview(map);
      mav.addObject("result",result);
      mav.setViewName("jsonView");
      return mav;
   }
   @RequestMapping(value="/modifyreviewcontents.do", method=RequestMethod.GET)
   public ModelAndView modifyreviewcontents(@RequestParam Map<String,String>map,HttpSession session) {
      ModelAndView mav = new ModelAndView();
      String id = (String)session.getAttribute("loginId");
      map.put("id", id);
      int result =moviePointDAO.modifyreviewcontents(map);
      mav.addObject("result",result);
      mav.setViewName("jsonView");
      return mav;
   }
	   @RequestMapping(value="/charmPoint.do", method=RequestMethod.GET)
   public ModelAndView charmPoint(@RequestParam(required=false) String mv_seq, @RequestParam(required=false) String page
	         ,@RequestParam(required=false) String Movienameforkr) {
      ModelAndView mav = new ModelAndView();
      mav.addObject("Movienameforkr", Movienameforkr);
      mav.addObject("mv_seq",mv_seq);
      mav.addObject("page", page);
      int charmpoint = 0;
      mav.addObject("charmpoint",charmpoint);
      mav.setViewName("/WEB-INF/movies/charmPoint");
      return mav;
   }
   @RequestMapping(value="/charmPointregit.do", method=RequestMethod.GET)
   public ModelAndView charmPointregit(@RequestParam(required=false) String mv_seq, @RequestParam(required=false) String page
	         ,@RequestParam(required=false) String movienameforkr,@RequestParam Map<String,String>map,HttpSession session) {
      ModelAndView mav = new ModelAndView();
      String id = (String)session.getAttribute("loginId");
      map.put("id", id);
      
      List<ReviewDTO> list = moviePointDAO.getReviewdata(map);
      String rev_seq = ""+list.get(0).getRev_seq();
      map.put("rev_seq", rev_seq);
      moviePointDAO.charmpointupdate(map);
      moviePointDAO.updatemoviepoint(map);
      int charmpoint = 1;
      mav.addObject("charmpoint",charmpoint);
      mav.addObject("Movienameforkr", movienameforkr);
      mav.addObject("mv_seq",mv_seq);
      mav.addObject("page", page);
      mav.setViewName("/WEB-INF/movies/charmPoint");
      return mav;
   }
   @RequestMapping(value="/removereview.do", method=RequestMethod.POST)
   public ModelAndView removereview(@RequestParam(required=false) String mv_seq, @RequestParam(required=false) String page
	         ,@RequestParam(required=false) String movienameforkr,@RequestParam Map<String,String>map,HttpSession session) {
      ModelAndView mav = new ModelAndView();
      String id = (String)session.getAttribute("loginId");
      map.put("id", id);
      map.put("movienameforkr",movienameforkr);
      map.put("mv_seq", mv_seq);
      moviePointDAO.removereview(map);
      mav.addObject("Movienameforkr", movienameforkr);
      mav.addObject("mv_seq",mv_seq);
      mav.addObject("page", page);
      mav.setViewName("redirect:/moviePoint/moviePoint.do");
      return mav;
   }
   @RequestMapping(value="/reportreview.do", method=RequestMethod.POST)
   public ModelAndView reportreview(@RequestParam(required=false) String mv_seq, @RequestParam(required=false) String page
	         ,@RequestParam(required=false) String movienameforkr,@RequestParam Map<String,String>map,HttpSession session) {
      ModelAndView mav = new ModelAndView();
      moviePointDAO.reportreview(map);
      mav.addObject("Movienameforkr", movienameforkr);
      mav.addObject("mv_seq",mv_seq);
      mav.addObject("page", page);
      mav.setViewName("redirect:/moviePoint/moviePoint.do");
      return mav;
   }
   @RequestMapping(value="/myreview.do", method=RequestMethod.GET)
   public ModelAndView reportreview(HttpSession session,Map<String,String>map,@RequestParam(required=false) String pg) {
      ModelAndView mav = new ModelAndView();
      if(pg==null) pg="1";

      // 1페이지당 5개씩
      int endNum = Integer.parseInt(pg)*10;
      int startNum = endNum-9;
      String id = (String)session.getAttribute("loginId");
      //DB
      List<ReviewDTO> list = moviePointDAO.myreview(endNum,startNum,id);
      // 페이징 처리
      int myreviewTotalA = moviePointDAO.getmyreviewTotalA(id);
      myreviewPaging.setCurrentPage(Integer.parseInt(pg));
      myreviewPaging.setPageBlock(3);
      myreviewPaging.setPageSize(5);
      myreviewPaging.setTotalA(myreviewTotalA);
      myreviewPaging.makePagingHTML();

      mav.addObject("pg", pg);
      mav.addObject("myreviewTotalA", myreviewTotalA);
      mav.addObject("myreviewPaging", myreviewPaging);
      mav.addObject("list",list);
      mav.addObject("display", "/WEB-INF/movies/myreview.jsp");
      mav.setViewName("/WEB-INF/main/index");
      return mav;
   }
   @RequestMapping(value="/deletemyreview.do", method=RequestMethod.POST)
   public ModelAndView removereview(@RequestParam(required=false) int rev_seq) {
      ModelAndView mav = new ModelAndView();
      moviePointDAO.deletemyreview(rev_seq);
      mav.setViewName("redirect:/moviePoint/myreview.do");
      return mav;
   }
   

}