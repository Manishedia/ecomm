package com.nt.test;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.Resource;

import com.nt.comp.Flipkart;

public class StrategyDPTest {
	public static void main(String[] args) {
		BeanFactory factory=null;
		Resource res=null;
		Flipkart fpkt=null;
		
		//Hold spring bean configuration file
		res=new ClassPathResource("com/nt/cfgs/applicationContext.xml");
		
		//Create IOC container
		factory=new XmlBeanFactory(res);
		
		//get Target Bean object
		fpkt=factory.getBean("fpkt",Flipkart.class);
		
		//Invoke the methods
		System.out.println(fpkt.shopping(new String[] {"PPEKit", "MASK", "Sanitizer"},new float[] {2000,500,200}));
	}
}
