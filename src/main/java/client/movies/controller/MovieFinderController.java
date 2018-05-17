package client.movies.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;

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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import client.member.dao.MemberDAO;
import client.movieChart.dao.MovieChartDAO;
import client.moviefinder.dao.MovieFinderDAO;
import client.moviepoint.dao.MoviePointDAO;
import client.movies.bean.MovieFinderPaging;
import client.movies.bean.MoviePointDTO;
import client.movies.bean.MovieplatformDTO;
import client.wishList.bean.WishlistDTO;
import kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService;
import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;

@RequestMapping("/movieFinder")
@Component
public class MovieFinderController {

	@Autowired
	private MovieFinderDAO movieFinderDAO;

	@Autowired
	private MovieFinderPaging movieFinderPaging;
	
	@Autowired
	private MoviePointDAO moviePointDAO;
	
	@Autowired
	private MemberDAO memberDAO;
	@Autowired
	private MovieChartDAO movieChartDAO;

	@RequestMapping(value="/movieFinderIndex.do", method=RequestMethod.GET)
	public ModelAndView movieFinderIndex(HttpServletRequest request, HttpSession session) {

		ModelAndView mav = new ModelAndView();

		Calendar c1 = new GregorianCalendar();
		c1.add(Calendar.DATE, -1); // 오늘날짜로부터 -1
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd"); // 날짜 포맷 
		String date = sdf.format(c1.getTime()); // String으로 저장   

		// 파라메터 설정
		String targetDt = request.getParameter("targetDt")==null?date:request.getParameter("targetDt");              //조회일자
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

		HashMap<String, String> BoxOfficeMap = new HashMap();

		JSONParser jsonparser = new JSONParser();
		try {
			JSONObject jsonobject = (JSONObject)jsonparser.parse(service.getDailyBoxOffice(true,targetDt,itemPerPage,multiMovieYn,repNationCd,wideAreaCd));
			JSONObject json =  (JSONObject) jsonobject.get("boxOfficeResult");
			JSONArray array = (JSONArray)json.get("dailyBoxOfficeList");
			for(int i = 0 ; i < array.size(); i++){
				JSONObject entity = (JSONObject)array.get(i);
				String movieNm = entity.get("movieNm").toString();
				String rank = entity.get("rank").toString();
				int audiCnt = Integer.parseInt(entity.get("audiCnt").toString());
				
				//box.add(new BoxOfficeInit(movieNm));
				BoxOfficeMap.put("movienameforkr"+(i+1), movieNm);
				
				//box.add(movieNm);
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
		
		// 로그인에 따른 wishList 출력
				String id;
				List<WishlistDTO> wishlistDTO = new ArrayList<WishlistDTO>();
				if((String)session.getAttribute("loginId") != null) {
					id = (String)session.getAttribute("loginId");
					wishlistDTO = memberDAO.getWishlist(id);
					if(wishlistDTO.size() >0) {
						mav.addObject("wishlistDTO", wishlistDTO);
					}
				}

				List<MovieplatformDTO> movieplatformDTO = movieChartDAO.getAgelim(BoxOfficeMap);

				request.setAttribute("boxOfficeMap", BoxOfficeMap);
				request.setAttribute("movieplatformDTO", movieplatformDTO);
		
		List<MovieplatformDTO> movieArr = movieFinderDAO.getAgelim(BoxOfficeMap);
		
		//하트 끌어오기
	      MoviePointDTO result;
	      ArrayList<MoviePointDTO> arrMoviePointDTO = new ArrayList<>();

	      for(int i=0; i<movieplatformDTO.size(); i++) {
	         result = moviePointDAO.getMoviePoint(movieplatformDTO.get(i).getMovienameforkr());
	         arrMoviePointDTO.add(result);

	      }
		
		
		request.setAttribute("MovieplatformDTO", movieArr);
		request.setAttribute("codeResult",codeResult);
		request.setAttribute("getHeartInfoForMoviefinder", arrMoviePointDTO);
		mav.addObject("display", "/WEB-INF/movies/movieFinder.jsp");
		mav.setViewName("/WEB-INF/main/index");

		return mav;
	}


	@RequestMapping(value="/movieFinderResult.do", method=RequestMethod.GET)
	public ModelAndView movieFinderResult(@RequestParam(required=false) String pg, Model model, HttpServletRequest request,
			@RequestParam(required=false) String searchtext, @RequestParam(required=false) String searchfield,
			@RequestParam(required=false) String year_start, @RequestParam(required=false) String year_end,
			@RequestParam(required=false) String genre, @RequestParam(required=false) String nation,
			@RequestParam(required=false) String ageLimit) throws Exception {
		ModelAndView mav = new ModelAndView();
		if(pg==null) pg="1";
		if(searchfield==null) searchfield = "movienameforkr";
		if(searchtext==null) searchtext = "";
		if(genre==null) genre = "가족,공포/호러,드라마,SF,멜로/로맨스,코미디,애니메이션,느와르,다큐멘터리,미스터리,범죄,스릴러,시대극,액션,어드벤처,전쟁,재난,환타지,모험";
		if(nation==null) nation = "한국,미국,일본,중국,영국,인도";
		if(ageLimit==null) ageLimit = "all,12,15,chungbul,mijeong";
		if(year_start==null) year_start = "1960";
		if(year_end==null) year_end = "2020";
		
		

		// 1페이지당 20개씩
		int endNum = Integer.parseInt(pg)*20;
		int startNum = endNum-19;

		List<MovieplatformDTO> finderList = movieFinderDAO.getMovieList(startNum, endNum, searchtext, searchfield, genre, nation, ageLimit, year_start, year_end);

		//하트 끌어오기
	      MoviePointDTO result;
	       ArrayList<MoviePointDTO> arrMoviePointDTO = new ArrayList<>();
	          
	      for(int i=0; i<finderList.size(); i++) {
	             result = moviePointDAO.getMoviePoint(finderList.get(i).getMovienameforkr());
	             arrMoviePointDTO.add(result);
	             
	          }
		
		// 페이징 처리
		int MovieTotalA = movieFinderDAO.getMovieTotalA(searchtext, searchfield, genre, nation, ageLimit, year_start, year_end);
		movieFinderPaging.setCurrentPage(Integer.parseInt(pg));
		movieFinderPaging.setPageBlock(3);
		movieFinderPaging.setPageSize(20);
		movieFinderPaging.setTotalA(MovieTotalA);
		movieFinderPaging.makePagingHTML(startNum, endNum, searchtext, searchfield, genre, nation, ageLimit, year_start, year_end);
		
		if(searchtext == "") {
			searchtext = "검색한 키워드가 없습니다.";
		}
		
		genre = genre.replaceAll(",", ", ");
		nation = nation.replaceAll(",", ", ");
		ageLimit = ageLimit.replaceAll(",", ", ");
		ageLimit = ageLimit.replaceAll("all", "전체관람가");
		ageLimit = ageLimit.replaceAll("12", "12세관람가");
		ageLimit = ageLimit.replaceAll("15", "15세관람가");
		ageLimit = ageLimit.replaceAll("chungbul", "청소년관람불가");
		ageLimit = ageLimit.replaceAll("mijeong", "미정");
		
	      
	    mav.addObject("arrMoviePointDTO", arrMoviePointDTO);  
		mav.addObject("pg", pg);
		mav.addObject("finderList", finderList);
		mav.addObject("MovieTotalA", MovieTotalA);
		mav.addObject("searchtext", searchtext);
		mav.addObject("searchfield", searchfield);
		mav.addObject("genre", genre);
		mav.addObject("nation", nation);
		mav.addObject("ageLimit", ageLimit);
		mav.addObject("year_start", year_start);
		mav.addObject("year_end", year_end);
		mav.addObject("movieFinderPaging", movieFinderPaging);
		
		mav.addObject("display","/WEB-INF/movies/movieFinderResult.jsp");
		mav.setViewName("/WEB-INF/main/index");
	      
	    return mav;
	}
}
