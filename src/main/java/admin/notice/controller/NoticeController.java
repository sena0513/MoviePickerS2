package admin.notice.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import admin.notice.bean.AdminNoticeBoardPaging;
import admin.notice.bean.AdminNoticeBoardDTO;
import admin.notice.dao.AdminNoticeBoardDAO;

@Component
@Controller
public class NoticeController {
	@Autowired
	private AdminNoticeBoardDAO nservice;

	@Autowired
	private AdminNoticeBoardPaging noticePaging;
	
	@RequestMapping(value = "/adminnotice/noticeregitform.do")
	public ModelAndView movieregit()  {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/WEB-INF/adminnotice/noticeregitform");
		return mav;
	}
	
	@RequestMapping(value = "/adminnotice/noticeregit.do", method=RequestMethod.POST)
	public ModelAndView movieregit(@RequestParam Map<String,String> map)  {
		ModelAndView mav = new ModelAndView(); 
		nservice.InsertNotice(map);
		mav.setViewName("redirect:noticelistform.do");
		return mav;
	}
	@RequestMapping(value="/adminnotice/noticelistform.do", method=RequestMethod.GET)
	public String boardList(@RequestParam(required=false) String pg, Model model,String searchtext, String searchfield) {   // 데이터 값이 안 들어올 경우도 있기 때문에 required=false로 설정해야함
		if(pg==null) pg= "1"; // pg = 현재 페이지
		if(searchfield==null) searchfield = "title";
	    if(searchtext==null) searchtext = "";
		
		int endNum = Integer.parseInt(pg)*10; // 한 폐이지당 5개 뿌리고 싶을 때
		int startNum = endNum-9;
		// DB 
		// 1폐이지당 글 5개
		List<AdminNoticeBoardDTO> list = nservice.getNoticeBoardList(startNum, endNum, searchtext, searchfield);
		
		// 페이징 처리
		int totalA = nservice.getNoticeTotalA(searchtext, searchfield); // 총 글수
		noticePaging.setCurrentPage(Integer.parseInt(pg));
		noticePaging.setPageBlock(3);
		noticePaging.setPageSize(5);
		noticePaging.setTotalA(totalA);
		noticePaging.makePagingHTML(searchtext, searchfield);

		// 응답
		model.addAttribute("pg", pg);
		model.addAttribute("list", list);
		model.addAttribute("noticePaging", noticePaging);
		return "/WEB-INF/adminnotice/noticelist";
	}
	@RequestMapping(value = "/adminnotice/noticeinfoform.do")
	public ModelAndView noticeintoform(@RequestParam int seq,@RequestParam(required=false) String pg){
		ModelAndView mav = new ModelAndView();
		AdminNoticeBoardDTO list = nservice.NoticeBoardView(seq);
		mav.addObject("list",list);
		mav.addObject("pg", pg);
		mav.setViewName("/WEB-INF/adminnotice/noticeinfoform");
		return mav;
	}
	@RequestMapping(value = "/adminnotice/modifynotice.do", method=RequestMethod.POST)
	public ModelAndView modifynotice(@RequestParam Map<String,String> map,@RequestParam(required=false) String pg)  {
		ModelAndView mav = new ModelAndView(); 
		nservice.ModifyNotice(map);
		mav.addObject("pg", pg);
		mav.setViewName("redirect:noticelistform.do");
		return mav;
	}
	@RequestMapping(value = "/adminnotice/deletenotice.do", method=RequestMethod.GET)
	public ModelAndView deletenoitce(@RequestParam int seq,@RequestParam(required=false) String pg)  {
		ModelAndView mav = new ModelAndView(); 
		nservice.DeleteNotice(seq);
		mav.addObject("pg", pg);
		mav.setViewName("redirect:noticelistform.do");
		return mav;
	}
}
