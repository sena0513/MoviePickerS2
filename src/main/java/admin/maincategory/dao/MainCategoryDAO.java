package admin.maincategory.dao;

import java.util.List;
import java.util.Map;

import admin.maincategory.bean.MainCategoryDTO;

public interface MainCategoryDAO {
	public int InsertCategory(Map<String,String> map);
	public List<MainCategoryDTO> getMovieList();
	public int modifymaincategory(Map<String,String> map);
	public void deletemaincategory(String seq);
	public int fixmaincategory(Map<String,String> map);
}
