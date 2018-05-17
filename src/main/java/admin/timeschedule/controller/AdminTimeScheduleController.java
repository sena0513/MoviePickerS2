package admin.timeschedule.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import admin.movie.dao.MovieplatformDAO;
import admin.timeschedule.bean.AdminTimeScheduleDTO;
import admin.timeschedule.dao.AdminTimeScheduleDAO;
import client.movies.bean.MovieplatformDTO;

@Component
@Controller
public class AdminTimeScheduleController {
	@Autowired
	private AdminTimeScheduleDAO aservice;
	
	@Autowired
	private MovieplatformDAO mservice;
	
	@RequestMapping(value="/admintimeschedule/regionregitform.do", method=RequestMethod.GET)
	public ModelAndView regionregitform() {
		ModelAndView mav = new ModelAndView();
		List<MovieplatformDTO> list = mservice.getAllData();
		mav.addObject("list",list);
		mav.setViewName("/WEB-INF/admintimeschedule/regionregitform");
		return mav;
	}
	@RequestMapping(value="/admintimeschedule/regionlist.do", method=RequestMethod.GET)
	public ModelAndView regionlist() {
		ModelAndView mav = new ModelAndView();
		List<AdminTimeScheduleDTO> list = aservice.getalldate();
		mav.addObject("list",list);
		mav.setViewName("/WEB-INF/admintimeschedule/regionlist");
		return mav;
	}
	@RequestMapping(value = "/admintimeschedule/regionregit.do", method=RequestMethod.POST)
		public ModelAndView maincategoryregit(@RequestParam Map<String,String> map)  {
			ModelAndView mav = new ModelAndView();
			String timeDate = (map.get("theatreyear")+map.get("theatremonth")+map.get("theatreday")+map.get("theatertime"));
			map.put("theaterDate", timeDate);
			aservice.inserttimeschedulemovie(map);
			mav.setViewName("redirect:regionlist.do");
			return mav;
	}
	@RequestMapping("/admintimeschedule/fixschedule.do")
	public ModelAndView fixmaincategory(@RequestParam Map<String,String> map,@RequestParam String seq,
									HttpServletRequest request)  {
		ModelAndView mav = new ModelAndView(); 
		map.put("seq", seq);
		String theaterTime = (map.get("theaterDate")+""+map.get("theaterTime"));
		map.put("theaterTime",theaterTime);
		aservice.modifytimeschedulemovie(map);
		mav.setViewName("redirect:regionlist.do");
		return mav;
	}
	@RequestMapping("/admintimeschedule/deleteschedule.do")
	public ModelAndView deletemaincategory(@RequestParam Map<String,String> map)  {
		ModelAndView mav = new ModelAndView();
		aservice.deletetimeschedulemovie(map);
		mav.setViewName("redirect:regionlist.do");
		return mav;
	}
}
