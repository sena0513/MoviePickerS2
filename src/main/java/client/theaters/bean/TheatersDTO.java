package client.theaters.bean;
import lombok.Data;

@Data
public class TheatersDTO {
   private int seq;
   private String region;
   private String branch;
   private String address;
   private String screen;
   private int seats;
   private String regioncode;
   private int leftseat;
}