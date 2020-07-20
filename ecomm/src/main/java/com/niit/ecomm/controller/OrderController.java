package com.niit.ecomm.controller;
import java.security.Principal;
import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.niit.ecomm.dao.CartItemsDao;
import com.niit.ecomm.dao.OrderDetailsDao;
import com.niit.ecomm.dao.UsersDao;
import com.niit.ecomm.model.Cart;
import com.niit.ecomm.model.CartItems;
import com.niit.ecomm.model.OrderDetails;
import com.niit.ecomm.model.Users;

@Controller
public class OrderController {
@Autowired
UsersDao usersDao;
@Autowired
CartItemsDao cartItemsDao;
@Autowired
OrderDetailsDao orderDetailsDao;

@RequestMapping("/payment")
public ModelAndView payment(Principal principal, HttpSession httpSession){
	ModelAndView mv=new ModelAndView("payment");
	return mv;
}

@RequestMapping("/checkout")
public ModelAndView gotcheckout(Principal principal, HttpSession httpSession){
	ModelAndView mv=new ModelAndView("checkout");
	return mv;
}

@RequestMapping("/ackment")
public ModelAndView ack(Principal principal, HttpSession httpSession){
	String un=principal.getName();
	Users users=usersDao.getUsersById(un);
	OrderDetails orderDetails=(OrderDetails) httpSession.getAttribute("order");
	Cart cart=users.getCart();
	List<CartItems> cartItems=cartItemsDao.getCartItemsByCartId(cart.getCartId());
	for(CartItems cartItem:cartItems){
		cartItem.setOrderDetails(orderDetails);
		cartItem.setStatus(true);
		cartItemsDao.updateCartItems(cartItem);
	}
	
	orderDetails.setOrderDetailsStatus("Confirmed");
	
	ModelAndView mv=new ModelAndView("ackment");
	return mv;
	}



@RequestMapping("/cashpay")
public ModelAndView cashOnDelivary(Principal principal, HttpSession httpSession){
	ModelAndView mv=new ModelAndView("cashpay");
    return mv;
}

@RequestMapping("/orderDetails/{id}")
public ModelAndView orderDetails(@PathVariable int id , Principal principal,HttpSession httpSession){
	httpSession.setAttribute("shipping", usersDao.getShippingAddressById(id));
	int gt= (Integer) httpSession.getAttribute("grandTotal");
	httpSession.setAttribute("grandTotal",gt);
	ModelAndView mv=new ModelAndView("orderDetails");
	return mv;
}
}
	
	

