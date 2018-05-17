package admin.maincategory.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import admin.maincategory.bean.MainCategoryDTO;

@Component
@Transactional
public class MainCategoryDAOMybatis implements MainCategoryDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int InsertCategory(Map<String, String> map) {
		return sqlSession.insert("AdminmaincategorySQL.maininsertcategory",map);
	}

	@Override
	public List<MainCategoryDTO> getMovieList() {
		return sqlSession.selectList("AdminmaincategorySQL.getalldate");
	}

	@Override
	public int modifymaincategory(Map<String, String> map) {
		return sqlSession.update("AdminmaincategorySQL.modifymaincategory",map);
	}

	@Override
	public void deletemaincategory(String seq) {
		sqlSession.delete("AdminmaincategorySQL.deletemaincategory",seq);
		
	}

	@Override
	public int fixmaincategory(Map<String, String> map) {
		return sqlSession.update("maincategorySQL.maininsertcategoryfix",map);
	}

}
