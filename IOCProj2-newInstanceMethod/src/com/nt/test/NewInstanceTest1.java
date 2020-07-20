package com.nt.test;

public class NewInstanceTest1 {
	public static void main(String[] args) {

		Class c1 = null, c2 = null;
		Object obj1 = null, obj2 = null;

		try {
			// Load the class
			c1 = Class.forName(args[0]);

			// Instantiate the class (Create the object of loaded class)
			obj1 = c1.newInstance();
			System.out.println(obj1.toString()); //Method1 to Print
			
			System.out.println("So, In the above output we can see we have created output without new operator by Passing Command Line Aguments");

			// Load the class
			c2 = Class.forName(args[1]);

			// Instantiate the class (Create the object of loaded class)
			obj2 = c2.newInstance();
			System.out.println("\nCurrent Date & Time is  :- " + obj2); //Method2 to Print
			
			System.out.println("Getting Current Date & Time by Passing Command Line Aguments in Eclipse");
			
			//Load the class
			Class c = Class.forName("java.util.Date"); //[0 args]

			//Instantiate the class (Create the object of loaded class)
			Object obj = c.newInstance();
			System.out.println("\nCurrent Date & Time is :- " +obj);
			
			System.out.println("Same Thing is Being Done by Mentioning the Class name in forName() Method");
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
To run NewInstanceTest1.java...
1. Right Click > Run As > Run Configurations
2. In Main tab click on Search and Select com.nt.test.NewInstanceTest1
3. In Argument tab, Program argument box type - com.nt.comp.Test java.util.Date
4. Click Apply and Click Run
*/