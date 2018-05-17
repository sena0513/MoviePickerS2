package admin.bean;

public class AdminMemberDTO {
	private String adminid;
	private String adminpw;
	public String getAdminid() {
		return adminid;
	}
	public void setAdminid(String adminid) {
		this.adminid = adminid;
	}
	public String getAdminpw() {
		return adminpw;
	}
	public void setAdminpw(String adminpw) {
		this.adminpw = adminpw;
	}
	public AdminMemberDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AdminMemberDTO(String adminid, String adminpw) {
		super();
		this.adminid = adminid;
		this.adminpw = adminpw;
	}
	
}
	