package com.nt.test;

import java.lang.reflect.Constructor;

public class NewInstanceTest2 {
	public static void main(String[] args) {

		Class c1 = null;
		Object obj1 = null;
		Constructor cons[] = null;

		try {
			// Load the class
			c1 = Class.forName(args[0]);

			// get All constructor of the loaded class
			cons = c1.getDeclaredConstructors();
			
			//create the object
			obj1=cons[0].newInstance(10,20);
			
			// Instantiate the class (Create the object of loaded class)
			System.out.println(obj1.toString()); // Method1 to Print

			System.out.println("___________________________");
		}

		catch (InstantiationException ie) {
			ie.printStackTrace();
		} catch (ClassNotFoundException cnf) {
			cnf.printStackTrace();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}


/*
 To run NewInstanceTest2.java...
 1. Right Click > Run As > Run Configurations
 2. In Main tab click on Search and Select com.nt.test.NewInstanceTest2
 3. In Argument tab, Program argument box type - com.nt.comp.Test
 4. Click Apply and Click Run
 */
 