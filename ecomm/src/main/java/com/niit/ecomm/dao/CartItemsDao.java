package com.niit.ecomm.dao;


import java.util.List;

import com.niit.ecomm.model.CartItems;
import com.niit.ecomm.model.OrderDetails;
import com.niit.ecomm.model.Users;

public interface CartItemsDao {
	public void addCartItems(CartItems cartItems);
	public List<CartItems> getAllCartItems();
	public void updateCartItems(CartItems cartItems);
	public List<CartItems> getCartItemsByCartId(int cid);
	public void deleteCartItems(int i);
	public List<CartItems> getCartItemsByOrderId(int i);
	public List<CartItems> getCartItemsByOrderDetails(OrderDetails orderDetails);
	

}
