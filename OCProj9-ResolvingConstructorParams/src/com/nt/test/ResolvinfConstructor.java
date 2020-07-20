package com.nt.test;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.xml.XmlBeanFactory;
import org.springframework.core.io.ClassPathResource;

import com.nt.beans.Marks;

public class ResolvinfConstructor {
	public static void main(String[] args) {

		BeanFactory factory=null;
		Marks mk;
		//Create BeanFactory container
		factory=new XmlBeanFactory(new ClassPathResource("com/nt/cfgs/applicationContext.xml"));
		
		//get Bean object
		mk=factory.getBean("mk",Marks.class);
		System.out.println(mk);
		System.out.println("______________________________");
	}
}
