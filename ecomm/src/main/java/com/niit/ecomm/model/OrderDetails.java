package com.niit.ecomm.model;

import java.util.List;
import java.io.Serializable;
import java.sql.Date;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

@Entity
public class OrderDetails implements Serializable{

	@Id
	@GeneratedValue
	private int orderDetailsId;
	private String OrderDetailsStatus;
	private int grandTotal;
	
	@ManyToOne
	@JoinColumn(name="useId")
	Users user;
	
	public Users getUser() {
		return user;
	}
	public void setUser(Users user) {
		this.user = user;
	}
	public int getOrderDetailsId() {
		return orderDetailsId;
	}
	public void setOrderDetailsId(int orderDetailsId) {
		this.orderDetailsId = orderDetailsId;
	}
	public String getOrderDetailsStatus() {
		return OrderDetailsStatus;
	}
	public void setOrderDetailsStatus(String orderDetailsStatus) {
		OrderDetailsStatus = orderDetailsStatus;
	}
	public int getGrandTotal() {
		return grandTotal;
	}
	public void setGrandTotal(int grandTotal) {
		this.grandTotal = grandTotal;
	}
	
	//Added From Animesh//
	@OneToMany(mappedBy="orderDetails")
	List<CartItems> cartItems;
	private Date orderDate;
	public List<CartItems> getCartItems() {
		return cartItems;
	}
	public void setCartItems(List<CartItems> cartItems) {
		this.cartItems = cartItems;
	}
	public Date getOrderDetails() {
	return orderDate;
	}
	public void setOrderDetails(Date orderDate) {
	this.orderDate = orderDate;
	}
	
	
	}
