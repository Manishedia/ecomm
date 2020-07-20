package com.niit.ecomm.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.ecomm.model.Cart;

@Repository("cartDao")
@Transactional

public class CartDaoImpl implements CartDao{
	
	@Autowired
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	protected Session getSession() {
		return sessionFactory.openSession();
	}

	public void addCart(Cart cart) {
		// TODO Auto-generated method stub
		Session session = getSession();
		session.save(cart);
		session.flush();
		session.close();
		
	}

}
