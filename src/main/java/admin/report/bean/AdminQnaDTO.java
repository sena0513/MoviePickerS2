package admin.report.bean;

import lombok.Data;

@Data
public class AdminQnaDTO {
   private int seq;
   private String id;
   private String name;
   private String phone1;
   private String phone2;
   private String phone3;
   private String email1;
   private String email2;
   private String type;
   private String title;
   private String contents;
   private String regidate;
   private String situation;
   private String replycontents;
   private String replydate;
   
   private int rn;
}