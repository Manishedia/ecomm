package com.nt.comp;

import java.util.Arrays;
import java.util.Random;

//Following Rule 3 (final)
public final class Flipkart {

	// property
	private Courier courier; // Following Rule 1,2

	public Flipkart() {
		System.out.println("Flipkart:: 0-param Constructor");
	}
	
	public Flipkart(Courier courier) {
		System.out.println("Flipkart :: 1-Param Constructor");
		this.courier = courier;
	}

	/*
	 * public void setCourier(Courier courier) { // Following Rule 2
	 * System.out.println("Flipkart.setCourier()"); this.courier = courier; }
	 */

	// business method
	public String shopping(String[] items, float[] prices) {
		System.out.println("Flipkart.shopping()");
		float billAmount = 0.0f;
		int orderId = 0;
		String status = null;
		Random rad = null;

		// calculate bill Amount
		for (float p : prices)
			billAmount += p;

		// generate orderid dynamically as random number
		rad = new Random();
		orderId = rad.nextInt(10000);

		// use courier service for delivering the products
		status = courier.deliver(orderId);

		// return bill amount and courier details to customer
		return "Items purchased are :- " + Arrays.toString(items) + "\nHaving Prices are :- " + Arrays.toString(prices)
				+ " respectively\nThe Final Bill Amount is Rs. " + billAmount + "....\n" + status;
	}
}
