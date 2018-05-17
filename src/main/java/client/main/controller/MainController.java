package client.main.controller;
   
   import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
   import org.springframework.web.bind.annotation.RequestMapping;
   import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import admin.maincategory.bean.MainCategoryDTO;
import admin.maincategory.dao.MainCategoryDAO;


   
   @RequestMapping("/main")
   @Component
   public class MainController {
   
	   @Autowired
		private MainCategoryDAO mainCategoryDAO; 
	   
      @RequestMapping(value="/index.do", method=RequestMethod.GET)
      public ModelAndView index() {
         ModelAndView mav = new ModelAndView();
         List<MainCategoryDTO> list = mainCategoryDAO.getMovieList();
         mav.addObject("list", list);
         mav.addObject ("display","/include/body.jsp");
         mav.setViewName("/WEB-INF/main/index");
         
         return mav;
      }
      @RequestMapping(value="/loginForm.do", method=RequestMethod.GET)
      public ModelAndView loginForm(@RequestParam(required=false) String returnURL,
    		  @RequestParam(required=false) String mv_seq) {
         ModelAndView mav = new ModelAndView();
         
         
         if(returnURL!=null) {
        	 System.out.println(returnURL);
        	 mav.addObject("returnURL", returnURL);        
         }
         if(mv_seq!=null) {
        	 System.out.println(mv_seq);
        	 mav.addObject("mv_seq", mv_seq);
         }
         mav.addObject ("display","/WEB-INF/main/loginForm.jsp");
         mav.setViewName("/WEB-INF/main/index");
         
         return mav;
      }
      
      @RequestMapping(value="/warningPageForm.do", method=RequestMethod.GET)
      public ModelAndView warningPageForm() {
         ModelAndView mav = new ModelAndView();
         
         mav.addObject ("display","/WEB-INF/main/warningPage.jsp");
         mav.setViewName("/WEB-INF/main/index");
         
         return mav;
      }
      
      @RequestMapping(value="/dropOutForm.do", method=RequestMethod.GET)
      public ModelAndView dropOutForm() {
         ModelAndView mav = new ModelAndView();
         
         mav.addObject ("display","/WEB-INF/main/dropOutForm.jsp");
         mav.setViewName("/WEB-INF/main/index");
         
         return mav;
      }
      
   }