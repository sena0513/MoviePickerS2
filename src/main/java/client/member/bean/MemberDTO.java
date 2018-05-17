package client.member.bean;

import lombok.Data;

@Data
public class MemberDTO {
   private String id;
   private String name;
   private String pw;
   private String birthyear;
   private String birthmonth;
   private String birthday;
   private String phone1;
   private String phone2;
   private String phone3;
   private String email1;
   private String email2;
   private String grade; //등급 포인트에 따른 등급
   private String gradePoint; //등급 포인트
   private String memberPoint; //회원 보유 포인트
   private String couponNumber; //쿠폰 매수
   private String nickName; // 닉네임
   private String profileImage; // 프로필 이미지
}