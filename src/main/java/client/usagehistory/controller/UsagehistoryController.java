package client.usagehistory.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import client.usagehistory.bean.UsagehistoryDTO;
import client.usagehistory.dao.UsagehistoryDAO;

@Component
@RequestMapping("/mypage")
public class UsagehistoryController {
	@Autowired
	private UsagehistoryDAO uservice;
	
	
	@RequestMapping(value = "/pointusedhistory.do",method=RequestMethod.POST)
	public ModelAndView pointusedhistory(@RequestParam Map<String,String> map)  {
		ModelAndView mav = new ModelAndView();
		
		String enddate = (map.get("enddate")+" 23:59:59");
		
		map.put("enddate", enddate);
		List<UsagehistoryDTO> list = uservice.getusedpointhistory(map);
		mav.addObject("list",list);
		mav.setViewName("jsonView");
		return mav;
	}
	@RequestMapping(value = "/couponusedhistory.do",method=RequestMethod.POST)
	public ModelAndView couponusedhistory(@RequestParam Map<String,String> map)  {
		ModelAndView mav = new ModelAndView();
		String enddate = (map.get("enddate")+" 23:59:59");
		map.put("enddate", enddate);
		List<UsagehistoryDTO> list = uservice.getusedcouponhistory(map);
		mav.addObject("list",list);
		mav.setViewName("jsonView");
		return mav;
	}
}
