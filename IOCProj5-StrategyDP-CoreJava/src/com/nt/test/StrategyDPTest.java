package com.nt.test;

import com.nt.comp.Flipkart;
import com.nt.factory.FlipkartFactory;

public class StrategyDPTest {
	public static void main(String[] args) {
		Flipkart fpkt = null;
		fpkt = FlipkartFactory.getInstance("firstFlight");
		System.out.println(
				fpkt.shopping(new String[] { "Rain Coat", "Umbrella", "Flu Tablets" }, new float[] { 2500, 500, 500 }));

	}
}
