package client.ticket.bean;

import lombok.Data;

@Data
public class TicketScheduleTimeDTO {
   private String year;
   private String month;
   private String day;
   private String week;
   private String theaterdate;
}