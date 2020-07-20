package com.niit.ecomm.dao;

import java.util.List;

import com.niit.ecomm.model.OrderDetails;
import com.niit.ecomm.model.Users;

public interface OrderDetailsDao {
	
	public OrderDetails getOrderDetailsByOrderDetailsId(int orderDetails);
	public boolean updateOrderDetails(OrderDetails orderDetails);
	public boolean deleteOrderDetails(OrderDetails orderDetails);
	public boolean insertOrderDetails(OrderDetails orderDetails);
	public List<OrderDetails> getOrderDetailsListByUser (Users user);
}

