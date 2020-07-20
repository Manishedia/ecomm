//29 June 2020 Project

package com.nt.test;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.FileSystemResource;
import org.springframework.core.io.Resource;

import com.nt.beans.WishMessageGenerator;

public class ConstructorInjectionTest {
	public static void main(String[] args) {
		// Create IOC container
		Resource res = null;
		BeanFactory factory = null;
		WishMessageGenerator generator = null;

		// Hold Spring Bean Configuration File Name and Location
		res = new FileSystemResource("src/com/nt/cfgs/applicationContext.xml");

		// Create IOC Container
		factory = new XmlBeanFactory(res);

		// Get Target Bean Class Object
		generator = (WishMessageGenerator) factory.getBean("wmg");

		// Invoke the Business Method
		System.out.println(generator.generateWishMessage("Manish"));
	}
}