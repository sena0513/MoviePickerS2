package client.helpCenter.bean;

import org.springframework.stereotype.Component;

import lombok.Data;

@Component
@Data
public class QnaPaging {
   private int currentPage;//현재페이지
   private int pageBlock;//[이전][1][2][3][다음]
   private int pageSize;//1페이지당 5개씩
   private int totalA;//총글수
   private StringBuffer pagingHTML;
   
   public void makePagingHTML(String searchtext) {
      pagingHTML = new StringBuffer();
      
      int totalP = (totalA+pageSize-1)/pageSize;//총페이지수
      int startPage = (currentPage-1)/pageBlock*pageBlock+1;
      int endPage = startPage+pageBlock-1;
      if(endPage > totalP) endPage = totalP;
      
      if(startPage > pageBlock)
         pagingHTML.append("[<a id=paging href='/mvProject/member/myInquiryQnAList.do?pg="+(startPage-1)+"&searchtext="+searchtext+"'>이전</a>]");
      
      for(int i=startPage; i<=endPage; i++) {
         if(i==currentPage)
            pagingHTML.append("[<a id=currentPaging href='/mvProject/member/myInquiryQnAList.do?pg="+i+"&searchtext="+searchtext+"'>"+i+"</a>]");
         else
            pagingHTML.append("[<a id=paging href='/mvProject/member/myInquiryQnAList.do?pg="+i+"&searchtext="+searchtext+"'>"+i+"</a>]");
      }
      
      if(endPage < totalP)
         pagingHTML.append("[<a id=paging href='/mvProject/member/myInquiryQnAList.do?pg="+(endPage+1)+"&searchtext="+searchtext+"'>다음</a>]");
         
   }
   
}