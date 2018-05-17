package client.movies.bean;

import lombok.Data;

@Data
public class MovieplatformDTO {
   private int seq;
   private String movienameforkr;
   private String movienameforeng;
   private String moviegenre;
   private String movieactor;
   private String moviemaker;
   private String moviecontent;
   private String movierunningtime;
   private String movieagelimit;
   private String moviedate;
   private String moviemakecountry;
   private String moviepostimg;
   private String moviesteelcutimg1;
   private String moviesteelcutimg2;
   private String moviesteelcutimg3;
   private String movietrailer;

   private String month;
   private String day;
   
   private String searchtext;
   private String searchfield;
   
}