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

import kr.or.kobis.kobisopenapi.consumer.rest.KobisOpenAPIRestService;
import kr.or.kobis.kobisopenapi.consumer.rest.exception.OpenAPIFault;
import client.member.dao.MemberDAO;
import client.movieChart.dao.MovieChartDAO;
import client.moviepoint.dao.MoviePointDAO;
import client.movies.bean.MoviePointDTO;
import client.movies.bean.MovieplatformDTO;
import client.wishList.bean.WishlistDTO;


@RequestMapping("movieChart")
@Component
public class MovieChartController {

	@Autowired
	private MovieChartDAO movieChartDAO;
	@Autowired
	private MoviePointDAO moviePointDAO;
	@Autowired
	private MemberDAO memberDAO;

	@RequestMapping(value="/movieChart.do", method=RequestMethod.GET)
	public ModelAndView Chart(HttpServletRequest request, HttpSession session) {

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

		HashMap<String, String> BoxOfficeMap = new HashMap<>();
		//ArrayList<BoxOfficeInit> box = new ArrayList<>();
		List<String> box = new ArrayList<>();
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
				//box.add(new BoxOfficeInit(movieNm));
				BoxOfficeMap.put("movienameforkr"+(i+1), movieNm2);
				box.add(movieNm2);

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
		// 평점 하트 끌어오기
		MoviePointDTO result;
		 ArrayList<MoviePointDTO> arrMoviePointDTO = new ArrayList<>();
		 for(int i=1; i<8; i++) {
	         
	         result = moviePointDAO.getMoviePoint(BoxOfficeMap.get("movienameforkr"+i));

	         arrMoviePointDTO.add(result);       
	      }
		 
		List<MovieplatformDTO> movieArr = movieChartDAO.getAgelim(BoxOfficeMap);

		request.setAttribute("boxOfficeMap", BoxOfficeMap);
		request.setAttribute("movieplatformDTO", movieArr);
		request.setAttribute("codeResult",codeResult);
		
		mav.addObject("arrMoviePointDTO", arrMoviePointDTO);
		mav.addObject ("display","/WEB-INF/movies/movieChart.jsp");
		mav.setViewName("/WEB-INF/main/index");
		return mav;
	}

	@RequestMapping(value="/wishInsert.do", method=RequestMethod.POST)
	public ModelAndView wishInsert(HttpServletRequest request, HttpSession session, @RequestParam String movienameforkr) {
		ModelAndView mav = new ModelAndView();
		String id = (String)session.getAttribute("loginId");
		Map<String,String> map = new HashMap<String,String>();
		List<WishlistDTO> wishlistDTO = new ArrayList<WishlistDTO>();
		map.put("id", id);
		map.put("movienameforkr", movienameforkr);

		memberDAO.InsertWishList(map);
		moviePointDAO.plusHeartToMovienameforkr(map);

		wishlistDTO = memberDAO.getWishlist(id);

		mav.addObject("wishlistDTO", wishlistDTO);
		mav.setViewName("jsonView");
		return mav;
	}

	@RequestMapping(value="/wishDelete.do", method=RequestMethod.POST)
	public ModelAndView wishDelete(HttpServletRequest request, HttpSession session, @RequestParam String movienameforkr) {
		ModelAndView mav = new ModelAndView();
		String id = (String)session.getAttribute("loginId");
		Map<String,String> map = new HashMap<String,String>();
		List<WishlistDTO> wishlistDTO = new ArrayList<WishlistDTO>();
		map.put("id", id);
		map.put("movienameforkr", movienameforkr);



		memberDAO.deleteWishList(map);
		moviePointDAO.minusHeartToMovienameforkr(map);


		wishlistDTO = memberDAO.getWishlist(id);
		if(wishlistDTO != null) {
			mav.addObject("wishlistDTO", wishlistDTO);
		}
		mav.setViewName("jsonView");
		return mav;
	}


}