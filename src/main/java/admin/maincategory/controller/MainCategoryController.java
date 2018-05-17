package admin.maincategory.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import admin.maincategory.bean.MainCategoryDTO;
import admin.maincategory.dao.MainCategoryDAO;
import javafx.scene.control.Alert;

@Component
@Controller
public class MainCategoryController {
	@Autowired
	private MainCategoryDAO cservice;
	
	@RequestMapping(value = "/adminmoviecategory/maincategoryregitform.do")
	public ModelAndView maincategoryregitform()  {
		ModelAndView mav = new ModelAndView();
		List<MainCategoryDTO> list = cservice.getMovieList();
		if(list.size()>0) {
			String result="항목이 존재합니다 삭제후 다시 등록하시길 바랍니다.";
			mav.addObject("result",result);
		}
		mav.setViewName("/WEB-INF/adminmoviecategory/maincategoryregitform");
		return mav;
	}
	
	@RequestMapping(value = "/adminmoviecategory/maincategoryregit.do", method=RequestMethod.POST)
	public ModelAndView maincategoryregit(@RequestParam Map<String,String> map)  {
		ModelAndView mav = new ModelAndView(); 
		List<MainCategoryDTO> list = cservice.getMovieList();
		if(list.size()>0) {
			mav.setViewName("redirect:maincategorylist.do");
			return mav;
		}
		cservice.InsertCategory(map);
		mav.setViewName("redirect:maincategorylist.do");
		return mav;
	}
	@RequestMapping(value="/adminmoviecategory/maincategorylist.do", method=RequestMethod.GET)
	public String maincategorylist(Model model) {   // 데이터 값이 안 들어올 경우도 있기 때문에 required=false로 설정해야함
		List<MainCategoryDTO> list = cservice.getMovieList();
		model.addAttribute("list", list);
		return "/WEB-INF/adminmoviecategory/maincategorylist";
	}
	
	@RequestMapping("/adminmoviecategory/fixmaincategory.do")
	public ModelAndView fixmaincategory(@RequestParam Map<String,String> map,@RequestParam String seq,
									HttpServletRequest request)  {
		ModelAndView mav = new ModelAndView(); 
		map.put("seq", seq);
		cservice.modifymaincategory(map);
		mav.setViewName("redirect:maincategorylist.do");
		return mav;
	}
	
	@RequestMapping("/adminmoviecategory/deletemaincategory.do")
	public ModelAndView deletemaincategory(@RequestParam String number)  {
		ModelAndView mav = new ModelAndView();
		cservice.deletemaincategory(number);
		mav.setViewName("redirect:adminmovielist.do");
		return mav;
	}
}
