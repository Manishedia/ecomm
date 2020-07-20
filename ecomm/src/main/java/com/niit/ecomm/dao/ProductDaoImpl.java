package com.niit.ecomm.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.niit.ecomm.model.Product;
import com.niit.ecomm.model.Users;


@Repository("productDao")
@Transactional

public class ProductDaoImpl implements ProductDao{
	@Autowired
	private SessionFactory sessionFactory;

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	protected Session getSession() {
		return sessionFactory.openSession();
	}

public void addProduct(Product product) {
		

		Session session = getSession();

		//String s = users.getUserName();

		session.save(product);

		session.flush();

		session.close();

	}
	public List<Product> getAllProducts() {
		
		Session session = getSession();

		Query query = session.createQuery("from Product"); 
		List<Product> customerList = query.list();

		return customerList;
		
	}

	public Product getProductById(int id) {
		Session session = getSession();
		return (Product) session.get(Product.class, id);
		
	}

	public void saveOrUpdateProduct(Product product) {
		Session session = getSession();
		session.saveOrUpdate(product);
		session.flush();
		session.close();
		
	}

	public List<Product> listByCategoryId(int categoryId) {
		Session session = getSession();
		Query query = session.createQuery("from Product where productCategory.categoryId = :categoryId");
		query.setParameter("categoryId", categoryId);
		List<Product> productList = query.list();
        session.close();
        System.out.println("list "+productList);
		return productList;
	}

	public void deleteProduct(int productId) {
		Session session = getSession();

		Query query = session.createQuery("from Product where productId = ?");
		query.setInteger(0, productId);

		Product p=(Product) query.uniqueResult();
		session.delete(p);
		session.flush();

		session.close();
		
		
	}

	public void updateProduct(Product product) {

		//sessionFactory.getCurrentSession().merge(product);

		//String s = users.getUserName();
		Session session = getSession();

		//String s = users.getUserName();

		session.update(product);

		session.flush();

		session.close();
	}

}
