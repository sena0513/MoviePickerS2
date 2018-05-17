package admin.timeschedule.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import admin.timeschedule.bean.AdminTimeScheduleDTO;

@Component
@Transactional
public class AdminTimeScheduleDAOMybatis implements AdminTimeScheduleDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void inserttimeschedulemovie(Map<String,String> map) {
		System.out.println(map.get("playingmoviegrade"));
		sqlSession.insert("AdmintimescheduleSQL.inserttimeschedulemovie",map);
	}

	@Override
	public List<AdminTimeScheduleDTO> getalldate() {
		return sqlSession.selectList("AdmintimescheduleSQL.getalldate");
	}

	@Override
	public void modifytimeschedulemovie(Map<String, String> map) {
		sqlSession.update("AdmintimescheduleSQL.modifytimeschedulemovie", map);
	}

	@Override
	public void deletetimeschedulemovie(Map<String,String> map) {
		sqlSession.delete("AdmintimescheduleSQL.deletetimeschedulemovie",map);
		
	}
	
	
}
