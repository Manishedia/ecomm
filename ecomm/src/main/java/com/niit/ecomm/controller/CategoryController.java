package com.niit.ecomm.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.niit.ecomm.dao.CategoryDao;
import com.niit.ecomm.model.Category;


@Controller
public class CategoryController {
	@Autowired
	CategoryDao categoryDao;
	@RequestMapping("/admin/addCategory")
	public ModelAndView showform(){
		return new ModelAndView("addCategory","command",new Category());
	}


	@RequestMapping(value="/admin/saveCategory",method = RequestMethod.POST)
	public ModelAndView save(@ModelAttribute("Category") Category category)
	{
		categoryDao.insertCategory(category);
		return new ModelAndView("redirect:/admin/viewCategory");
	}
	
	@RequestMapping("/admin/viewCategory")
	public ModelAndView viewCategory(){
		List<Category> List=categoryDao.getAllCategory();
		return new ModelAndView("viewCategory","list",List);
	}

	@RequestMapping(value="/admin/editCategory/{id}")
	public ModelAndView edit (@PathVariable int id) {
		Category category=categoryDao.getCategoryById(id);
		return new ModelAndView("categoryEditForm","command",category);
	}

	@RequestMapping(value="/admin/editsaveCategory",method = RequestMethod.POST)
	public ModelAndView editsave(@ModelAttribute("Category") Category category){
		categoryDao.updateCategory(category);
		return new ModelAndView("redirect:/viewCategory");
	}


	@RequestMapping(value="/admin/deleteCategory/{id}",method = RequestMethod.GET)
	public ModelAndView delete(@PathVariable int id) {
	System.out.println("Delete is called");
	categoryDao.deleteCategory(id);
	return new ModelAndView("redirect:/viewCategory");
	}

}
