package com.nt.test;

import com.nt.comp.Flipkart;
import com.nt.factory.FlipkartFactory;

public class StrategyDPTest {
	public static void main(String[] args) {
		Flipkart fpkt = null;
		try {
			// get Target class object using Factory
			fpkt = FlipkartFactory.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("Problem in Dependency Management....");
		}
		// Invoke business method
		System.out.println(fpkt.shopping(new String[] { "Rain Coat", "Umbrella", "Flu Tablets" }, new float[] { 2500, 500, 500 }));

	}
}
