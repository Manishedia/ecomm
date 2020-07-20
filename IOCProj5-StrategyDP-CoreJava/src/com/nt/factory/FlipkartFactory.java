package com.nt.factory;

import com.nt.comp.BlueDart;
import com.nt.comp.Courier;
import com.nt.comp.DTDC;
import com.nt.comp.FirstFlight;
import com.nt.comp.Flipkart;

public class FlipkartFactory {
	public static Flipkart getInstance(String courierName) {

		Courier courier = null;
		Flipkart fpkt = null;

		//Create Dependent class object
		if (courierName.equalsIgnoreCase("dtdc"))
			courier = new DTDC();
		else if (courierName.equalsIgnoreCase("blueDart"))
			courier = new BlueDart();
		else if (courierName.equalsIgnoreCase("firstFlight"))
			courier = new FirstFlight();
		else
			throw new IllegalArgumentException("Invalid Courier Type");

		//Create Target class object
		fpkt = new Flipkart();
		
		//Assign Dependent class object to target class object
		fpkt.setCourier(courier);
		
		return fpkt;
	}
}
