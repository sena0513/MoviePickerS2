package client.movies.bean;

import lombok.Data;

@Data
public class BoxOfficeInit {
   private int rank;
   private String movieNm;
   private String salesShare;
   private String openDt;
   private String audiAcc;
   
   public BoxOfficeInit(String movieNm) {
      this.movieNm = movieNm;
   }
}