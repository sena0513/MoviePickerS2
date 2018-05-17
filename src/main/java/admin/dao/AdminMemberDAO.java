package admin.dao;

import java.util.List;
import java.util.Map;

import admin.bean.AdminMemberDTO;

public interface AdminMemberDAO {
	public List<AdminMemberDTO> adminlogin(Map<String,String>map);
}
