package com.niit.ecomm.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.security.Principal;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.niit.ecomm.dao.CartDao;
import com.niit.ecomm.dao.CartItemsDao;
import com.niit.ecomm.dao.CategoryDao;
import com.niit.ecomm.dao.ProductDao;
import com.niit.ecomm.dao.UsersDao;
import com.niit.ecomm.dao.UsersDaoImpl;
import com.niit.ecomm.model.Cart;
import com.niit.ecomm.model.CartItems;
import com.niit.ecomm.model.Category;
import com.niit.ecomm.model.Product;
import com.niit.ecomm.model.Users;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class UserController {
	
	@Autowired
	UsersDao usersDao;
	
	@Autowired
	CategoryDao categoryDao;
	
	@Autowired 
	 ProductDao productDao;
	
	@Autowired 
	 CartDao cartDao;
	
	@Autowired 
	 CartItemsDao cartItemsDao;

	
	@RequestMapping("/index")
	public ModelAndView index() {
		return new ModelAndView("index");
	}
	
	@RequestMapping("/index1")
	public ModelAndView index1() {
		return new ModelAndView("index1");
	}
	
	@RequestMapping("/loginPage")
	public String loginPage(@RequestParam(required=false) String error,@RequestParam(required=false) String logout,Model model){
		if(error!=null)
		model.addAttribute("error","Invalid Username/Password");
		if(logout!=null)
			model.addAttribute("msg","Loggedout Successfully");
		return "login";
	}


	@RequestMapping("/home")
	public String home(HttpSession session, Principal userPrincipal, Model model) {

		if(userPrincipal!=null)
		{
		String userId = userPrincipal.getName();
		Users u = usersDao.getUsersById(userId);
		Cart c = u.getCart();
		int cid = c.getCartId();
		List<CartItems> citem = cartItemsDao.getCartItemsByCartId(cid);
		session.setAttribute("cartSize", citem.size());
		model.addAttribute("cartSize", citem.size());
		}
		List<Category> list = categoryDao.getAllCategory();
		session.setAttribute("list", list);
		model.addAttribute("list", list);
		
		return "home";
	}

	@RequestMapping("/showProductsByCategory/{categoryId}")  
    public ModelAndView showProductsByCategory(@PathVariable int categoryId ){  
	 System.out.println("cat id "+categoryId);
	 ModelAndView mv= new ModelAndView("products");
	 mv.addObject("categoryId",categoryId);
	 mv.addObject("productList", productDao.listByCategoryId(categoryId));
        return mv;  
    } 

	@RequestMapping("/usersform")
	public ModelAndView showform() {
		return new ModelAndView("usersform", "command", new Users());
	}


    @RequestMapping(value="/all/registerUser",method = RequestMethod.POST)  
    public String save(@ModelAttribute("user") Users users , HttpServletRequest request,Model model) {

		boolean b = usersDao.checkUserId(users.getUserId());
		if (b == true) {
			
			Cart c=new Cart();
			c.setCartDesc(users.getUserId()+ "'s Cart");
			cartDao.addCart(c);
			users.setCart(c);
			users.setRole("ROLE_USER");
			users.setEnabled(true);
			usersDao.addUsers(users);
			return "redirect:/loginPage";
			//return new ModelAndView("redirect:/loginPage");// will redirect to
															// viewusers request
															// mapping
		}
		
		else {
			/*ModelAndView mv = new ModelAndView("redirect:/usersform");
			mv.addObject("command", users);
			mv.addObject("errorMessage", "User Id already exists");*/
			model.addAttribute("command", users);
			model.addAttribute("errorMessage", "User Id already exists. Please try again!!");
			return "usersform";
		}
	}

	@RequestMapping("/admin/viewusers")
	public ModelAndView viewusers() {
		List<Users> ulist = usersDao.getAllUsers();
		return new ModelAndView("viewusers","list",ulist);
		/*ModelAndView mv = new ModelAndView("viewusers");
		mv.addObject("list", list);
		return mv;*/
	}

	@RequestMapping(value = "/all/editusers")
	public ModelAndView editUser(Model model,Principal principal) {
		String userId=principal.getName();
		Users users=usersDao.getUsersById(userId);
		return new ModelAndView("userseditform", "user", users);
	}

	@RequestMapping(value = "/all/editsave", method = RequestMethod.POST)
	public ModelAndView editsave(@ModelAttribute("user") Users users,HttpServletRequest request,Model model,Principal principal) {
		
		//Cart cart=users.getCart();
		//System.out.println(cart.getCartId());
		//users.setCart(cart);
		//users.setRole("ROLE_USER");
		usersDao.updateUsers(users);
		return new ModelAndView("redirect:/home");
	}
	

	@RequestMapping(value = "/admin/deleteusers/{id}", method = RequestMethod.GET)
	public ModelAndView delete(@PathVariable String id) {
		System.out.println("delete is called");
		usersDao.deleteUsers(id);
		return new ModelAndView("redirect:/viewusers");
	}

}