package admin.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import admin.bean.AdminMemberDTO;

@Component
@Transactional
public class AdminMemberMybatis implements AdminMemberDAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	   public List<AdminMemberDTO> adminlogin(Map<String,String>map) {      
	      List<AdminMemberDTO> memberDTO = sqlSession.selectList("adminmemberSQL.adminlogin",map);
	      return memberDTO;
	   }
	

}
