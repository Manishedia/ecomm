package com.niit.ecomm.dao;
import java.util.List;
import com.niit.ecomm.model.Category;

public interface CategoryDao {
	public List<Category> getAllCategory();
	public  boolean insertCategory(Category category);

	public java.util.List<Category> getlist();

	public Category getCategoryById(int id);

	public boolean updateCategory(Category category);

	public boolean deleteCategory(int categoryid);
}
