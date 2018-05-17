package client.ticket.bean;

import lombok.Data;

@Data
public class TicketDTO {
   private String ticketmoviecode;
   private String ticketmoviename;
   private String ticketmoviegrade;
   private String ticketmoviebranch;
   private String ticketmoviescreen;
   private String ticketmoviedate;
   private String ticketmovieseat1;
   private String ticketmovieseat2;
   private String ticketmovieseat3;
   private String ticketmovieseat4;
   private String ticketmovieseat5;
   private int ticketmoviepeople;
   private int ticketmovieprice;
   private String id;
   private int pointPlused;
   private String ticketmovieposter;
   private int selectedmovieseq;
}