package com.niit.ecomm.dao;

import java.util.List;

import com.niit.ecomm.model.CartItems;
import com.niit.ecomm.model.ShippingAddress;
import com.niit.ecomm.model.Users;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;





@Repository("usersDao")
@Transactional
public class UsersDaoImpl implements UsersDao {

	@Autowired
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	protected Session getSession() {
		return sessionFactory.openSession();
	}

	public void addUsers(Users users) {
		

		Session session = getSession();

		//String s = users.getUserName();

		session.save(users);

		session.flush();

		session.close();

	}
	public List<Users> getAllUsers() {
		// TODO Auto-generated method stub
		Session session = getSession();

		Query query = session.createQuery("from Users"); 
		List<Users> customerList = query.list();

		return customerList;

	}
	
	public void updateUsers(Users users) {
		// TODO Auto-generated method stub
		Session session = getSession();

		//String s = users.getUserName();

		session.update(users);

		session.flush();

		session.close();
	}

	public void deleteUsers(int userId) {
		// TODO Auto-generated method stub
		
		Session session = getSession();

		Query query = session.createQuery("from Users where userId = ?");
		query.setInteger(0, userId);

		Users u=(Users) query.uniqueResult();
		session.delete(u);
		session.flush();

		session.close();
		
	}
	

	public Users getUsersById(String userId) {

		Session session = getSession();
		return (Users) session.get(Users.class, userId);
	}

	public void deleteUsers(String userId) {
		// TODO Auto-generated method stub
		
	}

	public boolean checkUserId(String userId) {
		Session session = getSession();
		List <Users> list;
		Query query = session.createQuery("from Users where userId = ?");
		query.setString(0, userId);

		list = query.list();
		if(list.isEmpty())
		{
			return true;
		}
		
		else
		{
			return false;
		}
		
	}

	public void addShippingAddress(ShippingAddress shippingaddress) {

		Session session = getSession();
		session.save(shippingaddress);

		session.flush();

		session.close();
		
	}

	public void saveOrUpdateUsers(Users users) {
		Session session = getSession();
		session.saveOrUpdate(users);
		session.flush();
		session.close();
		
	}

	public ShippingAddress getShippingAddressById(int id) {
		Session session = getSession();
		List <ShippingAddress> list;
		Query query = session.createQuery("from ShippingAddress where id = ? ");
		query.setInteger(0, id);
		list = query.list();
		session.close();
		return list.get(0);
		
		
		
	}

	public List<ShippingAddress> getShippingAddressByUserId(String userId) {
			
		Session session = getSession();
		List <ShippingAddress> list;
		Query query = session.createQuery("from ShippingAddress where user.userId = ? ");
		query.setString(0, userId);
		list = query.list();
		session.close();
		return list;
	}



}
