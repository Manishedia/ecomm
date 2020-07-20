package com.niit.ecomm.controller;

import java.io.File;
import java.io.IOException;
import java.nio.file.*;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.niit.ecomm.dao.CategoryDao;
import com.niit.ecomm.dao.ProductDao;
import com.niit.ecomm.model.Category;
import com.niit.ecomm.model.Product;
import com.niit.ecomm.model.Users;



@Controller
public class ProductController {
	@Autowired
	ProductDao productDao;
	@Autowired
	CategoryDao categoryDao;
	@RequestMapping("/productlist")
	public ModelAndView productlist() {
		List<Product> listProd = productDao.getAllProducts();
		// return new ModelAndView("viewusers","list",list);
		ModelAndView mv = new ModelAndView("productlist");
		mv.addObject("productsAttr", listProd);
		return mv;
	}
	
	@RequestMapping(value="/all/productdetails/{id}")  
    public ModelAndView edit(@PathVariable int id){  
         Product product=productDao.getProductById(id);
        return new ModelAndView("productdetails","product",product);  
    }  
	@RequestMapping("/admin/productform")
	public ModelAndView showProductform() {
		List<Category> categories=categoryDao.getAllCategory();
		ModelAndView nv=new ModelAndView("productform", "command", new Product());
		//model.addAttribute("product",new Product());
		nv.addObject("categories",categories);
		System.out.println("Size of category list " + categories.size());
		return nv;
		//return new ModelAndView("productform", "command", new Product());
	}
	
	@RequestMapping(value="/admin/updateproductform/{id}")
	public String getUpdateProductForm(@PathVariable int id,Model model){
		Product product=productDao.getProductById(id);
		List<Category> categories=categoryDao.getAllCategory();
		model.addAttribute("product",product);
		model.addAttribute("categories",categories);
		return "updateproductform";
	}
	
	 @RequestMapping(value="/admin/saveProduct",method = RequestMethod.POST)  
	    public String saveProd( @ModelAttribute("product") Product product,HttpServletRequest request,Model model)
	    {
		 
		 /*if(result.hasErrors()){//hasErrors return true if product details in not valid
			 System.out.println(result.hasErrors());
				model.addAttribute("categories",categoryDao.getAllCategory());
				return "productform";*/
				
		 	productDao.addProduct(product);
		 	MultipartFile prodImage=product.getImage();//image uploaded in the productform.jsp
			if(prodImage!=null && !prodImage.isEmpty()){
				//how to get rootdirectory
				String rootdirectory=request.getServletContext().getRealPath("/");
				System.out.println("Root Directory " + rootdirectory);
				//create a path
				Path paths=Paths.get(rootdirectory+"/WEB-INF/resources/images/"+product.getProductId()+".png");
				
					//it throws checked exception
					try {
						prodImage.transferTo(new File(paths.toString()));
					} catch (IllegalStateException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				
			}
			return "redirect:/productlist";
	    }
	 
	 @RequestMapping(value="/admin/updateProduct",method = RequestMethod.POST)  
	    public String updateProd(@Valid @ModelAttribute("product") Product product,BindingResult result,Model model,HttpServletRequest request)
	    {
		 
		 if(result.hasErrors()){//hasErrors return true if product details in not valid
			 System.out.println(result.hasErrors());
				model.addAttribute("categories",categoryDao.getAllCategory());
				return "updateproductform";
			}
		 	productDao.saveOrUpdateProduct(product);
		 	MultipartFile prodImage=product.getImage();//image uploaded in the productform.jsp
			if(prodImage!=null && !prodImage.isEmpty()){
				//how to get rootdirectory
				String rootdirectory=request.getServletContext().getRealPath("/");
				System.out.println("Root Directory " + rootdirectory);
				//create a path
				Path paths=Paths.get(rootdirectory+"/WEB-INF/resources/images/"+product.getProductId()+".png");
				
					//it throws checked exception
					try {
						prodImage.transferTo(new File(paths.toString()));
					} catch (IllegalStateException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				
			}
			return"redirect:/productlist";
	    }
	 
	 @RequestMapping(value="/admin/deleteproduct/{id}")
		public String deleteProduct(@PathVariable int id,HttpServletRequest request) {
			
		 	productDao.deleteProduct(id);;
			String rootdirectory=request.getServletContext().getRealPath("/");
			System.out.println("Root Directory " + rootdirectory);
			//create a path
			Path paths=Paths.get(rootdirectory+"/WEB-INF/resources/images/"+id+".png");
			
			if(Files.exists(paths)){
				try {
					Files.delete(paths);
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			return "redirect:/productlist";
		}
}
